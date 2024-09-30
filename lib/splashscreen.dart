import 'package:coffeetime/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    // Asegúrate de usar la ruta correcta para tu archivo SVG
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainMenu()),
      );
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 129, 104, 81),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Asegúrate de que la ruta sea válida y el archivo esté en el lugar correcto
            SvgPicture.asset(
              'assets/icons/coffee-cup-svgrepo-com.svg', // Cambia a la ruta de tu archivo SVG
              height: 100,
              width: 100,
               // ignore: deprecated_member_use
               color: Colors.white,
              placeholderBuilder: (BuildContext context) => const CircularProgressIndicator(), // Opcional: Placeholder mientras carga
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
