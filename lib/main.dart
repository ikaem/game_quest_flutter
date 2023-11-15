import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:game/game_quest.dart';

void main() {
  // initial scaffold 
  // final game = FlameGame();
  // runApp(GameWidget(game: game));
  
  // better scaffold, i guess
  runApp(const GameWidget<GameQuestGame>.controlled(gameFactory: GameQuestGame.new));
  
}