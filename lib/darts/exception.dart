void main() {
  try{
    testException();
  } on FormatException catch(e) {
    print('Catch FormatException.');
    print(e);
    rethrow;
  } on Exception {
    print('Catch Exception.');
  } catch(e, r) { // e - 异常对象，r - StackTrace堆栈对象
    print(e);
    print(r);
  } finally {
    print('This is Finally Handler'); // 最终执行
  }
}


// 异常处理
testException() {
  throw FormatException('This is a test FormatException');
}
