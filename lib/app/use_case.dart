import 'dart:async';

abstract class UseCase<P extends Object, R> {
  Future<R> execute(P params) async {
    return null;
  }
}
