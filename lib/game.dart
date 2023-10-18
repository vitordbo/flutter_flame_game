import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter_flame_game/components/background.dart';
import 'package:flutter_flame_game/components/enemy.dart';
import 'package:flutter_flame_game/components/player.dart';

class SpaceShooterGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  SpaceShooterGame()
      : super(
          children: [
            Background(),
            EnemySpawner(),
            Player(),
          ],
        );

  void restartGame() {
    add(Player());
  }
}
