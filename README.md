# CoffeeTime 

Este repositorio contiene la implementación de una **aplicación de recetas de café** como maqueta funcional en Flutter. La aplicación permite a los usuarios explorar, gestionar y calificar diversas recetas de café, así como personalizar su experiencia con favoritos y preferencias.

Para ver la presentación de la aplicación, hacer click en el siguiente enlace: [Presentación Coffee Time] (https://drive.google.com/file/d/1oyyn38pnrEVRmt1_dyXisGFiCmJdzNZG/view?usp=sharing)

## Objetivos del proyecto
- Desarrollar una interfaz de usuario atractiva y funcional para aficionados y baristas.
- Implementar una estructura modular que permita gestionar y explorar recetas de café.
- Incorporar funcionalidades para la personalización de recetas y compartirlas con otros usuarios.
- Crear una maqueta que sirva como base para un futuro producto viable de validación de mercado.

## Funcionalidades principales
- **Exploración de recetas**: Los usuarios pueden buscar y explorar recetas con filtros y una barra de búsqueda.
- **Sistema de favoritos**: Los usuarios pueden marcar recetas como favoritas.
- **Calificación**: Cada receta puede ser calificada de 1 a 5 estrellas.
- **Gestión de recetas**: Se pueden añadir nuevas recetas a la base de datos, y estas son visibles en la lista general y en los favoritos.
- **Interfaz modular**: Se utiliza un widget modular reutilizable para gestionar el comportamiento de las recetas en todas las pantallas.

## Requerimientos funcionales
1. **Barra de búsqueda**: Funcionalidad para filtrar recetas en tiempo real según el nombre.
2. **Favoritos**: Posibilidad de marcar recetas como favoritas, que se sincronizan en todas las pantallas.
3. **Sistema de calificación**: Los usuarios pueden calificar las recetas, con la posibilidad de compartir su experiencia.
4. **Personalización**: Permitir la personalización de métodos de preparación y tipos de café.
5. **Productos relacionados**: Inclusión de recomendaciones y productos relacionados con las recetas.
6. **Compatibilidad multi-plataforma**: Aunque inicialmente diseñado para móvil, la estructura está pensada para adaptarse a tablets y escritorio.

## Estructura del proyecto
- **lib/**: Contiene el código fuente en Flutter.
    - `main.dart`: Punto de entrada de la aplicación.
    - `recipe_card_widget.dart`: Widget modular reutilizable para mostrar recetas.
    - `home_screen.dart`: Pantalla principal de la aplicación.
    - `explore_screen.dart`: Pantalla de exploración de recetas.
    - `favorite_screen.dart`: Pantalla de favoritos.
- **assets/**: Recursos gráficos e imágenes utilizadas en la aplicación.
- **README.md**: Documentación del proyecto.

## Diagrama de clases
```mermaid
classDiagram
    class Receta {
        +String nombre
        +List~String~ ingredientes
        +List~String~ metodosPreparacion
        +String descripcion
    }

    class Usuario {
        +String nombre
        +List~String~ metodosPreferidos
        +List~String~ tiposCafePreferidos
        +List~Receta~ recetasFavoritas
        +void actualizarPreferencias(List~String~ metodos, List~String~ tiposCafe)
    }

    class AddRecipeScreen {
        +TextEditingController _nameController
        +TextEditingController _ingredientsController
        +TextEditingController _descriptionController
        +List~String~ _metodosSeleccionados
        +List~String~ _ingredientesSeleccionados
        +void onRecipeAdded(Receta receta)
    }

    class RecipeCardWidget {
        +Receta receta
        +bool isFavorite
        +void onFavoriteToggle(Receta receta)
        +void onRate(Receta receta, int rating)
    }

    class UserSettingsScreen {
        +Usuario usuario
        +List~String~ _metodosSeleccionados
        +List~String~ _tiposCafeSeleccionados
        +void actualizarPreferencias()
    }

    class MainMenu {
        +List~Receta~ _recetas
        +List~Receta~ _favoritos
        +void _toggleFavorite(Receta receta)
        +void _addRecipe(Receta receta)
    }

    Receta --> Usuario 
    MainMenu --> Receta 
    MainMenu --> Receta 
    AddRecipeScreen --> Receta 
    RecipeCardWidget --> Receta 
    UserSettingsScreen --> Usuario 
