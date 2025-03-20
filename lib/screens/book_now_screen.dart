import 'package:flutter/material.dart';
import '../widgets/event_card.dart';
import '../widgets/bottom_navigation.dart';
import 'wedding.dart'; // ✅ Import fixed

class BookNowScreen extends StatelessWidget {
  const BookNowScreen({super.key}); // ✅ Use super parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFFFF1F1),
        child: Column(
          children: [
            // 🔹 Header with Logo
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              color: const Color(0xFF8B0F0F),
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // 🔹 Main Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const Text(
                    'BOOK NOW',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF666666),
                      fontFamily: 'Archivo',
                    ),
                  ),
                  const SizedBox(height: 5),

                  const Divider(
                    color: Color(0xFFCCCCCC),
                    thickness: 1.0,
                    height: 20,
                  ),

                  const Text(
                    'Events',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF666666),
                      fontFamily: 'Archivo',
                    ),
                  ),
                  const SizedBox(height: 20),

                  _buildEventCards(context),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentRoute: '/book_now'), // ✅ Fixed
    );
  }

  Widget _buildEventCards(BuildContext context) {
  final List<Map<String, String>> events = [
    {'image': 'assets/images/Wedding.jpg', 'name': 'WEDDING'},
    {'image': 'assets/images/Birthday.jpg', 'name': 'BIRTHDAY'},
    {'image': 'assets/images/Social.jpg', 'name': 'SOCIAL EVENTS'},
    {'image': 'assets/images/Corporate.jpg', 'name': 'CORPORATE'},
    {'image': 'assets/images/Others.jpg', 'name': 'OTHERS'},
  ];

  return Column(
    children: events.map((event) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: EventCard(
          imageUrl: event['image']!,
          eventName: event['name']!,
          onTap: () {
            print('Tapped on ${event['name']}'); // ✅ Confirm tap is detected
            
            if (event['name'] == 'WEDDING') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WeddingScreen(
                    weddingInfo: {
                      'name': 'John Ballarda ',
                      'address': '123 Wedding Venue St.',
                      'city': 'New York',
                      'province': 'NY',
                      'phone': '+1234567890',
                      'date': '2025-12-12',
                      'time': '16:00',
                      'specialRequest': 'Vegetarian Menu',
                    },
                  ),
                ),
              );
            }
          },
        ),
      );
    }).toList(),
  );
}
}

