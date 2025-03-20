import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/book_now_screen.dart';
import 'screens/wedding.dart'; // ✅ Import fixed

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const SauteAndSimmerApp());
}

class SauteAndSimmerApp extends StatelessWidget {
  const SauteAndSimmerApp({super.key}); // ✅ Use super parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sauté & Simmer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ).copyWith(
          secondary: const Color(0xFF8B0F0F),
        ),
        fontFamily: 'Archivo',
        scaffoldBackgroundColor: const Color(0xFFFFF1F1),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/wedding') {
          final weddingInfo = settings.arguments as Map<String, String>?;
          return MaterialPageRoute(
            builder: (context) => WeddingScreen(weddingInfo: weddingInfo ?? {}),
          );
        }
        return null; // Default route handling
      },
      routes: {
        '/': (context) => const BookNowScreen(),
      },
    );
  }
}
