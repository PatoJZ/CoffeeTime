import 'package:coffeetime/clases.dart';
import 'package:coffeetime/recipecardwidget.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<Receta> _todasRecetas = [
  Receta(
    'Café Americano',
    ['Café', 'Agua'],
    Usuario('Usuario 1'),
    'Un café suave y diluido.',
    ['Espresso', 'French Press', 'Pour-over'], // Métodos de preparación
  ),
  Receta(
    'Cappuccino',
    ['Café', 'Leche', 'Espuma de leche'],
    Usuario('Usuario 2'),
    'Café con espuma y leche vaporizada.',
    ['Espresso', 'Máquina de Cappuccino'], // Métodos de preparación
  ),
  Receta(
    'Latte Caramel',
    ['Café', 'Leche', 'Caramelo'],
    Usuario('Usuario 3'),
    'Un toque dulce con caramelo.',
    ['Espresso', 'Aeropress'], // Métodos de preparación
  ),
  Receta(
    'Mocha',
    ['Café', 'Leche', 'Chocolate'],
    Usuario('Usuario 4'),
    'Café con chocolate.',
    ['Espresso', 'Aeropress'], // Métodos de preparación
  ),
  Receta(
    'Flat White',
    ['Café', 'Leche vaporizada'],
    Usuario('Usuario 5'),
    'Una mezcla equilibrada de café y leche.',
    ['Espresso', 'Máquina de Flat White'], // Métodos de preparación
  ),
  Receta(
    'Macchiato',
    ['Café', 'Leche'],
    Usuario('Usuario 6'),
    'Un espresso con un toque de leche.',
    ['Espresso', 'French Press'], // Métodos de preparación
  ),
  Receta(
    'Café Cortado',
    ['Café', 'Leche'],
    Usuario('Usuario 7'),
    'Similar al macchiato pero con más leche.',
    ['Espresso', 'Moka'], // Métodos de preparación
  ),
  Receta(
    'Affogato',
    ['Café', 'Helado de vainilla'],
    Usuario('Usuario 8'),
    'Café con helado, un postre delicioso.',
    ['Espresso'], // Método de preparación
  ),
  Receta(
    'Irish Coffee',
    ['Café', 'Whisky', 'Azúcar', 'Crema'],
    Usuario('Usuario 9'),
    'Café con whisky y crema.',
    ['Espresso', 'French Press'], // Métodos de preparación
  ),
  Receta(
    'Café Turco',
    ['Café molido fino', 'Agua', 'Azúcar'],
    Usuario('Usuario 10'),
    'Café preparado en estilo turco.',
    ['Preparación Turca'], 
  ),
  Receta(
    'Café de Olla',
    ['Café', 'Canela', 'Piloncillo'],
    Usuario('Usuario 11'),
    'Café tradicional mexicano.',
    ['Preparación en Olla'], 
  ),
  Receta(
    'Cold Brew',
    ['Café', 'Agua fría'],
    Usuario('Usuario 12'),
    'Café frío, ideal para el verano.',
    ['Cold Brew'], 
  ),
  Receta(
    'Espresso Tonic',
    ['Café', 'Agua tónica'],
    Usuario('Usuario 13'),
    'Café mezclado con agua tónica.',
    ['Espresso'], 
  ),
  Receta(
    'Café Bombón',
    ['Café', 'Leche condensada'],
    Usuario('Usuario 14'),
    'Café dulce con leche condensada.',
    ['Espresso'], 
  ),
  Receta(
    'Café Frappé',
    ['Café', 'Hielo', 'Azúcar'],
    Usuario('Usuario 15'),
    'Café frío batido con hielo.',
    ['Frappé'], 
  ),
  Receta(
    'Café Vienés',
    ['Café', 'Crema batida'],
    Usuario('Usuario 16'),
    'Café coronado con crema batida.',
    ['Espresso'], 
  ),
  Receta(
    'Ristretto',
    ['Café'],
    Usuario('Usuario 17'),
    'Una versión aún más concentrada del espresso.',
    ['Espresso'], 
  ),
  Receta(
    'Café Lungo',
    ['Café', 'Agua'],
    Usuario('Usuario 18'),
    'Un espresso diluido con más agua.',
    ['Espresso', 'Aeropress'], // Métodos de preparación
  ),
  Receta(
    'Café Marocchino',
    ['Café', 'Cacao', 'Leche'],
    Usuario('Usuario 19'),
    'Café con cacao y un toque de leche.',
    ['Espresso', 'Moka'], // Métodos de preparación
  ),
  Receta(
    'Café Helado',
    ['Café', 'Hielo', 'Leche'],
    Usuario('Usuario 20'),
    'Café frío con leche y hielo.',
    ['Cold Brew', 'Frappé'], // Métodos de preparación
  ),
];


  List<Receta> _recetasFiltradas = [];
  final List<Receta> _favoritos = [];

  @override
  void initState() {
    super.initState();
    _recetasFiltradas = _todasRecetas; // Mostrar todas las recetas inicialmente
  }

  void _actualizarFiltro(String query) {
    setState(() {
      _recetasFiltradas = _todasRecetas
          .where((receta) => receta.nombre.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _toggleFavorite(Receta receta) {
    setState(() {
      if (_favoritos.contains(receta)) {
        _favoritos.remove(receta);
      } else {
        _favoritos.add(receta);
      }
    });
  }

  void _showRatingDialog(Receta receta) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Califica la receta"),
          content: const Text("Selecciona tu calificación:"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorar Recetas'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 235, 219, 204),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (query) => _actualizarFiltro(query),
              decoration: InputDecoration(
                labelText: 'Buscar receta',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF6C4E31)),
                filled: true,
                fillColor: const Color(0xFFFFF3E0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _recetasFiltradas.isEmpty
                  ? const Center(
                      child: Text(
                        'No se encontraron resultados',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF6C4E31),
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _recetasFiltradas.length,
                      itemBuilder: (context, index) {
                        final receta = _recetasFiltradas[index];
                        final isFavorite = _favoritos.contains(receta);

                        return RecipeCardWidget(
                          receta: receta,
                          isFavorite: isFavorite,
                          onFavoriteToggle: _toggleFavorite,
                          onRate: _showRatingDialog,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
