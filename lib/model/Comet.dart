import 'package:flame/components.dart';
import 'package:flutter_flame_game/SpaceShooterGame.dart';

class Comet extends SpriteComponent with HasGameRef<SpaceShooterGame> {
  final SpaceShooterGame game;
  bool _shouldExplode = false; // Flag para sinalizar a explosão

  Comet(this.game);

  @override
  void onLoad() async {
    sprite = await gameRef.loadSprite('asteroid.png');
    size = Vector2(40.0, 40.0);
    super.onLoad();
  }

  @override
  void update(double dt) {
    // Lógica de movimento do cometa (por exemplo, movendo-se para baixo na tela).
    position.y += 2;

    // Verifique colisões com o jogador ou limites da tela.
    if (position.y > gameRef.size.y) {
      game.remove(this); // Use game para remover o cometa do jogo.
    }
  }

  bool shouldExplode() {
    return _shouldExplode;
  }
}
