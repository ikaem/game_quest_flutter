import 'package:flame/game.dart';

class GameQuestGame extends FlameGame {
  GameQuestGame();

  @override
  Future<void> onLoad() async{
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
  }
}