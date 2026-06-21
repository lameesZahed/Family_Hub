import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/Medication/Doctors/doctor_bloc.dart';
import '../../Bloc/Medication/Doctors/doctor_event.dart';
import '../../Bloc/Medication/Doctors/doctor_state.dart';
import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Components/Medication/doctor_cards.dart';
import '../../Services/location_services.dart';

class NearbyDoctors extends StatefulWidget {
  const NearbyDoctors({super.key});

  @override
  State<NearbyDoctors> createState() => _NearbyDoctorsState();
}

class _NearbyDoctorsState extends State<NearbyDoctors> {
  @override
  void initState() {
    super.initState();
    loadDoctors();
  }

  Future<void> loadDoctors() async {
    try {
      final position = await LocationService().getCurrentLocation();

      if (!mounted) return;
      context.read<DoctorBloc>().add(
        LoadNearbyDoctorsEvent(
          latitude: position?.latitude ?? 30.0444,
          longitude: position?.longitude ?? 31.2357,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      context.read<DoctorBloc>().add(
        LoadNearbyDoctorsEvent(latitude: 30.0444, longitude: 31.2357),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MainDrawer(),
      appBar: MainAppBar(title: 'Nearby Doctors'),
      body: BlocBuilder<DoctorBloc, DoctorState>(
        builder: (context, state) {
          if (state is DoctorLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is DoctorError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: loadDoctors,
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }
          if (state is DoctorSuccess) {
            if (state.doctors.isEmpty) {
              return const Center(child: Text('No doctors found nearby'));
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: state.doctors.length,
                itemBuilder: (context, index) {
                  final doctor = state.doctors[index];
                  return DoctorCards(
                    name: doctor.name,
                    type: doctor.category,
                    rate: doctor.rating.toStringAsFixed(1),
                    location: doctor.distanceLabel,
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