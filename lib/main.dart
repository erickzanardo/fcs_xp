// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main(List<String> args) {

  WidgetsFlutterBinding.ensureInitialized();

  if (args.length != 2) {
    print('Usage: main.dart <basePath> <file>');
    return;
  }

  final basePath = args[0];
  final file = args[1];


  runApp(const MyApp());
}

