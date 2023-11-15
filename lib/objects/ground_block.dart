import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:game/game_quest.dart';

final UniqueKey _blockKey = UniqueKey();

class GroundBlock extends SpriteComponent with HasGameRef<GameQuestGame> {
  final Vector2 gridPosition;
  double xOffset;

  final Vector2 velocity = Vector2.zero();

  GroundBlock({
    required this.gridPosition,
    required this.xOffset,
  }) : super(size: Vector2.all(64), anchor: Anchor.bottomLeft);

  @override
  void onLoad() {
    final groundImage = game.images.fromCache('ground.png');
    sprite = Sprite(groundImage);
    position = Vector2(
      gridPosition.x * size.x + xOffset,
      game.size.y - gridPosition.y * size.y,
    );
    add(RectangleHitbox(collisionType: CollisionType.passive));
  }

  @override
  void update(double dt) {
    velocity.x = game.objectSpeed;
    position += velocity * dt;
    super.update(dt);
  }
}
