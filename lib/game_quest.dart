import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flame/widgets.dart';
import 'package:game/actors/ember.dart';
import 'package:game/actors/water_enemy.dart';
import 'package:game/managers/segment_manager.dart';
import 'package:game/objects/ground_block.dart';
import 'package:game/objects/platform_block.dart';
import 'package:game/objects/star.dart';

class GameQuestGame extends FlameGame {
  GameQuestGame();

  late EmberPlayer _ember;

  final world = World();
  late final CameraComponent cameraComponent;

  @override
  Future<void> onLoad() async {
    // this uses Flame's build in caching system - load images only once - access as many times as needed
    // it takes them from assets/images
    await images.loadAll([
      'block.png',
      'ember.png',
      'ground.png',
      'heart_half.png',
      'heart.png',
      'star.png',
      'water_enemy.png',
    ]);

    cameraComponent = CameraComponent(world: world);
    // for some reason, we assume that camera position is top left
    cameraComponent.viewfinder.anchor = Anchor.topLeft;

    // adding compoennts to game?
    addAll([cameraComponent, world]);

    // define ember character
    // now the chracter should be present on the screen
    _ember = EmberPlayer(position: Vector2(128, canvasSize.y - 70));
    world.add(_ember);
  }

  // this is to load blocks into the world
  // we give inted for segments list, and we loop through that segment - will populate the wrold
  void loadGameSegments(int segmentIndex, double xPositionOffset) {
    final segment = segments[segmentIndex];
    for (final block in segment) {
      switch (block.blockType) {
        case GroundBlock:
          break;
        case PlatformBlock:
          break;
        case Star:
          break;
        case WaterEnemy:
          break;
      }
    }
  }
}
