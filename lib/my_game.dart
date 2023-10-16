import 'package:flame/game.dart';

class MeuJogo extends BaseGame {
  @override
  void update(double dt) {
    // Lógica do jogo
  }

  @override
  void render(Canvas canvas) {
    // Renderização do jogo
  }

  @override
  Future<void> onLoad() async {
    final sprite = await Flame.images.load('sprite.png');
    // Outras imagens
  }

}
