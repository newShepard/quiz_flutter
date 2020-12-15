import 'package:flutter/material.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/quiz.dart';

void main() async {
  await injectDependencies();
  runApp(QuizApp());
}
