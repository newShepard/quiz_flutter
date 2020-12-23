import 'package:quiz_flutter/models/mdt_api/error_data.dart';

abstract class QuizError extends Error {
  String name;
  String message;

  @override
  String toString() {
    var string = '$name';
    if (message != null) string = string += ': $message';
    return string;
  }
}

class MdtApiError extends QuizError {
  String code;
  dynamic args;

  MdtApiError(MdtApiErrorData data) {
    name = 'MDT API Error';
    message = data.message;
    code = data.code;
    args = data.args;
  }
}

class OfflineError extends QuizError {
  OfflineError() {
    name = 'Offline error';
    message = 'Check your internet connection';
  }
}
