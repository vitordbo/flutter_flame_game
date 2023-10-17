import 'dart:math';

import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flutter_flame_game/model/Comet.dart';
import 'package:flutter_flame_game/model/Player.dart';

class SpaceShooterGame extends FlameGame with PanDetector {
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
    player.fire(); // Comece a atirar quando o jogador tocar.
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Lógica para criar cometas em intervalos regulares.
    if (Random().nextInt(100) < 5) {
      final comet = Comet(this) // Passe a referência do jogo para o construtor.
        ..position = Vector2(Random().nextInt(size.x.toInt()).toDouble(), 0);
      add(comet);
      comets.add(comet);
    }
  }
}

void main() {
  runApp(GameWidget(game: SpaceShooterGame()));
}
