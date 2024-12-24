import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  TextEditingController petTypeController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController doctorNameController = TextEditingController();
  TextEditingController appointmentDateController = TextEditingController();

  // Function to pick an image from gallery or camera
  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // Use ImageSource.camera for camera
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);  // Update the selected image
      });
    }
  }

  // Function to show the DatePicker and set the date in the TextField
  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        // Format the selected date and display it in the TextField
        appointmentDateController.text = '${selectedDate.toLocal()}'.split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Enter Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),

            // Image Picker Section
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                child: _image == null
                    ? const Icon(
                  Icons.camera_alt,
                  size: 50,
                  color: Colors.white,
                )
                    : ClipOval(
                  child: Image.file(
                    _image!,
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Pet Type TextField
            TextField(
              controller: petTypeController,
              decoration: const InputDecoration(
                labelText: 'Enter Pet Type (e.g., Dog, Cat)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.pets),
              ),
            ),
            const SizedBox(height: 20),

            // Breed TextField
            TextField(
              controller: breedController,
              decoration: const InputDecoration(
                labelText: 'Enter Pet Breed (e.g., Labrador, Persian)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.pets),
              ),
            ),
            const SizedBox(height: 20),

            // Doctor Name TextField
            TextField(
              controller: doctorNameController,
              decoration: const InputDecoration(
                labelText: 'Enter Veterinarian Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.local_hospital),
              ),
            ),
            const SizedBox(height: 20),

            // Appointment Date TextField
            TextField(
              controller: appointmentDateController,
              decoration: const InputDecoration(
                labelText: 'Select Appointment Date',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () => _selectDate(context), // Open DatePicker on tap
            ),
            const SizedBox(height: 20),


            ElevatedButton(
              onPressed: () {
                if (_image != null &&
                    petTypeController.text.isNotEmpty &&
                    breedController.text.isNotEmpty &&
                    doctorNameController.text.isNotEmpty &&
                    appointmentDateController.text.isNotEmpty) {
                  // Show confirmation message and navigate back
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Appointment Booked!')),
                  );


                  Navigator.pop(context);
                } else {

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all details!')),
                  );
                }
              },
              child: const Text('Book Appointment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
