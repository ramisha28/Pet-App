import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Venue {
  final String name;
  final List<String> doctors;

  Venue(this.name, this.doctors);
}

class VetAppointmentPage extends StatefulWidget {
  const VetAppointmentPage({super.key});

  @override
  State<VetAppointmentPage> createState() => _VetAppointmentPageState();
}

class _VetAppointmentPageState extends State<VetAppointmentPage> {
  final _ownerNameController = TextEditingController();
  final _petNameController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  String? _selectedVenue;
  String? _selectedDoctor;
  String? _selectedPetType;
  List<String> _availableDoctors = [];

  final List<Venue> _venues = [
    Venue('Pet Care Hospital - Gulberg III, Lahore',
        ['Dr. Ahmed Khan', 'Dr. Fatima Zahra', 'Dr. Aisha Malik']),
    Venue('Pets & Vets Hospital - DHA Phase 5, Karachi',
        ['Dr. Muhammad Ali', 'Dr. Sara Qureshi', 'Dr. Bilal Hassan']),
    Venue('Animal Medical Center - F-7, Islamabad',
        ['Dr. Zainab Malik', 'Dr. Omar Farooq']),
    Venue('Royal Pets Clinic - Johar Town, Lahore',
        ['Dr. Hassan Siddiqui', 'Dr. Amina Rahman']),
    Venue('Veterinary Medical Center - University Road, Peshawar',
        ['Dr. Usman Khan', 'Dr. Nadia Tahir']),
    Venue('Dr. Khan\'s Pet Hospital - Gulshan-e-Iqbal, Karachi',
        ['Dr. Asad Khan', 'Dr. Saira Jabeen']),
    Venue('Companion Care Clinic - Bahria Town, Rawalpindi',
        ['Dr. Hamza Ali', 'Dr. Mehwish Kamal']),
    // ... Add more venues with their doctors ...
  ];

  final List<String> _petTypes = [
    'Cat (Persian)',
    'Cat (Siamese)',
    'Cat (British Shorthair)',
    'Cat (Maine Coon)',
    'Dog (German Shepherd)',
    'Dog (Labrador)',
    'Dog (Golden Retriever)',
    'Dog (Pug)',
    'Dog (Rottweiler)',
    'Rabbit (Holland Lop)',
    'Rabbit (Dutch)',
    'Parrot (African Grey)',
    'Parrot (Budgerigar)',
    'Hamster (Syrian)',
    'Hamster (Dwarf)',
    'Guinea Pig',
    'Fish (Goldfish)',
    'Fish (Betta)',
    'Goat',
    'Sheep'
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _timeController.text = picked.format(context);
      });
    }
  }

  Future<void> _bookAppointment() async {
    final ownerName = _ownerNameController.text;
    final petName = _petNameController.text;
    final venue = _selectedVenue;
    final date = _dateController.text;
    final time = _timeController.text;
    final doctor = _selectedDoctor;
    final petType = _selectedPetType;

    if (ownerName.isEmpty ||
        petName.isEmpty ||
        venue == null ||
        date.isEmpty ||
        time.isEmpty ||
        doctor == null ||
        petType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final appointment = {
      'ownerName': ownerName,
      'petName': petName,
      'venue': venue,
      'date': date,
      'time': time,
      'doctor': doctor,
      'petType': petType,
    };

    final appointments = prefs.getStringList('appointments') ?? [];
    appointments.add(jsonEncode(appointment));
    await prefs.setStringList('appointments', appointments);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Appointment booked successfully')),
    );

    // Clear fields after booking
    _ownerNameController.clear();
    _petNameController.clear();
    _dateController.clear();
    _timeController.clear();
    setState(() {
      _selectedVenue = null;
      _selectedDoctor = null;
      _selectedPetType = null;
      _availableDoctors = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Vet Appointment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _ownerNameController,
              decoration: const InputDecoration(labelText: 'Owner Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _petNameController,
              decoration: const InputDecoration(labelText: 'Pet Name'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedPetType,
              items: _petTypes.map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPetType = newValue;
                });
              },
              decoration: const InputDecoration(labelText: 'Select Pet Type'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedVenue,
              items: _venues.map((Venue venue) {
                return DropdownMenuItem<String>(
                  value: venue.name,
                  child: Text(venue.name),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedVenue = newValue;
                  _selectedDoctor = null;
                  if (newValue != null) {
                    final venue = _venues.firstWhere((v) => v.name == newValue);
                    _availableDoctors = venue.doctors;
                  } else {
                    _availableDoctors = [];
                  }
                });
              },
              decoration: const InputDecoration(labelText: 'Select Venue'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(labelText: 'Date'),
              onTap: () => _selectDate(context),
              readOnly: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _timeController,
              decoration: const InputDecoration(labelText: 'Time'),
              onTap: () => _selectTime(context),
              readOnly: true,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedDoctor,
              items: _availableDoctors.map((String doctor) {
                return DropdownMenuItem<String>(
                  value: doctor,
                  child: Text(doctor),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDoctor = newValue;
                });
              },
              decoration: const InputDecoration(labelText: 'Select Doctor'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _bookAppointment,
              child: const Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
