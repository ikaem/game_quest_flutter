/*
* idea is
* - get srpite to be displayed - place it in the correct position
* - removbe the sprite as they are off the screen
* */

import 'package:flame/components.dart';
import 'package:game/game_quest.dart';

class PlatformBlock extends SpriteComponent with HasGameRef<GameQuestGame>{

  final Vector2 gridPosition;
  double xOffset;

  PlatformBlock({
    required this.gridPosition,
    required this.xOffset,
  }) : super(size: Vector2.all(64), anchor: Anchor.bottomLeft);

  // note empty onLoad and update methods
  @override
  void onLoad() {
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

}