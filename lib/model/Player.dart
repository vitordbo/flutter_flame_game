import 'package:flame/components.dart';
import 'package:flutter_flame_game/SpaceShooterGame.dart';
import 'package:flutter_flame_game/model/Bullet.dart';
import 'dart:async';

class Player extends SpriteComponent with HasGameRef<SpaceShooterGame> {
  bool isShooting = false;
  double timeSinceLastShot = 0.0;
  final double shootingInterval = 1.0; // Intervalo de disparo em segundos
  final List<Bullet> bullets = []; // Lista para rastrear as balas disparadas

  @override
  void update(double dt) {
    super.update(dt);
    timeSinceLastShot += dt;

    if (isShooting && timeSinceLastShot >= shootingInterval) {
      fire();
      timeSinceLastShot = 0.0;
    }
  }

  void startShooting() {
    isShooting = true;
  }

  void stopShooting() {
    isShooting = false;
  }

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
    bullets.add(bullet); // Adicione a bala à lista de balas disparadas
  }
}
