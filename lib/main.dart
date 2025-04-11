// ignore_for_file: avoid_print
import 'dart:io';

import 'package:path/path.dart' as path;

import 'dart:async';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();

  if (args.length != 2) {
    print('Usage: main.dart <basePath> <file>');
    return;
  }

  final basePath = args[0];
  final file = args[1];

  runApp(
    GameWidget.controlled(
      gameFactory: () => FcsXpGame(basePath: basePath, filePath: file),
    ),
  );
}

class FcsXpGame extends FlameGame {
  FcsXpGame({required this.basePath, required this.filePath});

  final String basePath;
  final String filePath;
  late final File file;

  late final StreamSubscription<FileSystemEvent> _sub;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();



    final dir = Directory(basePath);

    file = File(path.join(basePath, filePath));

    _sub = dir.watch(recursive: true).listen((event) {
      _build();
    });

    _build();
  }

  Future<void> _build() async {
    for (final child in world.children) {
      child.removeFromParent();
    }

    final fileContent = await file.readAsString();
  }

  @override
  void onRemove() {
    super.onRemove();

    _sub.cancel();
  }
}
