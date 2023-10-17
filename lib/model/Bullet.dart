import 'package:flame/components.dart';
import 'package:flutter_flame_game/SpaceShooterGame.dart';

class Bullet extends SpriteComponent with HasGameRef<SpaceShooterGame> {
  @override
  void update(double dt) {
    // Lógica de movimento da bala (por exemplo, movendo-se para cima na tela).
    position.y -= 5;

    // Verifique se a bala saiu dos limites da tela e a remova, se necessário.
    if (position.y < 0) {
      remove(this);
    }

    // Verifique colisões com cometas.
    final game = gameRef;
    for (final comet in game.comets) {
      if (toRect().overlaps(comet.toRect())) {
        remove(this);
        remove(comet);
        break;
      }
    }
  }

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('bullet.png');
    width = 5;
    height = 10;
  }
}
