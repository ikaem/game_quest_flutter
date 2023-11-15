/*
* idea is
* - get srpite to be displayed - place it in the correct position
* - removbe the sprite as they are off the screen
* */

import 'package:flame/components.dart';
import 'package:game/game_quest.dart';

class PlatformBlock extends SpriteComponent with HasGameRef<GameQuestGame> {
  PlatformBlock({
    required this.gridPosition,
    required this.xOffset,
  }) : super(size: Vector2.all(64), anchor: Anchor.bottomLeft);

  final Vector2 gridPosition;
  double xOffset;

  final Vector2 velocity = Vector2.zero();

  // note empty onLoad and update methods
  @override
  void onLoad() {}

  @override
  void update(double dt) {
    // blocks will always move on x axis
    velocity.x = game.objectSpeed;
    position = position + (velocity * dt);

    // make sure we remove it from parent when off the screen
    if(position.x < -size.x) removeFromParent();

    super.update(dt);
  }
}
