import 'package:quiz_flutter/models/mdt_api/error_data.dart';

class MdtApiError extends Error {
  late final String name;
  late final String? message;
  late final String? code;
  late final dynamic? args;

  MdtApiError(MdtApiErrorData data) {
    this.name = 'MDT API Error';
    this.message = data.message;
    this.code = data.code;
    this.args = data.args;
  }

  @override
  String toString() => '${this.name}: ${this.message}';
}

class OfflineError extends Error {
  late final String name;
  late final String message;

  OfflineError() {
    this.name = 'Offline error';
    this.message = 'Check your internet connection';
  }

  @override
  String toString() => '${this.name}: ${this.message}';
}
