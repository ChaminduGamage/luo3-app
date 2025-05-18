import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luo3_app/components/nav_bar.dart';
import 'package:luo3_app/models/user_models.dart';
import 'package:luo3_app/pages/renter/profile/add_new_address_page.dart';
import 'package:luo3_app/pages/auth/authenticate.dart';
import 'package:luo3_app/pages/auth/profile_complete_page.dart';
import 'package:luo3_app/pages/auth/verification_page.dart';
import 'package:luo3_app/pages/renter/drinking_mode.dart';
import 'package:luo3_app/pages/renter/filter_page.dart';
import 'package:luo3_app/pages/homes/vehicle-driver-home.dart';
import 'package:luo3_app/pages/renter/profile/manage_adress_page.dart';
import 'package:luo3_app/pages/renter/profile/notification_page.dart';
import 'package:luo3_app/pages/splash/splash_page_logo.dart';
import 'package:luo3_app/pages/vehicle%20owner/add_vehicle.dart';
import 'package:luo3_app/pages/vehicle%20owner/home.dart';
import 'package:luo3_app/pages/vehicle%20owner/vehicle_list_page.dart';
import 'package:luo3_app/services/auth_services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Luo3App());
}

class Luo3App extends StatelessWidget {
  const Luo3App({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModels?>.value(
      value: AuthServices().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Luo3 App',
        // Start with splash page which leads to Wrapper
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPageLogo(), // leads to Wrapper
          '/vehicle-owner-home': (context) => const VehicleOwnerHome(),
          '/vehicle-renter-home': (context) => const Luo3NavBar(),
          '/vehicle-driver-home': (context) => const VehicleDriverHomePage(),
          '/rental-agency-home': (context) => const Luo3NavBar(),
          '/repair-shop-owner-home': (context) => const Luo3NavBar(),
          '/default-home': (context) => const Luo3NavBar(),
          '/login': (context) => const Authenticate(),
          '/profile-complete': (context) => const ProfileCompletePage(),
          '/verification': (context) => const VerificationPage(),
          '/vehicle-list': (context) => const VehicleListPage(),
          '/add-vehicle': (context) => const AddVehiclePage(),
          '/filter-vehicle': (context) => const FilterPage(),
          '/drinking-driving': (context) => const DrinkingModePage(),
          '/notification': (context) => const NotificationProfileTilePage(),
          '/manage-address': (context) => const ManageAddressProfileTilePage(),
          '/add-address': (context) => const AddNewAddressPage(),
        },
      ),
    );
  }
}
