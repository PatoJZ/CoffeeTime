import 'package:coffeetime/clases.dart';
import 'package:coffeetime/ratingbar.dart';
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
        backgroundColor: const Color(0xFF6C4E31),
      ),
      body: favoritos.isEmpty
          ? const Center(child: Text('No hay recetas guardadas.'))
          : ListView.builder(
              itemCount: favoritos.length,
              itemBuilder: (context, index) {
                final receta = favoritos[index];

                return RecipeCardWidget(
                  receta: receta,
                  isFavorite: true, // Siempre true, porque es pantalla de favoritos
                  onFavoriteToggle: onFavoriteToggle,
                  onRate: onRate,
                );
              },
            ),
    );
  }
}