import 'dart:math';

import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flutter_flame_game/model/Comet.dart';
import 'package:flutter_flame_game/model/Player.dart';

void main() {
  runApp(
    const GameWidget.controlled(
      gameFactory: SpaceShooterGame.new,
    ),
    );
}

class SpaceShooterGame extends FlameGame with PanDetector, HasCollisionDetection {
  late Player player;
  final List<Comet> comets = [];

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    player = Player();
    add(player);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.global);
    // player.fire(); // Comece a atirar quando o jogador tocar.
  }

  @override
  void update(double dt) {
    super.update(dt);
    player.update(dt);
    // Lógica para criar cometas em intervalos regulares.
    if (Random().nextInt(200) < 5) {
      final comet = Comet( position: Vector2(Random().nextInt(size.x.toInt()).toDouble(), 0) ); // Passe a referência do jogo para o construtor.
      add(comet);
      comets.add(comet);
    }
  }

  void restartGame() {
    player = Player();
    add(player);
  }
}
