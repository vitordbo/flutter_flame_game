import 'dart:math';

import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flutter_flame_game/model/Comet.dart';
import 'package:flutter_flame_game/model/Player.dart';
import 'package:flutter_flame_game/model/Bullet.dart';

void main() {
  runApp(GameWidget(game: SpaceShooterGame()));
}

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
    // player.fire(); // Comece a atirar quando o jogador tocar.
  }

  @override
  void update(double dt) {
    super.update(dt);
    player.update(dt);
    // Lógica para criar cometas em intervalos regulares.
    if (Random().nextInt(200) < 5) {
      final comet = Comet() // Passe a referência do jogo para o construtor.
        ..position = Vector2(Random().nextInt(size.x.toInt()).toDouble(), 0);
      add(comet);
      comets.add(comet);
    }

    // No método update de SpaceShooterGame
    player.bullets.removeWhere((bullet) {
      if (bullet.shouldRemove()) {
        remove(bullet); // Remove a bala do jogo pai
        return true;
      }
      return false;
    });

    comets.removeWhere((comet) {
      final bulletsToRemove = <Bullet>[];
      final cometsToRemove = <Comet>[];

      for (final bullet in player.bullets) {
        if (bullet.toRect().overlaps(comet.toRect())) {
          bulletsToRemove.add(bullet);
          cometsToRemove.add(comet);
          comet.shouldExplode(); // Marque o cometa para explosão
        }
      }

      if (comet.shouldExplode()) {
        // Adicione aqui a lógica de explosão do cometa, como trocar a imagem, tocar som, etc.
        // Em seguida, remova o cometa do jogo.
        remove(comet);
      }

      // Remova as balas marcadas para remoção.
      player.bullets.removeWhere((bullet) => bulletsToRemove.contains(bullet));
      comet.removeWhere((comet) => cometsToRemove.contains(comet));

      return false;
    });
  }
}
