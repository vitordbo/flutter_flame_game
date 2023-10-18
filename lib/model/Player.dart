import 'package:flame/components.dart';
import 'package:flutter_flame_game/SpaceShooterGame.dart';
import 'package:flutter_flame_game/model/Bullet.dart';
import 'dart:async';

class Player extends SpriteComponent 
  with  HasGameRef<SpaceShooterGame>,
        HasCollisionDetection,
        CollisionCallbacks {
  bool isShooting = false;
  double timeSinceLastShot = 0.0;
  final double shootingInterval = 1.0; // Intervalo de disparo em segundos
  final List<Bullet> bullets = []; // Lista para rastrear as balas disparadas

  @override
  void onLoad() async {
    sprite = await gameRef.loadSprite('player-sprite.png');
    position = gameRef.size / 2;
    size = Vector2(32.0, 48.0);
    anchor = Anchor.center;

    super.onLoad();
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  @override
  void update(double dt) {
    super.update(dt);
    timeSinceLastShot += dt; // mudar pra diminuir as balas

    if (timeSinceLastShot >= shootingInterval) {
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

  void fire() {
    final bullet = Bullet()
      ..position = position.clone()
      ..anchor = Anchor.center;
    gameRef.add(bullet);
    bullets.add(bullet); // Adicione a bala à lista de balas disparadas
  }
}
