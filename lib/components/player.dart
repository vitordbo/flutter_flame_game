import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter_flame_game/components/enemy.dart';
import 'package:flutter_flame_game/components/shoot.dart';
import 'package:flutter_flame_game/game.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef<SpaceShooterGame>, CollisionCallbacks, TapCallbacks {
  Player()
      : super(
          anchor: Anchor.center,
        );

  double timeSinceLastShot = 0.0;
  double score = 0.0;
  int hp = 5;
  final double shootingInterval = 1.0; // Intervalo de disparo em segundos

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

    score = 0.0;
    hp = 5;

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
      hp -= 1; 
      other.removeFromParent();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    
    if (hp <= 0) {
      removeFromParent();
      game.restartGame();
    }
    else{
      timeSinceLastShot += dt; // mudar pra diminuir as balas

      if (timeSinceLastShot >= shootingInterval) {
        _shoot();
        timeSinceLastShot = 0.0;
      }
    }
    

  }
}
