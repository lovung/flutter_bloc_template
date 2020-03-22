import 'package:blocdemo/base/bloc_event_state.dart';

const NoError = null;
const AcceptableTimeoutDuration = Duration(seconds: 5);

enum StateEnum {
  init,
  loading,
  success,
  error,
}

class AppState extends BlocState {
  final StateEnum state;
  final String error;

  bool get done => state == StateEnum.success || state == StateEnum.error;
  bool get isError => state == StateEnum.error;

  AppState(this.state, [this.error = NoError]) : assert(state != null);
}
