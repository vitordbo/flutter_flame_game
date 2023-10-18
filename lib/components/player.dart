import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flame_game/components/enemy.dart';
import 'package:flutter_flame_game/components/shoot.dart';
import 'package:flutter_flame_game/game.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef<SpaceShooterGame>, CollisionCallbacks, TapCallbacks {
  Player()
      : super(
          anchor: Anchor.center,
        );

  static const _speed = 400.0;
  double timeSinceLastShot = 0.0;
  final double shootingInterval = 1.5; // Intervalo de disparo em segundos

  final _direction = Vector2.zero();

  @override
  Future<void> onLoad() async {
    animation = await game.loadSpriteAnimation(
      'starfighter_2.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.2,
        textureSize: Vector2.all(48),
      ),
    );

    size = Vector2.all(96);

    position = gameRef.size / 2;

    add(
      RectangleHitbox.relative(
        Vector2(0.8, 0.8),
        parentSize: size,
      ),
    );
  }

  void _shoot() {
    final bullet = Shoot(position: Vector2(x, y - (height / 2.0)));
    gameRef.add(bullet);
  }

  @override
  void onCollisionStart(Set<Vector2> points, PositionComponent other) {
    super.onCollisionStart(points, other);

    if (other is Enemy) {
      removeFromParent();

      other.removeFromParent();

      game.restartGame();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    timeSinceLastShot += dt; // mudar pra diminuir as balas

    if (timeSinceLastShot >= shootingInterval) {
      _shoot();
      timeSinceLastShot = 0.0;
    }
  }
}
