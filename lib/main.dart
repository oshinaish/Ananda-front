import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantCostApp());
}

class RestaurantCostApp extends StatelessWidget {
  const RestaurantCostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Cost Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The top bar of the app
      appBar: AppBar(
        title: const Text('Restaurant Cost Tracker 🍽️'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      // The main body of the screen
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // The first button
            ElevatedButton.icon(
              icon: const Icon(Icons.receipt_long),
              label: const Text('Upload Purchase Invoice'),
              onPressed: () {
                // TODO: Add camera/gallery functionality here
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20), // Spacing between buttons

            // The second button
            ElevatedButton.icon(
              icon: const Icon(Icons.inventory_2_outlined),
              label: const Text('Upload Inventory Out'),
              onPressed: () {
                // TODO: Add camera/gallery functionality here
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20), // Spacing between buttons

            // The third button
            ElevatedButton.icon(
              icon: const Icon(Icons.store_mall_directory_outlined),
              label: const Text('Upload Store Demand'),
              onPressed: () {
                // TODO: Add camera/gallery functionality here
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
