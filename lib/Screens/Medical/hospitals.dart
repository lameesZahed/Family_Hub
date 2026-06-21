import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../Bloc/Medication/Hospitals/hospital_bloc.dart';
import '../../Bloc/Medication/Hospitals/hospital_event.dart';
import '../../Bloc/Medication/Hospitals/hospital_state.dart';
import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Components/Medication/hospital_cards.dart';
import '../../Services/location_services.dart';

class Hospitals extends StatefulWidget {
  const Hospitals({super.key});

  @override
  State<Hospitals> createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  @override
  void initState() {
    super.initState();
    loadHospitals();
  }

  Future<void> loadHospitals() async {
    try {
      final position = await LocationService().getCurrentLocation();

      if (!mounted) return;
      context.read<HospitalBloc>().add(
        LoadNearbyHospitalsEvent(
          latitude: position?.latitude ?? 30.0444,
          longitude: position?.longitude ?? 31.2357,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      context.read<HospitalBloc>().add(
        LoadNearbyHospitalsEvent(latitude: 30.0444, longitude: 31.2357),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MainDrawer(),
      appBar: MainAppBar(title: 'Nearby Hospitals'),
      body: BlocBuilder<HospitalBloc, HospitalState>(
        builder: (context, state) {
          if (state is HospitalLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HospitalError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: loadHospitals,
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }
          if (state is HospitalSuccess) {
            if (state.hospitals.isEmpty) {
              return const Center(child: Text('No hospitals found nearby'));
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: state.hospitals.length,
                itemBuilder: (context, index) {
                  final hospital = state.hospitals[index];
                  return HospitalCards(
                    name: hospital.name,
                    distanceLabel: hospital.distanceLabel,
                  );
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}