import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_game/game.dart';
import 'package:flutter_flame_game/scores.dart';

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
            Image.asset(
              "assets/images/player-sprite.png", 
              width: 50, 
              height: 50,
              ),
            const SizedBox(height: 30),
            const Text(
              "Space Shooter",
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
                  const GameWidget.controlled(
                    gameFactory: SpaceShooterGame.new,
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
              child: const Text("Jogar"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                runApp(
                  const MaterialApp(
                    home: Scores(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 69, 69, 69),
                onPrimary: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                textStyle: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
              child: Text("Pontuações"),
            ),
          ],
        ),
      ),
    );
  }
}
