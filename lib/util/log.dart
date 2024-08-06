import 'package:logger/logger.dart';

class Log {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  static void d(String tag, String message) {
    _logger.d('[$tag] $message');
  }

  static void e(String tag, String message) {
    _logger.e('[$tag] $message');
  }

  static void i(String tag, String message) {
    _logger.i('[$tag] $message');
  }

  static void w(String tag, String message) {
    _logger.w('[$tag] $message');
  }

  static void v(String tag, String message) {
    _logger.v('[$tag] $message');
  }
}
