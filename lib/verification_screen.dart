import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Required for Part 4

class VerificationScreen extends StatefulWidget {
  final File imageFile;

  const VerificationScreen({super.key, required this.imageFile});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool _isLoading = false;

  // --- API CONNECTION LOGIC (Part 4) ---
  Future<void> _uploadImage() async {
    setState(() {
      _isLoading = true;
    });

    // Replace with your actual Vercel deployment URL
    final uri = Uri.parse('https://restaurant-backend-xyz.vercel.app/api');
    final request = http.MultipartRequest('POST', uri);
    
    // Attach the image file
    request.files.add(
      await http.MultipartFile.fromPath('image', widget.imageFile.path),
    );

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        // Success
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('✅ Success! Data sent to Google Sheet.'), backgroundColor: Colors.green),
        );
        Navigator.of(context).pop(); // Go back to home screen
      } else {
        // Handle error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('❌ Error: Failed to upload. Status code: ${response.statusCode}')),
        );
      }
    } catch (e) {
      // Handle network or other errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ Error: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Data'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Confirm the image before uploading:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Display the selected image
            Image.file(widget.imageFile), 
            const SizedBox(height: 24),
            const Text(
              'Extracted data will be editable here in the future.',
              textAlign: TextAlign.center,
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Show a loading indicator or the button
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton.icon(
                    icon: const Icon(Icons.cloud_upload),
                    label: const Text('Confirm & Save'),
                    onPressed: _uploadImage, // Connect to Vercel API
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      textStyle: const TextStyle(fontSize: 18),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
