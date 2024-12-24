import 'package:flutter/material.dart';

class AdoptionPage extends StatelessWidget {
  const AdoptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adopt a Pet'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPetCard(
            context,
            'Bella',
            'A friendly Golden Retriever looking for a new home.',
            'assets/images/cat1.jpg',

            'Golden Retriever',
            3, // Age
            'Female',
          ),
          _buildPetCard(
            context,
            'Max',
            'A playful rabbit that loves attention.',
            'assets/images/rabbit.jpg',
            ' white rabbit',
            2,
            'Male',
          ),
          _buildPetCard(
            context,
            'Luna',
            'A sweet Labrador that loves long walks.',
            'assets/images/dog.jpg',
            'Labrador Retriever',
            4,
            'Female',
          ),
          _buildPetCard(
            context,
            'Dona',
            'A sweet cat that loves long walks.',
            'assets/images/cat4.jpg',
            'Labrador Retriever',
            4,
            'Female',
          ),
          _buildPetCard(
            context,
            'peri',
            'A sweet playfull bird.',
            'assets/images/bird1.jpg',
            'Labrador Retriever',
            4,
            'Female',
          ),
          // Add more pet cards as needed
        ],
      ),
    );
  }

  // Pet card widget with a larger image
  Widget _buildPetCard(
      BuildContext context,
      String petName,
      String description,
      String imageUrl,
      String breed,
      int age,
      String gender) {
    return Container(
      width: double.infinity, // Takes full width of the screen
      height: 180, // Increased card height for larger image
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 6,
        child: ListTile(
          contentPadding: const EdgeInsets.all(12), // Reduced padding
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            petName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(description, style: const TextStyle(fontSize: 12)),
              const SizedBox(height: 4),
              Text('Breed: $breed', style: const TextStyle(fontSize: 12)),
              Text('Age: $age years', style: const TextStyle(fontSize: 12)),
              Text('Gender: $gender', style: const TextStyle(fontSize: 12)),
            ],
          ),
          trailing: ElevatedButton(
            onPressed: () {

              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Adopt'),
                  content: Text('Are you sure you want to adopt $petName?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Show pet details after adoption
                        Navigator.pop(context);
                        _showSuccessMessage(context, petName, breed, age, gender, description, imageUrl);
                      },
                      child: const Text('Adopt'),
                    ),
                  ],
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), // Reduced padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Adopt'),
          ),
        ),
      ),
    );
  }


  void _showSuccessMessage(
      BuildContext context,
      String petName,
      String breed,
      int age,
      String gender,
      String description,
      String imageUrl,
      ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PetDetailsPage(
          petName: petName,
          breed: breed,
          age: age,
          gender: gender,
          description: description,
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}

class PetDetailsPage extends StatelessWidget {
  final String petName;
  final String breed;
  final int age;
  final String gender;
  final String description;
  final String imageUrl;

  const PetDetailsPage({
    required this.petName,
    required this.breed,
    required this.age,
    required this.gender,
    required this.description,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$petName - Details'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView( // Add scrolling to prevent overflow
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(imageUrl, width: 300, height: 300, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(
              petName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Breed: $breed',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Age: $age years',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Gender: $gender',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Handle final adoption logic here
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Adoption Confirmed'),
                    content: Text('Congratulations! You have adopted $petName.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Adopt',style: TextStyle(
                color: Colors.white
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
