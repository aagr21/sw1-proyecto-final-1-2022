import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        backgroundColor: Colors.redAccent,
        elevation: 0,
        actions: const [],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Padding(
                // Padding dentro del boton
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Ir visual',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'visual');
              },
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            ElevatedButton(
              child: const Padding(
                // Padding dentro del boton
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Ir auditiva', style: TextStyle(fontSize: 16)),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'inputAuditiva');
              },
            ),
          ],
        ),
      ),
    );
  }
}
