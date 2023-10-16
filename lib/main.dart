import 'package:flutter/material.dart';
import 'package:flame_flutter/flame_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: FlameGame(
          game: MeuJogo(),
        ),
      ),
    ),
  );
}
