import 'package:flutter/material.dart';


class Doctor {
  final String name;
  final String specialty;
  final String imageUrl;
  final double rating;
  final String bio;

  Doctor({
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.rating,
    required this.bio,
  });
}

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key});

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  // Sample list of doctors
  final List<Doctor> doctors = [
    Doctor(
      name: 'Dr. Abida Rahman',
      specialty: 'Orthopedic Veterinarian',
      imageUrl: 'assets/images/doctor1.jpg',
      rating: 4.8,
      bio: 'Dr. Abida Rahman Specializes in bone and joint issues, including fractures and arthritis..',
    ),
    Doctor(
      name: 'Dr. Nadia Sultana',
      specialty: 'Cardiology Veterinarian',
      imageUrl: 'assets/images/doctor2.jpg',
      rating: 4.7,
      bio: 'Dr.   Nadia Sultana focuses on heart diseases and cardiovascular health in pets.',
    ),


    Doctor(
      name: 'Dr. Saira Zaman',
      specialty: 'Surgical Veterinarian ',
      imageUrl: 'assets/images/doctor3.jpg',
      rating: 4.7,
      bio: 'Dr.  Saira Zaman Specializes in performing surgeries, from routine procedures to complex surgeries.',
    ),
    Doctor(
      name: 'Dr. Amira Houqe',
      specialty: 'Dermatology Veterinarian',
      imageUrl: 'assets/images/doctor4.jpg',
      rating: 4.7,
      bio: 'Dr. Brown specializes in heart health for pets and has worked with various breeds.',
    ),
    Doctor(
      name: 'Dr. Salahuddin Ahmed',
      specialty: 'Dentistry Veterinarian',
      imageUrl: 'assets/images/doctor5.jpg',
      rating: 4.7,
      bio: 'Dr. Brown specializes in heart health for pets and has worked with various breeds.',
    ),
    Doctor(
      name: 'Dr. Hasan Mahmud',
      specialty: 'Cardiology Veterinarian',
      imageUrl: 'assets/images/doctor6.jpg',
      rating: 4.7,
      bio: 'Dr. Brown specializes in heart health for pets and has worked with various breeds.',
    ),
    Doctor(
      name: 'Dr. Rafiqur Rahman',
      specialty: 'Surgical Veterinarian ',
      imageUrl: 'assets/images/doctor7.jpg',
      rating: 4.7,
      bio: 'Dr. Brown specializes in heart health for pets and has worked with various breeds.',
    ),
    Doctor(
      name: 'Dr. Kazi Tarique',
      specialty: 'Cardiology Veterinarian',
      imageUrl: 'assets/images/doctor8.jpg',
      rating: 4.7,
      bio: 'Dr. Brown specializes in heart health for pets and has worked with various breeds.',
    ),
    Doctor(
      name: 'Dr. Shamsul Huda',
      specialty: 'Neurology Veterinarian',
      imageUrl: 'assets/images/doctor9.jpg',
      rating: 4.7,
      bio: 'Dr. Brown specializes in heart health for pets and has worked with various breeds.',
    ),
    Doctor(
      name: 'Dr. Rakibul Islam',
      specialty: 'Cardiology Veterinarian',
      imageUrl: 'assets/images/doctor10.jpg',
      rating: 4.7,
      bio: 'Dr. Brown specializes in heart health for pets and has worked with various breeds.',
    ),
    Doctor(
      name: 'Dr. Zakir Hossain',
      specialty: 'Cardiology Veterinarian',
      imageUrl: 'assets/images/doctor11.jpg',
      rating: 4.7,
      bio: 'Dr. Brown specializes in heart health for pets and has worked with various breeds.',
    ), Doctor(
      name: 'Dr. Emma Brown',
      specialty: 'Cardiology Veterinarian',
      imageUrl: 'assets/images/doctor12.jpg',
      rating: 4.7,
      bio: 'Dr. Brown specializes in heart health for pets and has worked with various breeds.',
    ),
    Doctor(
      name: 'Dr. Farida Sultana',
      specialty: 'Cardiology Veterinarian',
      imageUrl: 'assets/images/doctor13.jpg',
      rating: 4.7,
      bio: 'Dr. Brown specializes in heart health for pets and has worked with various breeds.',
    ),



    // Add more doctors here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Veterinary Doctors'),
      ),
      body: ListView.builder(

        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(doctor.imageUrl),
              ),
              title: Text(doctor.name),
              subtitle: Text(doctor.specialty),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoctorProfilePage(doctor: doctor),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DoctorProfilePage extends StatelessWidget {
  final Doctor doctor;

  const DoctorProfilePage({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctor.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(doctor.imageUrl), // Loading image from assets
                ),
              ),
              const SizedBox(height: 16),
              Text(
                doctor.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                doctor.specialty,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange),
                  const SizedBox(width: 8),
                  Text('${doctor.rating}'),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Bio:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(doctor.bio),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Implement booking logic here
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(

                        title: const Text('Book an Appointment'),
                        content: Text(
                            'Would you like to book an appointment with Dr. ${doctor.name}?'),
                        actions: [
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Confirm'),
                            onPressed: () {
                              // Handle appointment booking
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Appointment Confirmed'),
                                    content: Text(
                                        'Your appointment with Dr. ${doctor.name} has been confirmed!'),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Book an Appointment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
