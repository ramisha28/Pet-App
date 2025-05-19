import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: MaterialColor(0xFF8D6E63, {
        50: Color(0xFFEFEBE9),
        100: Color(0xFFD7CCC8),
        200: Color(0xFFBCAAA4),
        300: Color(0xFFA1887F),
        400: Color(0xFF8D6E63),
        500: Color(0xFF795548),
        600: Color(0xFF6D4C41),
        700: Color(0xFF5D4037),
        800: Color(0xFF4E342E),
        900: Color(0xFF3E2723),
      }),
      scaffoldBackgroundColor: Color(0xFFFDF6EC),
      cardTheme: CardTheme(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}

class PawBackground extends StatelessWidget {
  final Widget child;

  const PawBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            image: DecorationImage(
              image: AssetImage('assets/images/paw_pattern.png'),
              repeat: ImageRepeat.repeat,
              opacity: 0.05,
            ),
          ),
        ),
        child,
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PawBackground(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.pets, size: 32),
                    SizedBox(width: 8),
                    Text(
                      'Pet Care',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(16),
                  children: [
                    _buildMenuCard(
                      context,
                      'Book Appointment',
                      Icons.calendar_today,
                      '/vet_appointment',
                    ),
                    _buildMenuCard(
                      context,
                      'Shop',
                      Icons.shopping_bag,
                      '/products',
                    ),
                    _buildMenuCard(
                      context,
                      'FAQ',
                      Icons.help,
                      '/faq',
                    ),
                    _buildMenuCard(
                      context,
                      'My Appointments',
                      Icons.list_alt,
                      '/view_appointments',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    IconData icon,
    String route,
  ) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48),
            SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}
