import 'package:flame/components.dart';

class Block {

  Block(this.gridPosition, this.blockType);

  // grid position is classic coordianates
  final Vector2 gridPosition;
  final Type blockType;

}

// segments will allow us to assemble world - envbiroments
// segments are made out of Blocks
  final segments = [
    segment0,
  ];
  final segment0 = [];
