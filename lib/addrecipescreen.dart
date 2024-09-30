import 'package:coffeetime/clases.dart';
import 'package:flutter/material.dart';

class AddRecipeScreen extends StatefulWidget {
  final Function(Receta) onRecipeAdded;

  const AddRecipeScreen({super.key, required this.onRecipeAdded});

  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  
  // Lista de métodos de preparación disponibles
  final List<String> _metodosDisponibles = ['Espresso', 'Pour-over', 'French Press', 'Aeropress', 'Cold Brew'];
  
  // Lista de métodos seleccionados por el usuario
  List<String> _metodosSeleccionados = [];

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

          // Mostrar los métodos de preparación como botones de selección
          const Text(
            'Métodos de Preparación:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: _metodosDisponibles.map((String metodo) {
              return FilterChip(
                label: Text(metodo),
                selected: _metodosSeleccionados.contains(metodo),
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      _metodosSeleccionados.add(metodo);
                    } else {
                      _metodosSeleccionados.remove(metodo);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),

          // Botón para agregar la receta
          ElevatedButton(
            onPressed: () {
              final String nombre = _nameController.text;
              final List<String> ingredientes = _ingredientsController.text.split(',').map((e) => e.trim()).toList();
              final String descripcion = _descriptionController.text;
              
              // Crear nueva receta con los métodos seleccionados
              final nuevaReceta = Receta(
                nombre,
                ingredientes,
                Usuario('Nuevo Usuario'),
                descripcion,
                _metodosSeleccionados, // Usar los métodos seleccionados
              );
              
              widget.onRecipeAdded(nuevaReceta);

              // Limpiar los campos
              _nameController.clear();
              _ingredientsController.clear();
              _descriptionController.clear();
              _metodosSeleccionados.clear(); // Limpiar los métodos seleccionados
            },
            child: const Text('Añadir Receta'),
          ),
        ],
      ),
    );
  }
}
