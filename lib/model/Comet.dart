import 'package:flame/components.dart';
import 'package:flutter_flame_game/SpaceShooterGame.dart';
import 'package:flame/collisions.dart';

class Comet extends SpriteComponent 
with  HasGameRef<SpaceShooterGame>,
        HasCollisionDetection,
        CollisionCallbacks {
  
  Comet({
    super.position,
  }) : super(
          anchor: Anchor.center,
        );

  @override
  void onLoad() async {
    sprite = await gameRef.loadSprite('asteroid.png');
    size = Vector2(80.0, 80.0);
    
    add(
      RectangleHitbox.relative(
        Vector2(0.8, 0.8),
        parentSize: size,
        position: position,
        collisionType: CollisionType.passive,
        
      ),
    );

    super.onLoad();
  }

  @override
  void update(double dt) {
    // Lógica de movimento do cometa (por exemplo, movendo-se para baixo na tela).
    position.y += 2;

    // Verifique colisões com o jogador ou limites da tela.
    if (position.y > gameRef.size.y) {
      removeFromParent();
    }
  }

}
