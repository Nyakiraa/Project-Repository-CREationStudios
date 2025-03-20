import 'package:flutter/material.dart';
import 'receipt.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F0), // Light pink background
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B0000),
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
          fit: BoxFit.contain,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Load the Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/Payment.png', // ✅ Add your image here
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ReceiptScreen(), // ✅ Navigate to menu_set.dart
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFF8B0000), // Dark red
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  child: const Text(
    'Next',
    style: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}
