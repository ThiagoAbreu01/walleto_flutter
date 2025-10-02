import 'package:walleto_flutter/app/core/logger/i_logger.dart';
import 'package:logger/logger.dart' as log;

class Logger implements ILogger {
  final logger = log.Logger();
  var messages = <String>[];
  @override
  void debug(message, [error, StackTrace? stacktrace]) =>
      logger.d(message, error: error, stackTrace: stacktrace);

  @override
  void error(message, [error, StackTrace? stacktrace]) =>
      logger.e({message, error, stacktrace});

  @override
  void info(message, [error, StackTrace? stacktrace]) =>
      logger.i(message, error: error, stackTrace: stacktrace);

  @override
  void warning(message, [error, StackTrace? stacktrace]) =>
      logger.w(message, error: error, stackTrace: stacktrace);
  @override
  void append(message) {
    messages.add(message);
  }

  @override
  void closeAppend() {
    info(messages.join('\n'));
    messages = [];
  }
}
