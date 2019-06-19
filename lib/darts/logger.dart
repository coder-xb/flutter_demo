void main() {
  Logger logger = Logger('MyAPP');
  logger.error('错误信息');
  logger.debug('调试信息');
}

class Logger {
  String _appname;
  Logger(String name) : this._appname = name;

  void error(msg) {
    print('[$_appname] ERROR: $msg');
  }
  void debug(msg) {
    print('[$_appname] DEBUG: $msg');
  }
  void warn(msg) {
    print('[$_appname] WARN: $msg');
  }
  void fail(msg) {
    print('[$_appname] FAILUER: $msg');
  }
}
