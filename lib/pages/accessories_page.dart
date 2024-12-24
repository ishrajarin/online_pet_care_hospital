import 'package:flutter/material.dart';

// Model class for Accessories
class Accessory {
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Accessory({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

class AccessoriesPage extends StatelessWidget {
  const AccessoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of accessories
    final List<Accessory> accessories = [
      Accessory(
        name: 'Cat Bag',
        description: 'Carry your cat easily.',
        imageUrl: 'assets/images/item1.jpg',
        price: 15.99,
      ),
      Accessory(
        name: 'Cat Litter',
        description: 'Dust-free and odor control cat litter.',
        imageUrl: 'assets/images/item2.jpg',
        price: 10.50,
      ),
      Accessory(
        name: 'Pet house',
        description: 'Get your pet a own house.',
        imageUrl: 'assets/images/item3.jpg',
        price: 8.99,
      ),
      Accessory(
        name: 'Cat litter',
        description: 'Dust free cat litter',
        imageUrl: 'assets/images/item4.jpg',
        price: 8.99,
      ),
      Accessory(
        name: 'Collar',
        description: 'Collars with name plate',
        imageUrl: 'assets/images/item5.jpg',
        price: 8.99,
      ),
      Accessory(
        name: 'Cat food',
        description: 'Flavourfull cat food',
        imageUrl: 'assets/images/item6.jpg',
        price: 8.99,
      ),
      Accessory(
        name: 'Bird toy',
        description: 'Bird colourfull toy',
        imageUrl: 'assets/images/item7.jpg',
        price: 8.99,
      ),

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Accessories'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: accessories.length,
        itemBuilder: (context, index) {
          final accessory = accessories[index];
          return _buildAccessoryCard(
            context,
            accessory.name,
            accessory.description,
            accessory.imageUrl,
            accessory.price,
          );
        },
      ),
    );
  }

  Widget _buildAccessoryCard(
      BuildContext context,
      String productName,
      String description,
      String imageUrl,
      double price,
      ) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: _getImage(imageUrl), // Using the helper method for image loading
        ),
        title: Text(
          productName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            const SizedBox(height: 8),
            Text(
              '\$$price',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Handle the purchase action
            _showPurchaseDialog(context, productName);
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.teal,
          ),
          child: const Text('Buy'),
        ),
      ),
    );
  }


  Widget _getImage(String imageUrl) {
    return imageUrl.startsWith('http')
        ? Image.network(
      imageUrl,
      width: 80,
      height: 80,
      fit: BoxFit.cover,
    )
        : Image.asset(
      imageUrl,
      width: 80,
      height: 80,
      fit: BoxFit.cover,
    );
  }

  void _showPurchaseDialog(BuildContext context, String productName) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Purchase Item'),
        content: Text('Are you sure you want to buy $productName?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {

              Navigator.pop(context);
              _showSuccessMessage(context, productName);
            },
            child: const Text('Buy'),
          ),
        ],
      ),
    );
  }

  void _showSuccessMessage(BuildContext context, String productName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$productName has been successfully purchased!'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
