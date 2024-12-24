import 'package:flutter/material.dart';
import 'package:pet_care/pages/accessories_page.dart';
import 'package:pet_care/pages/adoption_page.dart';
import 'package:pet_care/pages/appointments.dart';
import 'package:pet_care/pages/doctors_page.dart';
import 'package:pet_care/pages/grooming_page.dart';
import 'package:pet_care/pages/medicine_page.dart';
import 'package:pet_care/pages/profile_page.dart';
import 'package:pet_care/pages/settings_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Kitty',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    SettingsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white70,
        selectedItemColor: Colors.teal[500],
        unselectedItemColor: Colors.blueGrey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(

            backgroundColor: Colors.teal,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 250,
                height: 220,
                child: Image.asset(
                  'assets/images/bg_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Hello Kitty',

                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    fontFamily: 'Cursive',
                    color: Colors.white,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  // Add your cart navigation functionality here
                },
              ),
            ],
          ),
          // Welcome Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Pamper Your Pet with Love and Care!',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent,
              ),
            ),
          ),
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 40.0,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: false,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),
          // Banner Image Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                'assets/images/banner.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Categories Section
          _buildSectionHeader(context, 'Shop by category'),
          _buildCategoryGrid(context),
          const SizedBox(height: 16),
          // Articles Section
          _buildSectionHeader(context, 'Articles'),
          _buildArticlesSection(context),
        ],
      ),
    );
  }


  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryGrid(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.3,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        List<Map<String, dynamic>> categories = [
          {
            'title': 'Pet Medicines',
            'icon': Icons.medical_services,
            'color': Colors.blue,
            'page': MedicinePage(),
          },
          {
            'title': 'Doctors',
            'icon': Icons.health_and_safety,
            'color': Colors.green,
            'page': DoctorsPage(),
          },
          {
            'title': 'Appointments',
            'icon': Icons.pets,
            'color': Colors.deepPurple,
            'page': Appointments(),
          },
          {
            'title': 'Grooming',
            'icon': Icons.brush,
            'color': Colors.purple,
            'page': GroomingPage(),
          },
          {
            'title': 'Accessories',
            'icon': Icons.store,
            'color': Colors.red,
            'page': AccessoriesPage(),
          },
          {
            'title': 'Adoption',
            'icon': Icons.favorite,
            'color': Colors.orange,
            'page': AdoptionPage(),
          },
        ];

        var category = categories[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => category['page']),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: category['color'],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(category['icon'], size: 40, color: Colors.white),
                const SizedBox(height: 8),
                Text(
                  category['title'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildArticlesSection(BuildContext context) {
    final articles = [
      {
        'title': 'Common Pet Diseases',
        'subtitle': 'Symptoms and treatments',
        'image': 'assets/images/awarness.jpg',
        'content': ' Many pets, including dogs, cats, rabbits, and birds, can be affected by a variety of illnesses that, if left untreated, can lead to serious complications or even death',
      },
      {
        'title': 'Dog Vaccination',
        'subtitle': 'Keep your pup healthy',
        'image': 'assets/images/vaccine.jpg',
        'content': 'Rabies: Rabies is a deadly viral disease that affects the nervous system and is transmitted through bites from infected animals. Rabies vaccination is required by law in many places',
      },
      {
        'title': 'How to Care for Rabbits',
        'subtitle': 'Tips for first-time owners',
        'image': 'assets/images/rabbit.jpg',
        'content': ' Rabbits need a spacious cage or pen with enough room to hop around and stretch out. Make sure their living space is clean, dry, and secure',
      },
      {
        'title': 'Cat Grooming 101',
        'subtitle': 'Best practices and tools',
        'image': 'assets/images/cat10.jpg',
        'content': 'Cat grooming is essential for maintaining your cat. Regular grooming helps prevent matting, reduces shedding, and keeps the skin and coat healthy',
      },
      {
        'title': 'Bird Care Guide',
        'subtitle': 'Feeding and maintenance',
        'image': 'assets/images/bird11.jpg',
        'content': 'Taking care of a bird requires attention to its physical, emotional, and social needs. Birds need a spacious cage that allows them to move around freely and should be placed in a safe, quiet area away from drafts and direct sunlight',
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: articles.map((article) {
          return _buildArticleCard(
            article['title']!,
            article['subtitle']!,
            article['image']!,
            article['content']!,
            context,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildArticleCard(
      String title,
      String subtitle,
      String imagePath,
      String content,
      BuildContext context,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailPage(
              title: title,
              subtitle: subtitle,
              imagePath: imagePath,
              content: content,
            ),
          ),
        );
      },
      child: Container(
        width: 300,  // Increased width for larger article cards
        height: 200,  // Increased height for larger article cards
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,  // Increased font size for article titles
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class ArticleDetailPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final String content;

  const ArticleDetailPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              content,  // Display content here
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 16),
            const Spacer(),
            const SizedBox(height: 60),  // Space for the bottom navigation bar
          ],
        ),
      ),
    );
  }
}
