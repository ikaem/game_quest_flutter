import 'package:flame/components.dart';
import 'package:game/game_quest.dart';

class EmberPlayer extends SpriteAnimationComponent
    // this allows us to use any variuable or method defined in the ame class - we use game images
    with
        HasGameRef<GameQuestGame> {
  EmberPlayer({required super.position})
      : super(size: Vector2.all(64), anchor: Anchor.center);

// zero i stop, 1 is move
  int horizontalDirection = 0;

  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 200;

  // will be called by the game class
  void move(int direction) {
    // position.add();
    horizontalDirection = direction;
  }

  @override
  void update(double dt) {
    game.objectSpeed = 0;

    final positionX = position.x;
    final gameSizeX = game.size.x;

    if (position.x - 18 <= 0 && horizontalDirection < 0) {
      // TODO this will never happen - prevent going left
      velocity.x = 0;
    } else if (position.x + 32 >= game.size.x / 2 && horizontalDirection > 0) {
      // prevent from going half screen
      velocity.x = 0;
      // TODO this will move the world in opposite direction in negative speed of the player
      game.objectSpeed = -moveSpeed;
    } else {
      velocity.x = horizontalDirection * moveSpeed;
    }

    position += velocity * dt;

    super.update(dt);
  }

  @override
  void onLoad() {
    // animation is existing property
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('ember.png'),
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.12,
        textureSize: Vector2.all(16),
      ),
    );
  }
}
