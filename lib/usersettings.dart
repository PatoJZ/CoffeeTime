import 'package:coffeetime/clases.dart';
import 'package:flutter/material.dart';

class UserSettingsScreen extends StatefulWidget {
  final Usuario usuario;

  const UserSettingsScreen({Key? key, required this.usuario}) : super(key: key);

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  final List<String> _metodosDisponibles = ['Espresso', 'Pour-over', 'French Press', 'Aeropress'];
  final List<String> _tiposCafeDisponibles = ['Arábica', 'Robusta', 'Mezcla'];
  
  List<String> _metodosSeleccionados = [];
  List<String> _tiposCafeSeleccionados = [];

  @override
  void initState() {
    super.initState();
    // Inicializar con las preferencias del usuario actual
    _metodosSeleccionados = widget.usuario.metodosPreferidos;
    _tiposCafeSeleccionados = widget.usuario.tiposCafePreferidos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferencias del Usuario'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 235, 219, 204),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Información del Usuario
              const Text(
                'Información del Usuario:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Nombre: ${widget.usuario.nombre}',
                style: const TextStyle(fontSize: 18, color: Color(0xFF6C4E31)),
              ),
              const SizedBox(height: 5),
             
              const Divider(), // Separador visual
              
              // Preferencias de Métodos de Preparación
              const Text(
                'Métodos de Preparación Preferidos:',
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
              
              // Preferencias de Tipos de Café
              const Text(
                'Tipos de Café Preferidos:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: _tiposCafeDisponibles.map((String tipo) {
                  return FilterChip(
                    label: Text(tipo),
                    selected: _tiposCafeSeleccionados.contains(tipo),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          _tiposCafeSeleccionados.add(tipo);
                        } else {
                          _tiposCafeSeleccionados.remove(tipo);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              // Botón para guardar las preferencias
              ElevatedButton(
                onPressed: () {
                  // Guardar preferencias del usuario
                  widget.usuario.actualizarPreferencias(
                    metodos: _metodosSeleccionados,
                    tiposCafe: _tiposCafeSeleccionados,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Preferencias guardadas")),
                  );
                },
                child: const Text('Guardar Preferencias'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
