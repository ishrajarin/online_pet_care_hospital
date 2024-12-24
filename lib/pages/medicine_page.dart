import 'package:flutter/material.dart';

class MedicinePage extends StatelessWidget {
  const MedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Medicines',style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to Cart Page
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.8,
          ),
          itemCount: medicines.length,
          itemBuilder: (context, index) {
            final medicine = medicines[index];
            return _buildMedicineCard(context, medicine);
          },
        ),
      ),
    );
  }

  Widget _buildMedicineCard(BuildContext context, Map<String, dynamic> medicine) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                medicine['imageUrl'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        medicine['name'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (medicine['isRx'])
                      const Icon(
                        Icons.medical_services,
                        size: 16,
                        color: Colors.green,
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${medicine['price']}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.teal,
                    child: IconButton(
                      icon: const Icon(Icons.add, size: 18, color: Colors.white),
                      onPressed: () {
                        _showAddToCartMessage(context, medicine['name']);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAddToCartMessage(BuildContext context, String medicineName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$medicineName added to cart!'),
        backgroundColor: Colors.green,
      ),
    );
  }
}

final List<Map<String, dynamic>> medicines = [
  {
    'name': 'Salospir 100mg Tablet',

    'imageUrl': 'assets/images/medicine1.jpg',
    'price': 3.50,
    'isRx': true,
  },
  {
    'name': 'Xenical 120mg Tablet',
    'description': 'Weight management aid.',
    'imageUrl': 'assets/images/medicine2.jpg',
    'price': 3.00,
    'isRx': true,
  },
  {
    'name': 'Allergy Relief',

    'imageUrl': 'assets/images/medicine3.jpg',
    'price': 4.00,
    'isRx': true,
  },
  {
    'name': 'Prevomax',

    'imageUrl': 'assets/images/medicine4.jpg',
    'price': 3.50,
    'isRx': true,
  },

  {
    'name': 'Arber OTC Tablet',

    'imageUrl': 'assets/images/medicine5.jpg',
    'price': 3.50,
    'isRx': true,
  },
  {
    'name': 'Promicef',

    'imageUrl': 'assets/images/medicine6.jpg',
    'price': 3.50,
    'isRx': true,
  },
  {
    'name': 'Solensia Tablet',

    'imageUrl': 'assets/images/medicine7.jpg',
    'price': 3.50,
    'isRx': true,
  },
  {
    'name': 'OTC Tablet',

    'imageUrl': 'assets/images/medicine1.jpg',
    'price': 3.50,
    'isRx': true,
  },
  {
    'name': 'Melooxvet',

    'imageUrl': 'assets/images/medicine2.jpg',
    'price': 3.50,
    'isRx': true,
  },
  {
    'name': 'Atipam Tablet',

    'imageUrl': 'assets/images/medicine3.jpg',
    'price': 3.50,
    'isRx':true,
  },

  // Add more medicines as needed
];
