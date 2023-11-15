import 'package:flame/components.dart';
import 'package:game/game_quest.dart';

class EmberPlayer extends SpriteAnimationComponent
    // this allows us to use any variuable or method defined in the ame class - we use game images
    with HasGameRef<GameQuestGame> {
  EmberPlayer({required super.position})
      : super(size: Vector2.all(64), anchor: Anchor.center);

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
