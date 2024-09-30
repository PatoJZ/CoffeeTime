import 'package:coffeetime/clases.dart';
import 'package:coffeetime/recipecardwidget.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Receta> favoritos;
  final Function(Receta) onFavoriteToggle;
  final Function(Receta) onRate;

  const FavoriteScreen({
    super.key,
    required this.favoritos,
    required this.onFavoriteToggle,
    required this.onRate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 235, 219, 204), // Color de fondo del AppBar
      ),
      body: favoritos.isEmpty
          ? const Center(
              child: Text(
                'No tienes recetas guardadas como favoritas.',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF6C4E31), // Color del texto
                ),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: favoritos.length,
              itemBuilder: (context, index) {
                final receta = favoritos[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RecipeCardWidget(
                    receta: receta,
                    isFavorite: true, // En esta pantalla siempre es favorito
                    onFavoriteToggle: (receta) {
                      // Eliminar de favoritos
                      onFavoriteToggle(receta);
                      // Mostrar un mensaje de snack
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${receta.nombre} eliminado de favoritos'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    onRate: onRate, // Permite calificar la receta
                  ),
                );
              },
            ),
    );
  }
}
