import 'package:coffeetime/clases.dart';
import 'package:coffeetime/explorescreen.dart';
import 'package:coffeetime/favoritescreen.dart';
import 'package:coffeetime/recipecardwidget.dart';
import 'package:coffeetime/usersettings.dart';
import 'package:flutter/material.dart';

import 'addrecipescreen.dart';

final Usuario usuarioActual = Usuario('John Doe');

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;

  final List<Receta> _recetas = [
    Receta('Café Espresso', ['Café', 'Agua'], Usuario('Usuario 1'),
        'Un café fuerte y concentrado.', ['Espresso']),
    Receta(
        'Latte Vainilla',
        ['Café', 'Leche', 'Vainilla'],
        Usuario('Usuario 2'),
        'Suave y dulce, con un toque de vainilla.',
        ['Espresso']),
    Receta('Cold Brew', ['Café', 'Agua fría'], Usuario('Usuario 3'),
        'Café frío, ideal para el verano.', ['Espresso']),
  ];

  final List<Receta> _favoritos = [];

  void _toggleFavorite(Receta receta) {
    setState(() {
      if (_favoritos.contains(receta)) {
        _favoritos.remove(receta);
      } else {
        _favoritos.add(receta);
      }
    });
  }

  void _addRecipe(Receta receta) {
    setState(() {
      _recetas.add(receta);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Coffee Time',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF6C4E31),
        leading: IconButton(
          icon: const Icon(Icons.person),
          color: const Color(0xFFFFEAC5),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      UserSettingsScreen(usuario: usuarioActual)),
            );
          },
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(
            recetas: _recetas,
            onFavoriteToggle: _toggleFavorite,
            favoritos: _favoritos,
            onRate: (Receta) {},
          ),
          const ExploreScreen(),
          AddRecipeScreen(onRecipeAdded: _addRecipe),
          FavoriteScreen(
            favoritos: _favoritos,
            onFavoriteToggle: _toggleFavorite,
            onRate: (Receta) {},
          ),
          UserSettingsScreen(usuario: usuarioActual),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF603F26),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explorar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Añadir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFFFEAC5),
        unselectedItemColor: const Color(0xFFFFDBB5),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

// Pantalla de Inicio
class HomeScreen extends StatelessWidget {
  final List<Receta> recetas;
  final List<Receta> favoritos;
  final Function(Receta) onFavoriteToggle;
  final Function(Receta) onRate;

  const HomeScreen({
    super.key,
    required this.recetas,
    required this.onFavoriteToggle,
    required this.favoritos,
    required this.onRate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Alinear a la izquierda
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Recetas recomendadas del día', // Título
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6C4E31),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: recetas.length,
            itemBuilder: (context, index) {
              final receta = recetas[index];
              final isFavorite = favoritos.contains(receta);

              return RecipeCardWidget(
                receta: receta,
                isFavorite: isFavorite,
                onFavoriteToggle: onFavoriteToggle,
                onRate: onRate,
              );
            },
          ),
        ),
      ],
    );
  }
}
