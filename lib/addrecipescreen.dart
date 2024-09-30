import 'package:coffeetime/clases.dart';
import 'package:flutter/material.dart';

class AddRecipeScreen extends StatelessWidget {
  final Function(Receta) onRecipeAdded;

  AddRecipeScreen({super.key, required this.onRecipeAdded});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Añadir Nueva Receta',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6C4E31),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nombre de la Receta'),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _ingredientsController,
            decoration: const InputDecoration(labelText: 'Ingredientes (separados por comas)'),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Descripción'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final String nombre = _nameController.text;
              final List<String> ingredientes = _ingredientsController.text.split(',').map((e) => e.trim()).toList();
              final String descripcion = _descriptionController.text;
              final nuevaReceta = Receta(nombre, ingredientes, Usuario('Nuevo Usuario'), descripcion);
              onRecipeAdded(nuevaReceta);

              // Limpiar los campos
              _nameController.clear();
              _ingredientsController.clear();
              _descriptionController.clear();
            },
            child: const Text('Añadir Receta'),
          ),
        ],
      ),
    );
  }
}