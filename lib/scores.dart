import 'package:flutter/material.dart';
import 'package:flutter_flame_game/main.dart';

class Scores extends StatelessWidget {
  const Scores({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Colors.black, // Define o fundo preto
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Pontuações",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                  runApp(
                    const MaterialApp(
                      home: StartGame(),
                    ),
                  );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 37, 51, 56),
                onPrimary: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
              child: const Text("Voltar"),
            ),
          ],
        ),
      ),
    );
  }
}