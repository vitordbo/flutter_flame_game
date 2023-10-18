import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_flame_game/components/background.dart';
import 'package:flutter_flame_game/components/enemy.dart';
import 'package:flutter_flame_game/components/player.dart';
import 'package:flutter_flame_game/main.dart';

class SpaceShooterGame extends FlameGame
    with PanDetector, HasCollisionDetection {
  late Player player;
  late TextComponent tc;
  final scoreStyle = TextPaint(
    style: TextStyle(
      fontSize: 30.0,
      color: BasicPalette.white.color,
    ),
  );

  SpaceShooterGame()
      : super(
          children: [
            Background(),
            EnemySpawner(),
          ],
        );

  void restartGame() {
    runApp(
      const MaterialApp(
        home: StartGame(),
      ),
    );
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    player = Player();
    add(player);

    tc = TextComponent(
      text: 'Score = ${player.score.floor()}\nHP = ${player.hp}',
      textRenderer: scoreStyle,
      anchor: Anchor.topLeft,
      position: Vector2(20, 40),
    );
    add(tc);

  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.position.add(info.delta.global);
  }

  @override
  void update(double dt) {
    tc.text = 'Score = ${player.score.floor()}\nHP = ${player.hp}';
    super.update(dt);
    player.update(dt);
  }
}
