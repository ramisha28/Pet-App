import 'package:flutter/material.dart';
import 'package:pet_app/screens/login_page.dart';
import 'package:pet_app/screens/signup_page.dart';
import 'package:pet_app/screens/vet_appointment_page.dart';
import 'package:pet_app/screens/faq_page.dart';
import 'package:pet_app/screens/products_page.dart';
import 'package:pet_app/screens/view_appointments_page.dart';
import 'package:pet_app/screens/cart_page.dart';
import 'package:pet_app/screens/checkout_page.dart';
import 'package:pet_app/theme/app_theme.dart';

void main() {
  runApp(const PetApp());
}

class PetApp extends StatelessWidget {
  const PetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Care App',
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
      routes: {
        '/signup': (context) => const SignupPage(),
        '/vet_appointment': (context) => const VetAppointmentPage(),
        '/faq': (context) => FAQPage(),
        '/products': (context) => ProductsPage(),
        '/view_appointments': (context) => const ViewAppointmentsPage(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
      },
    );
  }
}
