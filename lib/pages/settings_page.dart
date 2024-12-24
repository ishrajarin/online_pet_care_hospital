import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  bool isNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image with opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.5, // Set the opacity level for the background image
              child: Image.asset(
                'assets/images/back.jpg', // Set your image path here
                fit: BoxFit.cover, // Make the image cover the whole screen
              ),
            ),
          ),
          // Main content (Settings options)
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            children: [

              _buildSettingCard(
                icon: Icons.nightlight_round,
                title: "Dark Mode",
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),

              const SizedBox(height: 20),


              _buildSettingCard(
                icon: Icons.notifications,
                title: "Notifications",
                value: isNotificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    isNotificationsEnabled = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Reusable Setting Card Widget
  Widget _buildSettingCard({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Colors.teal),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            CupertinoSwitch(
              value: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
