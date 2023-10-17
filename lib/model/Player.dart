import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_game/SpaceShooterGame.dart';

class Player extends SpriteComponent with HasGameRef<SpaceShooterGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('player-sprite.png');

    position = gameRef.size / 2;
    width = 100;
    height = 100;
    anchor = Anchor.center;
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
