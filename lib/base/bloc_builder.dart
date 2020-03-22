import 'package:flutter/material.dart';

import 'bloc_event_state.dart';

typedef Widget AsyncBlocEventStateBuilder<BlocState>(
    BuildContext context, BlocState state);

class BlocLazyBuilder<BlocEvent, BlocState> extends StatefulWidget {
  const BlocLazyBuilder({
    Key key,
    @required this.builder,
    @required this.bloc,
  })  : assert(builder != null),
        assert(bloc != null),
        super(key: key);

  final BlocEventStateBase<BlocEvent, BlocState> bloc;
  final AsyncBlocEventStateBuilder<BlocState> builder;

  @override
  _BlocLazyBuilderState createState() =>
      _BlocLazyBuilderState<BlocEvent, BlocState>();
}

class _BlocLazyBuilderState<BlocEvent, BlocState>
    extends State<BlocLazyBuilder<BlocEvent, BlocState>> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.bloc.emitEvent(widget.bloc.initialEvent);
    });
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
