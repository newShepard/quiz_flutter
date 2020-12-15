import 'package:quiz_flutter/models/mdt_api/error_data.dart';

abstract class QuizError extends Error {
  String name;
  String message;

  @override
  String toString() {
    var string = '${this.name}';
    if (this.message != null) string = string += ': ${this.message}';
    return string;
  }
}

class MdtApiError extends QuizError {
  String code;
  dynamic args;

  MdtApiError(MdtApiErrorData data) {
    this.name = 'MDT API Error';
    this.message = data.message;
    this.code = data.code;
    this.args = data.args;
  }
}

class OfflineError extends QuizError {
  OfflineError() {
    this.name = 'Offline error';
    this.message = 'Check your internet connection';
  }
}
