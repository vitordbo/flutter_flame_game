import 'package:flame/components.dart';
import 'package:flutter_flame_game/SpaceShooterGame.dart';

class Bullet extends SpriteComponent 
  with  HasGameRef<SpaceShooterGame>,
        HasCollisionDetection,
        CollisionCallbacks {
  bool _shouldRemove = false; // Flag para sinalizar a remoção

  @override
  void update(double dt) {
    // Lógica de movimento da bala (por exemplo, movendo-se para cima na tela).
    position.y -= 5;

    // Verifique se a bala saiu dos limites da tela e marque para remoção, se necessário.
    if (position.y < 0) {
      _shouldRemove = true;
    }
  }

  @override
  void onLoad() async {
    sprite = await gameRef.loadSprite('bullet.png');
    position = gameRef.size / 2;
    size = Vector2(5.0, 10.0);
    anchor = Anchor.center;

    super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {  
    if (other is Comet) {
      _shouldRemove = true;
    }
  }

  // Método para verificar se a bala deve ser removida
  bool shouldRemove() {
    return _shouldRemove;
  }
}
