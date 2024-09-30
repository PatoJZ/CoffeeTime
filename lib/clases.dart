// Clase Receta
class Receta {
  final String nombre;
  final List<String> ingredientes;
  final Usuario usuario;
  final String descripcion;

  Receta(this.nombre, this.ingredientes, this.usuario, this.descripcion);
}

// Clase Usuario
class Usuario {
  String nombre;
  List<Usuario> amigos = [];
  List<Receta> listaRecetas = [];
  List<Receta> recetasFavoritas = [];
  List<Producto> listaProductos = [];

  Usuario(this.nombre);

  void calificar(Receta receta, int calificacion) {
    // Lógica para calificar una receta
  }

  void anadirFavorito(Receta receta) {
    recetasFavoritas.add(receta);
  }

  String getNombre() {
    return nombre;
  }
}

// Clase Producto
class Producto {
  String nombre;
  int id;
  double precio;
  Usuario usuarioCreador;

  Producto(this.nombre, this.id, this.precio, this.usuarioCreador);

  void comprar() {
    // Lógica para comprar el producto
  }
}

// Clase Ingrediente
class Ingrediente {
  String tipo;
  double valor;

  Ingrediente(this.tipo, this.valor);
}
