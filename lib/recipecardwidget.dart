import 'package:coffeetime/clases.dart';
import 'package:coffeetime/ratingbar.dart';
import 'package:flutter/material.dart';

class RecipeCardWidget extends StatelessWidget {
  final Receta receta;
  final bool isFavorite;
  final Function(Receta) onFavoriteToggle;
  final Function(Receta) onRate;

  const RecipeCardWidget({
    Key? key,
    required this.receta,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.onRate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFFDBB5),
      margin: const EdgeInsets.all(10),
      child: ExpansionTile(
        leading: const Icon(Icons.local_cafe, color: Color(0xFF603F26)),
        title: Text(
          receta.nombre,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6C4E31),
          ),
        ),
        subtitle: Text(
          'Ingredientes: ${receta.ingredientes.join(', ')}',
          style: const TextStyle(color: Color(0xFF603F26)),
        ),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : const Color(0xFF6C4E31),
          ),
          onPressed: () => onFavoriteToggle(receta),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  "Descripción:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  receta.descripcion,
                  style: const TextStyle(color: Color(0xFF603F26)),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Métodos de Preparación:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Column(
                  children: receta.metodosPreparacion.map((String metodo) {
                    return ElevatedButton(
                      onPressed: () {
                        // Aquí puedes manejar la selección del método
                        print('Método seleccionado: $metodo');
                      },
                      child: Text(metodo),
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {
                        // Lógica para compartir la receta
                      },
                    ),
                    RatingBar(receta: receta),
                    
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
