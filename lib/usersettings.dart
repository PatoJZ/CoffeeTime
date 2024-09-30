// Pantalla de Ajustes de Usuario
import 'package:flutter/material.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuario'),
        backgroundColor: const Color.fromARGB(255, 155, 60, 60),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre: Usuario Ficticio',
              style: TextStyle(fontSize: 18, color: Color(0xFF6C4E31)),
            ),
            SizedBox(height: 10),
            Text(
              'Recetas en Favoritos: 3',
              style: TextStyle(fontSize: 16, color: Color(0xFF6C4E31)),
            ),
            SizedBox(height: 10),
            Text(
              'Recetas Añadidas: 2',
              style: TextStyle(fontSize: 16, color: Color(0xFF6C4E31)),
            ),
          ],
        ),
      ),
    );
  }
}
