import 'dart:async';

abstract class AppUseCase<P extends Object, R> {
  Future<R> execute(P params) async {
    return null;
  }
}

abstract class AppUseCase2<P1 extends Object, P2 extends Object, R> {
  Future<R> execute(P1 params1, P2 params2) async {
    return null;
  }
}
