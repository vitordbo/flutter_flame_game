import 'dart:math';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter_flame_game/components/background.dart';
import 'package:flutter_flame_game/components/enemy.dart';
import 'package:flutter_flame_game/components/player.dart';

class SpaceShooterGame extends FlameGame
    with PanDetector, HasCollisionDetection {
  late Player player;
  SpaceShooterGame()
      : super(
          children: [
            Background(),
            EnemySpawner(),
          ],
        );

  void restartGame() {
    add(player);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    player = Player();
    add(player);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.position.add(info.delta.global);
  }

  @override
  void update(double dt) {
    super.update(dt);
    player.update(dt);
  }
}
