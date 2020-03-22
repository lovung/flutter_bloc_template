import 'package:blocdemo/base/bloc_event_state.dart';
import 'package:blocdemo/sample/sample_event.dart';
import 'package:blocdemo/sample/sample_state.dart';
import 'package:blocdemo/sample/sample_use_case.dart';

class SampleBloc extends BlocEventStateBase<SampleEvent, SampleState> {
  SampleIncreaseUseCase _increaseUseCase = SampleIncreaseUseCase();
  SampleDecreaseUseCase _decreaseUseCase = SampleDecreaseUseCase();

  SampleBloc() : super(initialState: SampleState.init());

  @override
  Stream<SampleState> eventHandler(
      SampleEvent event, SampleState currentState) async* {
    yield SampleState.loading(currentState.counter);
    int res;
    switch (event.runtimeType) {
      case SampleEventAsIncrease:
        try {
          res = await _increaseUseCase.execute(currentState.counter);
          if (res == null) {
            yield SampleState.error("NULL");
          } else {
            yield SampleState.success(res);
          }
        } catch (e) {
          yield SampleState.error(e.toString());
        }
        break;
      case SampleEventAsDecrease:
        try {
          res = await _decreaseUseCase.execute(currentState.counter);
          if (res == null) {
            yield SampleState.error("NULL");
          } else {
            yield SampleState.success(res);
          }
        } catch (e) {
          yield SampleState.error(e.toString());
        }
        break;

      default:
    }
  }

  // _handleSuccess(int s) async* {
  //   yield SampleState.success(s);
  // }

  // _handleError(e) async* {
  //   yield SampleState.error(e.toString());
  // }
}
