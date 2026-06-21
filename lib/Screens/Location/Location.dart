import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../Components/Location/family_cards.dart';
import '../../Models/Location/location_model.dart';
import '../../Server/Authentication/api_client.dart';
import '../../Services/Location/location_api_service.dart';
import '../../Services/location_services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class FamilyLocationScreen extends StatefulWidget {
  const FamilyLocationScreen({super.key});

  @override
  State<FamilyLocationScreen> createState() => _FamilyLocationScreenState();
}

class _FamilyLocationScreenState extends State<FamilyLocationScreen> {
  GoogleMapController? mapController;
  final LocationService locationLogic = LocationService();
  final LocationApiService locationApi = LocationApiService();

  LatLng myCurrentPosition = const LatLng(30.0444, 31.2357);
  StreamSubscription? locationSubscription;
  Timer? sendLocationTimer;
  Timer? refreshFamilyTimer;

  Set<Marker> allMarkers = {};
  List<FamilyLocationModel> familyMembers = [];
  bool isLoadingFamily = false;
  String? myFirebaseUid;

  @override
  void initState() {
    super.initState();
    setupLocation();
  }

  @override
  void dispose() {
    locationSubscription?.cancel();
    sendLocationTimer?.cancel();
    refreshFamilyTimer?.cancel();
    super.dispose();
  }

  Future<void> setupLocation() async {
    final user = await ApiClient.getFreshUser();
    myFirebaseUid = user?.firebaseUid;

    final initialPos = await locationLogic.getCurrentLocation();
    if (initialPos != null && mounted) {
      setState(() => myCurrentPosition = initialPos);
      await _sendMyLocation(initialPos);
    }

    await loadFamilyLocations();

    locationSubscription = locationLogic.locationStream.listen((newLocation) {
      if (newLocation.latitude != null && newLocation.longitude != null && mounted) {
        setState(() {
          myCurrentPosition = LatLng(newLocation.latitude!, newLocation.longitude!);
          updateMyMarker();
        });
        mapController?.animateCamera(CameraUpdate.newLatLng(myCurrentPosition));
      }
    });

    sendLocationTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      _sendMyLocation(myCurrentPosition);
    });

    refreshFamilyTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      loadFamilyLocations();
    });
  }

  Future<void> _sendMyLocation(LatLng position) async {
    if (myFirebaseUid == null) return;
    try {
      await locationApi.sendMyLocation(
        firebaseUid: myFirebaseUid!,
        lat: position.latitude,
        lng: position.longitude,
      );
    } catch (e) {
      debugPrint('sendMyLocation error: $e');
    }
  }

  Future<void> loadFamilyLocations() async {
    if (myFirebaseUid == null) return;
    setState(() => isLoadingFamily = true);
    try {
      final members = await locationApi.getFamilyLocations(firebaseUid: myFirebaseUid!);
      if (!mounted) return;
      setState(() => familyMembers = members);
      await loadFamilyMarkers();
    } catch (e) {
      debugPrint('loadFamilyLocations error: $e');
    } finally {
      if (mounted) setState(() => isLoadingFamily = false);
    }
  }

  Future<void> loadFamilyMarkers() async {
    Set<Marker> tempMarkers = {};

    tempMarkers.add(
      Marker(
        markerId: const MarkerId('me'),
        position: myCurrentPosition,
        infoWindow: const InfoWindow(title: 'You'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
      ),
    );

    final List<double> markerColors = [
      BitmapDescriptor.hueRed,
      BitmapDescriptor.hueAzure,
      BitmapDescriptor.hueBlue,
      BitmapDescriptor.hueCyan,
      BitmapDescriptor.hueGreen,
      BitmapDescriptor.hueMagenta,
      BitmapDescriptor.hueOrange,
      BitmapDescriptor.hueViolet,
    ];

    for (int i = 0; i < familyMembers.length; i++) {
      final person = familyMembers[i];
      final double assignedColor = markerColors[i % markerColors.length];

      tempMarkers.add(
        Marker(
          markerId: MarkerId(person.firebaseUid),
          position: LatLng(person.lat, person.lng),
          icon: BitmapDescriptor.defaultMarkerWithHue(assignedColor),
          infoWindow: InfoWindow(
            title: person.name,
            snippet: person.timeLabel,
          ),
        ),
      );
    }

    if (mounted) {
      setState(() {
        allMarkers = Set<Marker>.from(tempMarkers);
      });
    }
  }

  void updateMyMarker() {
    if (!mounted) return;
    loadFamilyMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: myCurrentPosition,
                zoom: 14,
              ),
              markers: allMarkers,
              onMapCreated: (controller) {
                mapController = controller;
              },
              myLocationEnabled: false,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: isLoadingFamily && familyMembers.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : familyMembers.isEmpty
                ? const Center(child: Text('No family members found'))
                : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: familyMembers.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return FamilyCards(member: familyMembers[index]);
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}