import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flame_game/game.dart';

void main() {
  runApp(
    const GameWidget.controlled(
      gameFactory: SpaceShooterGame.new,
    ),
  );
}
