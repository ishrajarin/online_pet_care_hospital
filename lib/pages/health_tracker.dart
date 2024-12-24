import 'package:flutter/material.dart';

class HealthTracker extends StatefulWidget {
  const HealthTracker({super.key});

  @override
  _HealthTrackerState createState() => _HealthTrackerState();
}

class _HealthTrackerState extends State<HealthTracker> {
  // List to store health entries
  List<Map<String, String>> healthEntries = [];

  // Controllers for text fields
  final TextEditingController weightController = TextEditingController();
  final TextEditingController conditionController = TextEditingController();
  final TextEditingController medicationController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  // Function to add health entry
  void _addHealthEntry() {
    if (weightController.text.isNotEmpty &&
        conditionController.text.isNotEmpty &&
        dateController.text.isNotEmpty) {
      setState(() {
        healthEntries.add({
          'weight': weightController.text,
          'condition': conditionController.text,
          'medication': medicationController.text,
          'date': dateController.text,
        });
      });

      // Clear text fields
      weightController.clear();
      conditionController.clear();
      medicationController.clear();
      dateController.clear();
    }
  }

  // Function to select date
  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        dateController.text = '${selectedDate.toLocal()}'.split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Tracker'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Track Your Pet\'s Health',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: weightController,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: conditionController,
              decoration: const InputDecoration(
                labelText: 'Health Condition',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: medicationController,
              decoration: const InputDecoration(
                labelText: 'Medication (optional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(
                labelText: 'Visit Date',
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: () => _selectDate(context), // Open date picker
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addHealthEntry,
              child: const Text('Add Health Entry'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Previous Entries',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: healthEntries.length,
                itemBuilder: (context, index) {
                  final entry = healthEntries[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 4,
                    child: ListTile(
                      title: Text('Weight: ${entry['weight']} kg'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Condition: ${entry['condition']}'),
                          Text('Medication: ${entry['medication']}'),
                          Text('Visit Date: ${entry['date']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
