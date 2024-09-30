import 'package:coffeetime/loginscreen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Café Recetas',
      theme: ThemeData(
        fontFamily: "Lonely",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const LoginScreen(),  // Cambiamos la pantalla inicial al MainMenu
    );
  }
}
