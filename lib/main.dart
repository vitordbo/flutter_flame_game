import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_game/game.dart';

void main() {
  runApp(
    const MaterialApp(
      home: StartGame(),
    ),
  );
}

class StartGame extends StatelessWidget {
  const StartGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Define o fundo preto
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Space Shooter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                runApp(
                  const GameWidget.controlled(
                    gameFactory: SpaceShooterGame.new,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text("Jogar"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                //
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text("Sair"),
            ),
          ],
        ),
      ),
    );
  }
}
