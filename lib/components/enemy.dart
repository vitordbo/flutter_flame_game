import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_flame_game/components/shoot.dart';
import 'package:flutter_flame_game/game.dart';

class Enemy extends SpriteAnimationComponent
    with HasGameRef<SpaceShooterGame>, CollisionCallbacks {
  Enemy({
    super.position,
  }) : super(
          anchor: Anchor.center,
        );

  static const _speed = 150.0;

  @override
  Future<void> onLoad() async {
    animation = await game.loadSpriteAnimation(
      'alien_1.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.25,
        textureSize: Vector2.all(16),
      ),
    );

    size = Vector2.all(80);

    add(
      RectangleHitbox.relative(
        Vector2(0.8, 0.8),
        parentSize: size,
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += _speed * dt;

    if (position.y >= gameRef.size.y) {
      removeFromParent();
    }
  }

  @override
  void onCollisionStart(Set<Vector2> points, PositionComponent other) {
    super.onCollisionStart(points, other);

    if (other is Shoot) {
      game.player.score += 100.0;
      removeFromParent();
      other.removeFromParent();
    }
  }
}

class EnemySpawner extends TimerComponent with HasGameRef<SpaceShooterGame> {
  EnemySpawner()
      : super(
          repeat: true,
          period: 0.5,
          autoStart: true,
        );

  final _random = Random();

  @override
  void onTick() {
    gameRef.add(
      Enemy(
        position: Vector2(
          _random.nextDouble() * gameRef.size.y,
          -32,
        ),
      ),
    );
  }
}
