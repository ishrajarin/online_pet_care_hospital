import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyPetProfile extends StatefulWidget {
  const MyPetProfile({super.key});

  @override
  _MyPetsPageState createState() => _MyPetsPageState();
}

class _MyPetsPageState extends State<MyPetProfile> {
  File? _image;


  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pet Profile'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture Section
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: _image == null
                          ? const AssetImage('assets/default_pet_image.jpg')
                      as ImageProvider
                          : FileImage(_image!),
                      backgroundColor: Colors.grey[200],
                    ),
                    const SizedBox(height: 12),
                    TextButton.icon(
                      onPressed: _pickImage,
                      icon: const Icon(Icons.image, color: Colors.teal),
                      label: const Text(
                        'Pick Image',
                        style: TextStyle(fontSize: 16, color: Colors.teal),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Pet Information Section
              _buildSectionTitle('Pet Information'),
              _buildCard(
                children: [
                  _buildPetInfoRow(Icons.pets, 'Name', 'Bella'),
                  _buildPetInfoRow(Icons.pets, 'Breed', 'Labrador Retriever'),
                  _buildPetInfoRow(Icons.cake, 'Age', '3 years'),
                  _buildPetInfoRow(Icons.transgender, 'Gender', 'Female'),
                  _buildPetInfoRow(Icons.color_lens, 'Color', 'Yellow'),
                  _buildPetInfoRow(Icons.monitor_weight, 'Weight', '25 kg'),
                ],
              ),

              const SizedBox(height: 20),

              // Medical Information Section
              _buildSectionTitle('Medical Information'),
              _buildCard(
                children: [
                  _buildPetInfoRow(Icons.local_hospital, 'Veterinarian',
                      'Dr. Smith, Greenfield Vet Clinic'),
                  _buildPetInfoRow(Icons.vaccines, 'Vaccinations',
                      'Rabies (Last done: June 2023)'),
                  _buildPetInfoRow(
                      Icons.warning, 'Health Conditions', 'Allergic to pollen'),
                  _buildPetInfoRow(Icons.medical_services, 'Medications',
                      'Antihistamines for allergy'),
                ],
              ),

              const SizedBox(height: 20),

              // Diet Information Section
              _buildSectionTitle('Diet Information'),
              _buildCard(
                children: [
                  _buildPetInfoRow(Icons.restaurant, 'Diet Plan',
                      'Dry kibble (2 cups per day)'),
                  _buildPetInfoRow(Icons.scale, 'Weight Management',
                      'Maintain current weight'),
                ],
              ),

              const SizedBox(height: 20),

              // Appointments Section
              _buildSectionTitle('Appointments'),
              _buildCard(
                children: [
                  _buildPetInfoRow(Icons.calendar_today, 'Next Appointment',
                      'June 2024 (Vaccination)'),
                  _buildPetInfoRow(Icons.calendar_month, 'Next Checkup',
                      'December 2024 (Routine Checkup)'),
                ],
              ),

              const SizedBox(height: 20),

              // Emergency Information Section
              _buildSectionTitle('Emergency Information'),
              _buildCard(
                children: [
                  _buildPetInfoRow(
                      Icons.contact_phone, 'Emergency Contact', 'John Doe: 123-456-7890'),
                  _buildPetInfoRow(
                      Icons.shield, 'Insurance', 'PetCare Insurance Co.'),
                  _buildPetInfoRow(Icons.bloodtype, 'Blood Type', 'A+'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
    );
  }


  Widget _buildPetInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }


  Widget _buildCard({required List<Widget> children}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
