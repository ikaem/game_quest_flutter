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
    // calculate velocity based on direction
    velocity.x = horizontalDirection * moveSpeed;

    // update position based on velocity and time since the last update
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
