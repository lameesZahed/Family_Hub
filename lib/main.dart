import 'package:family_hub/Components/Kitchen/recipe_details_image.dart';
import 'package:family_hub/Screens/Accounting/accounting.dart';
import 'package:family_hub/Screens/Authentication/New%20Password/forget_password.dart';
import 'package:family_hub/Screens/Authentication/Register/login.dart';
import 'package:family_hub/Screens/Authentication/New%20Password/otp.dart';
import 'package:family_hub/Screens/Authentication/Register/register.dart';
import 'package:family_hub/Screens/Authentication/New%20Password/reset_password.dart';
import 'package:family_hub/Screens/Authentication/Intro/splash_screen.dart';
import 'package:family_hub/Screens/Authentication/Intro/start.dart';
import 'package:family_hub/Screens/Calendar/calendar.dart';
import 'package:family_hub/Screens/Education/education.dart';
import 'package:family_hub/Screens/Kitchen/ai_recipe_generator.dart';
import 'package:family_hub/Screens/Kitchen/recipe_generated.dart';
import 'package:family_hub/Screens/Location/Location.dart';
import 'package:family_hub/Screens/Education/grades.dart';
import 'package:family_hub/Screens/Family%20Tree/family_tree.dart';
import 'package:family_hub/Screens/Kitchen/recipe_details.dart';
import 'package:family_hub/Screens/Menu/Family%20Management/family_management.dart';
import 'package:family_hub/Screens/Menu/Family%20Management/information.dart';
import 'package:family_hub/Screens/Menu/Family%20Management/family_members.dart';
import 'package:family_hub/Screens/Menu/settings.dart';
import 'package:family_hub/Screens/Menu/support.dart';
import 'package:family_hub/Screens/terms&conditions.dart';
import 'package:family_hub/Screens/Location/Location.dart';
import 'package:family_hub/Screens/Medical/pharmacy.dart';
import 'package:family_hub/Screens/Medical/hospitals.dart';
import 'package:family_hub/Screens/SOS/sos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'Bloc/Authentication/Family/family_bloc.dart';
import 'Bloc/Authentication/auth_bloc.dart';
import 'Bloc/Gallery/gallery_bloc.dart';
import 'Bloc/Medication/Doctors/doctor_bloc.dart';
import 'Bloc/Medication/Hospitals/hospital_bloc.dart';
import 'Bloc/Medication/Medicines/medicine_bloc.dart';
import 'Components/App Themes/app_theme.dart';
import 'Components/Navigation/customized_navigation_bar.dart';
import 'Screens/Authentication/Family/create_family.dart';
import 'Screens/Authentication/Family/family_id.dart';
import 'Screens/Document/documents.dart';
import 'Screens/Education/progress_tracker.dart';
import 'Screens/Education/recommended.dart';
import 'Screens/Education/tasks.dart';
import 'Screens/Gallery/gallery.dart';
import 'Screens/Kitchen/kitchen.dart';
import 'Screens/Lists/lists.dart';
import 'Screens/Medical/Details/add_edit_medicine.dart';
import 'Screens/Medical/Details/medicine.dart';
import 'Screens/Medical/medication.dart';
import 'Screens/Medical/nearby_doctors.dart';
import 'Screens/Menu/Family Management/admins.dart';
import 'Screens/Menu/Family Management/join_request.dart';
import 'Screens/Menu/Family Management/manage_children.dart';
import 'Screens/Menu/Family Management/permissions.dart';
import 'Screens/Menu/Profile/view_profile.dart';
import 'Screens/Menu/Saved/saved_categories.dart';
import 'Screens/Menu/payment.dart';
import 'Server/Authentication/api_client.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } else {
      Firebase.app();
    }
  } catch (e) {
    print("Firebase Initialization handled or already exists: $e");
  }
  await ApiClient.init();
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AuthBloc()),
          BlocProvider(create: (_) => FamilyBloc()),
          BlocProvider(create: (_) => DoctorBloc()),
          BlocProvider(create: (_) => HospitalBloc()),
          BlocProvider(create: (_) => MedicineBloc()),
          // BlocProvider(create: (_) => GalleryBloc()),

        ],
        child:const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light ,
      routes: {
        "Medication": (context)=> Medication(),
        "Lists": (context)=> Lists(),
        "Accounting": (context)=> Accounting(),
        "Pharmacy": (context)=> Pharmacy(),
        "NearbyDoctors": (context)=> NearbyDoctors(),
        "Hospitals": (context)=> Hospitals(),
        "AddEditMedicine": (context)=> AddEditMedicine(),
        "Support": (context)=>Support(),
        "Payment Methods": (context)=>Payment(),
        "Family Members": (context)=>FamilyMembers(),
        "Saved": (context)=>SavedCategories(),
        "Forget Password": (context)=>ForgetPassword(),
        "Reset Password": (context)=>ResetPassword(),
        "Family ID": (context)=>FamilyId(),
        "Create Family": (context)=>CreateFamily(),
        "Grades": (context)=>Grades(),
        "Kitchen": (context)=>Kitchen(),
        "Gallery": (context)=>Gallery(),
        "Documents": (context)=> Documents(),
        "Recommended": (context)=>Recommended(),
        "Tasks": (context)=>Tasks(),
        'Family ID': (context) => FamilyId(),
        'Create Family': (context) => CreateFamily(),
        "Profile": (context)=>ViewProfile(),
        'Home': (context) => CustomizedNavigationBar(),
        "Progress_Tracker": (context)=>ProgressTracker(),
        "Location": (context)=> FamilyLocationScreen(),
        "AI Recipe Generator": (context)=> AiRecipeGenerator(),
        "Recipe Generated": (context)=> RecipeGenerated(),
        "Recipe Details": (context)=> RecipeDetails(),
        "Settings": (context)=> Settings(),
        "Family Management": (context)=>FamilyManagement(),
        "Information": (context)=>Information(),
        "Admins": (context)=>Admins(),
        "Start": (context)=>Start(),
        "SOS": (context)=>Sos(),
        "Join Requests": (context)=>JoinRequest(),
        "Permissions": (context)=>Permissions(),
        "Manage Children": (context)=>ManageChildren(),

      },
      home: Scaffold(
        body: SplashScreen()
      )
 );
  }
}


