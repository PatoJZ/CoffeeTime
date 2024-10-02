// Clase Receta
class Receta {
  final String nombre;
  final List<String> ingredientes;
  final Usuario usuario;
  final String descripcion;
  final List<String> metodosPreparacion; // Métodos de preparación añadidos

  Receta(this.nombre, this.ingredientes, this.usuario, this.descripcion, this.metodosPreparacion);
}

// Clase Usuario
class Usuario {
  final String nombre;
  List<String> metodosPreferidos = [];
  List<String> tiposCafePreferidos = [];

  Usuario(this.nombre);

  void actualizarPreferencias({
    required List<String> metodos,
    required List<String> tiposCafe,
  }) {
    metodosPreferidos = metodos;
    tiposCafePreferidos = tiposCafe;
  }
}

// Clase Producto
class Producto {
  String nombre;
  int id;
  double precio;
  Usuario usuarioCreador;

  Producto(this.nombre, this.id, this.precio, this.usuarioCreador);


}

// Clase Ingrediente
class Ingrediente {
  String tipo;
  double valor;

  Ingrediente(this.tipo, this.valor);
}
