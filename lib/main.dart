import 'package:flutter/material.dart';
import 'presentation/pages/main/main_screen.dart';

void main() {
  // Setup Riverpod overriding, bindings, or DB warm-up here later
  runApp(const LexiVaultApp());
}

class LexiVaultApp extends StatelessWidget {
  const LexiVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LexiVault',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E3A8A), // Professional Deep Blue
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E3A8A),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system, // Supports automatic Dark/Light toggle
      builder: (context, child) {
        // Enforce RTL alignment natively for the entire application
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const MainScreen(),
    );
  }
}
