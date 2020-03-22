import 'dart:async';

import 'package:blocdemo/app/use_case.dart';

Future<int> increase(int c) async {
  await Future.delayed(Duration(seconds: 1));
  return c + 1;
}

Future<int> decrease(int c) async {
  await Future.delayed(Duration(seconds: 1));
  return c - 1;
}

class SampleIncreaseUseCase implements UseCase<int, int> {
  @override
  Future<int> execute(int params) async {
    var completer = Completer<int>();
    final res = await increase(params);
    if (res == null) {
      completer.completeError("Error");
    } else {
      completer.complete(res);
    }
    return completer.future;
  }
}

class SampleDecreaseUseCase implements UseCase<int, int> {
  @override
  Future<int> execute(int params) async {
    var completer = Completer<int>();
    final res = await decrease(params);
    if (res == null) {
      completer.completeError("Error");
    } else {
      completer.complete(res);
    }
    return completer.future;
  }
}