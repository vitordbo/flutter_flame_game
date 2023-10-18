import 'package:flame/components.dart';
import 'package:flutter_flame_game/SpaceShooterGame.dart';
import 'package:flutter_flame_game/model/Bullet.dart';
import 'package:flutter_flame_game/model/Comet.dart';
import 'package:flame/collisions.dart';

class Player extends SpriteComponent 
  with  HasGameRef<SpaceShooterGame>,
        HasCollisionDetection,
        CollisionCallbacks {
  Player()
      : super(
          anchor: Anchor.center,
        );
  
  bool isShooting = false;
  double timeSinceLastShot = 0.0;
  final double shootingInterval = 3.0; // Intervalo de disparo em segundos
  
  @override
  void onLoad() async {
    sprite = await gameRef.loadSprite('player-sprite.png');
    position = gameRef.size / 2;
    size = Vector2(65.0, 100.0);
    anchor = Anchor.center;

    add(
      RectangleHitbox.relative(
        Vector2(0.8, 0.8),
        parentSize: size,
      ),
    );

    super.onLoad();
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  @override
  void onCollisionStart(Set<Vector2> points, PositionComponent other) {
    super.onCollisionStart(points, other);
    if (other is Comet) {
      removeFromParent();
      other.removeFromParent();
      gameRef.restartGame();
    }
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
    final bullet = Bullet( position: Vector2(x, y - (height / 2.0 )) );
    gameRef.add(bullet);
  }
}
