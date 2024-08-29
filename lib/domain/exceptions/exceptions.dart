class AppException implements Exception {
  final String _message;
  final String _prefix;

  AppException([this._message = '', this._prefix = '']);

  @override
  String toString() => '$_prefix$_message';
}

class BadRequestException extends AppException {
  BadRequestException([String message = '']) : super(message, 'Bad Request: ');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String message = '']) : super(message, 'Unauthorised: ');
}

class NoInternetException extends AppException {
  NoInternetException([String message = '']) : super(message, 'No Internet: ');
}

class FetchDataException extends AppException {
  FetchDataException([String message = '']) : super(message, 'Error During Communication: ');
}
