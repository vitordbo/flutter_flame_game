import 'package:flame/components.dart';
import 'package:flutter_flame_game/SpaceShooterGame.dart';
import 'package:flutter_flame_game/model/Bullet.dart';
import 'dart:async';

class Player extends SpriteComponent with HasGameRef<SpaceShooterGame> {
  late Timer shootingTimer;
  bool isShooting = false;

  void startShooting() => Timer(Duration(seconds: 1) as double, onTick: fire);

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

  void fire() {
    final bullet = Bullet()
      ..position = position.clone()
      ..anchor = Anchor.center;
    gameRef.add(bullet);
  }
}
