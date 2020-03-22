import 'package:flutter/material.dart';

import 'bloc_event_state.dart';

typedef Widget AsyncBlocEventStateBuilder<BlocState>(
    BuildContext context, BlocState state);

class BlocEventStateBuilder<BlocEvent, BlocState> extends StatefulWidget {
  const BlocEventStateBuilder({
    Key key,
    @required this.builder,
    @required this.bloc,
    this.initialEvent,
  })  : assert(builder != null),
        assert(bloc != null),
        super(key: key);

  final BlocEventStateBase<BlocEvent, BlocState> bloc;
  final AsyncBlocEventStateBuilder<BlocState> builder;
  final BlocEvent initialEvent;

  @override
  _BlocEventStateBuilderState createState() =>
      _BlocEventStateBuilderState<BlocEvent, BlocState>();
}

class _BlocEventStateBuilderState<BlocEvent, BlocState>
    extends State<BlocEventStateBuilder<BlocEvent, BlocState>> {
  @override
  void initState() {
    if (widget.initialEvent != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.bloc.emitEvent(widget.initialEvent);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BlocState>(
      stream: widget.bloc.state,
      initialData: widget.bloc.initialState,
      builder: (BuildContext context, AsyncSnapshot<BlocState> snapshot) {
        return widget.builder(context, snapshot.data);
      },
    );
  }
}
