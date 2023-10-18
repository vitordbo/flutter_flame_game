import 'package:flame/components.dart';
import 'package:flutter_flame_game/SpaceShooterGame.dart';
import 'package:flutter_flame_game/model/Comet.dart';
import 'package:flame/collisions.dart';

class Bullet extends SpriteComponent
    with
        HasGameRef<SpaceShooterGame>,
        HasCollisionDetection,
        CollisionCallbacks {
 
  Bullet({
    super.position,
  }) : super(
          anchor: Anchor.center,
        );


  @override
  void update(double dt) {
    // Lógica de movimento da bala (por exemplo, movendo-se para cima na tela).
    position.y -= 5;

    // Verifique se a bala saiu dos limites da tela e marque para remoção, se necessário.
    if (position.y < 0) {
      gameRef.remove(this);
    }
  }

  @override
  void onLoad() async {
    sprite = await gameRef.loadSprite('bullet.png');
<<<<<<< HEAD
    size = Vector2(10.0, 20);
    
    add(
      RectangleHitbox.relative(
        Vector2(0.8, 0.8),
        parentSize: size,
        position: position,
      ),
    );
=======
    size = Vector2(5.0, 10.0);
>>>>>>> ac698769fa73844779602152b1335d58603fcbc6

    super.onLoad();
  }

  @override
<<<<<<< HEAD
  void onCollisionStart(Set<Vector2> points, PositionComponent other) {
    super.onCollisionStart(points, other);
=======
  void onCollision(Set<Vector2> points, PositionComponent other) {
>>>>>>> ac698769fa73844779602152b1335d58603fcbc6
    if (other is Comet) {
      removeFromParent();
      other.removeFromParent();
    }
  }
}
