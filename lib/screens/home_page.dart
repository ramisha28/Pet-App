import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/vet_appointment');
              },
              child: const Text('Book Vet Appointment'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/faq');
              },
              child: const Text('FAQ'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/products');
              },
              child: const Text('Pet Food & Accessories'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/view_appointments');
              },
              child: const Text('View Appointments'),
            ),
          ],
        ),
      ),
    );
  }
}
