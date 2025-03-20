import 'package:flutter/material.dart';
import 'menu.dart';

class WeddingScreen extends StatelessWidget {
  final Map<String, String> weddingInfo;

  const WeddingScreen({super.key, required this.weddingInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F0), // Light pink background
      appBar: AppBar(
  backgroundColor: const Color(0xFF8B0000), // Dark red header
  title: Image.asset(
    'assets/images/logo.png', // ✅ Use image instead of text
    height: 60, // Adjust height as needed
    fit: BoxFit.contain,
  ),
  centerTitle: true,
),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Image section
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/Wedding.jpg', // Change path if needed
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // ✅ Event Title
            const Center(
              child: Text(
                'WEDDING',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Archivo',
                  color: Color(0xFF8B0000), // Dark red color
                ),
              ),
            ),
            const SizedBox(height: 4),

            const Center(
              child: Text(
                'Your registration will be verified prior to your call',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontFamily: 'Archivo',
                ),
              ),
            ),
            const SizedBox(height: 16),

            // ✅ Full Name Fields
            Row(
              children: [
                Expanded(
                  child: _buildInputField(
                    label: 'First Name',
                    hintText: weddingInfo['name']?.split(' ')[0] ?? '',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildInputField(
                    label: 'Last Name',
                    hintText: weddingInfo['name']?.split(' ')[1] ?? '',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ✅ Address Fields
            _buildInputField(
              label: 'Street Address',
              hintText: weddingInfo['address'] ?? '',
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: _buildInputField(
                    label: 'City',
                    hintText: weddingInfo['city'] ?? '',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildInputField(
                    label: 'Province',
                    hintText: weddingInfo['province'] ?? '',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ✅ Phone Number and Number of People Fields
            Row(
              children: [
                Expanded(
                  child: _buildInputField(
                    label: 'Phone Number',
                    hintText: weddingInfo['phone'] ?? '',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildInputField(
                    label: 'Number of People',
                    hintText: '2', // Example value
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ✅ Date and Time Fields
            Row(
              children: [
                Expanded(
                  child: _buildInputField(
                    label: 'Date',
                    hintText: weddingInfo['date'] ?? '',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildInputField(
                    label: 'Time',
                    hintText: weddingInfo['time'] ?? '',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ✅ Special Request
            _buildInputField(
              label: 'Do you have any special request?',
              hintText: weddingInfo['specialRequest'] ?? '',
              maxLines: 3,
            ),
            const SizedBox(height: 20),

            // ✅ Submit Button
  Center(
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MenuScreen(), // ✅ Navigation to MenuScreen
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
      'Submit',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'Archivo',
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

            const SizedBox(height: 20),
          ],
        ),
      ),

      // ✅ Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF8B0000),
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        onTap: (index) {
          // Handle navigation
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }

  // ✅ Reusable input field widget
  Widget _buildInputField({
    required String label,
    String? hintText,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'Archivo',
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
      ],
    );
  }
}
