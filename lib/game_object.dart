abstract class GameObject {
  GameObject({
    required this.position,
    required this.size,
  });

  final (int x, int y) position;
  final (int width, int height) size;
}

class GameSprite extends GameObject {

  GameSprite({
    required super.position,
    required super.size,
    required this.imagePath,
    required this.srcPosition,
    required this.srcSize,
  });

  final String imagePath;
  final (int x, int y) srcPosition;
  final (int width, int height) srcSize;
}

class GameAnimation extends GameObject {

  GameAnimation({
    required super.position,
    required super.size,
    required this.frames,
    required this.imagePath,
  });

  final List<(int srcX, int srcY, int srcWidth, int srcHeight)> frames;
  final String imagePath;
}

