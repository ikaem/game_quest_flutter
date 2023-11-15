import 'package:flame/camera.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:game/actors/ember.dart';
import 'package:game/actors/water_enemy.dart';
import 'package:game/managers/segment_manager.dart';
import 'package:game/objects/ground_block.dart';
import 'package:game/objects/platform_block.dart';
import 'package:game/objects/star.dart';

class GameQuestGame extends FlameGame with TapCallbacks {
  GameQuestGame();

  late EmberPlayer _ember;

  // register block globally - the last ground block to be loaded
  late double lastBlockXPosition = 0.0;
  late UniqueKey lastBlockKey;

  // for purposes objec components of game movement
  double objectSpeed = 0.0;
  late final CameraComponent cameraComponent;

  @override
  void onTapUp(TapUpEvent event) {
    _ember.move(0);
  }

  @override
  void onTapDown(TapDownEvent event) {
    _ember.move(1);
  }

  @override
  final world = World();

  @override
  Color backgroundColor() {
    return const Color.fromARGB(255, 173, 223, 247);
  }

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

    initializeGame();
  }

  // this is to load blocks into the world
  // we give inted for segments list, and we loop through that segment - will populate the wrold
  void loadGameSegments(int segmentIndex, double xPositionOffset) {
    final segment = segments[segmentIndex];
    for (final block in segment) {
      switch (block.blockType) {
        case GroundBlock:
          add(
            GroundBlock(
              gridPosition: block.gridPosition,
              xOffset: xPositionOffset,
            ),
          );
          break;
        case PlatformBlock:
          // add component of PlatformBlock with add()
          // we have these values on the block itself
          add(PlatformBlock(
              gridPosition: block.gridPosition, xOffset: xPositionOffset));

          break;
        case Star:
          break;
        case WaterEnemy:
          break;
      }
    }
  }

  void initializeGame() {
    // assumption of screen size
    // it is mobile, so small
    const screenWidth = 320;
    // maybe we make sure we have 10 segments of 6.4 pixels each? not very good
    final segmentsToLoad = (size.x / 64).ceil();
    // clamp segments to load in range
    final realSegmentsToLoad = segmentsToLoad.clamp(0, segments.length);

    for (var i = 0; i < realSegmentsToLoad; i++) {
      // not sure what this other argument does
      loadGameSegments(i, (64 * i).toDouble());
    }

    // define ember character
    // now the chracter should be present on the screen
    _ember = EmberPlayer(position: Vector2(128, canvasSize.y - 70));
    world.add(_ember);
  }
}
