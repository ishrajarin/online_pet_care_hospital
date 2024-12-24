import 'package:flutter/material.dart';

class GroomingPage extends StatelessWidget {
  const GroomingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Pet Grooming Services'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/grooming.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            _buildGroomingServicesSection(context),
            _buildGroomingPackagesSection(),
            _buildPetGroomingProductsSection(),
          ],
        ),
      ),
    );
  }



  Widget _buildGroomingServicesSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Our Grooming Services',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'We provide a variety of grooming services to keep your pet looking and feeling great. '
                'From simple haircuts to full grooming packages, we have something for every pet.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          _buildServiceCard('Bath & Brush', Icons.shower, Colors.blue),
          const SizedBox(height: 16),
          _buildServiceCard('Full Grooming', Icons.brush, Colors.green),
          const SizedBox(height: 16),
          _buildServiceCard('Nail Clipping', Icons.pets, Colors.orange),
        ],
      ),
    );
  }

  // Grooming Package Section
  Widget _buildGroomingPackagesSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Grooming Packages',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildPackageCard('Basic Grooming', '\$25', 'Includes bath and brush'),
          const SizedBox(height: 16),
          _buildPackageCard('Premium Grooming', '\$45', 'Includes full grooming + nail clipping'),
          const SizedBox(height: 16),
          _buildPackageCard('Deluxe Grooming', '\$65', 'Full grooming + spa treatment + accessories'),
        ],
      ),
    );
  }

  // Pet Grooming Products Section
  Widget _buildPetGroomingProductsSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pet Grooming Products',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildProductCard('Pet Shampoo', '\$12.99', Icons.wash),
          const SizedBox(height: 16),
          _buildProductCard('Pet Brush', '\$8.99', Icons.brush),
          const SizedBox(height: 16),
          _buildProductCard('Nail Clipper', '\$5.99', Icons.cut),
        ],
      ),
    );
  }


  Widget _buildServiceCard(String title, IconData icon, Color color) {
    return Card(
      color: color.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: color, size: 40),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onTap: () {

        },
      ),
    );
  }


  Widget _buildPackageCard(String packageName, String price, String description) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        title: Text(
          packageName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: Text(
          price,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onTap: () {

        },
      ),
    );
  }


  Widget _buildProductCard(String productName, String price, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(
          productName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          price,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          // Add product purchase functionality or details page
        },
      ),
    );
  }
}
