import 'package:blocdemo/app/app_state.dart';

class SampleState extends AppState {
  SampleState(
    StateEnum state,
    String err, {
    this.counter,
  }) : super(state, err);

  final int counter;

  factory SampleState.init() => SampleState(
        StateEnum.init,
        NoError,
        counter: 0,
      );
  factory SampleState.loading(counter) => SampleState(
        StateEnum.loading,
        NoError,
        counter: counter,
      );
  factory SampleState.success(counter) => SampleState(
        StateEnum.success,
        NoError,
        counter: counter,
      );
  factory SampleState.error(String err) => SampleState(
        StateEnum.error,
        err,
      );
}
