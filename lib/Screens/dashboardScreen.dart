import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/Screens/GoogleMaps.dart';
import 'package:maps/Screens/LogginScreen.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});



  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    // Mostrar el diálogo de inicio de sesión exitoso al cargar el DashboardScreen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Inicio de Sesión Exitoso'),
            content: const Text('¡Bienvenido al dashboard!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Cerrar el diálogo
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPS Dashboard'),
        backgroundColor: Colors.blue,
      ),
      body: const MapSample(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Agregar aquí la lógica para cerrar sesión
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.logout), // Cambia el color del botón de cerrar sesión
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop, // Ubica el botón de cerrar sesión en la esquina inferior derecha
    );
  }
}
