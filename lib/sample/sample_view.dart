import 'package:flutter/material.dart';

import '../base/bloc_event_state_builder.dart';
import 'sample_bloc.dart';
import 'sample_event.dart';
import 'sample_state.dart';

class SampleWidgetView extends StatefulWidget {
  @override
  _SampleWidgetViewState createState() => _SampleWidgetViewState();
}

class _SampleWidgetViewState extends State<SampleWidgetView> {
  SampleBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SampleBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocEventStateBuilder<SampleEvent, SampleState>(
      bloc: bloc,
      initialEvent: SampleEventAsIncrease(),
      builder: (BuildContext context, SampleState state) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
              child: state.done
                  ? !state.isError
                      ? Text("${state.counter}", style: TextStyle(fontSize: 30))
                      : Text("${state.error}", style: TextStyle(fontSize: 30))
                  : CircularProgressIndicator()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                onPressed: !state.isBusy
                    ? () => bloc.emitEvent(SampleEventAsIncrease())
                    : null,
                icon: Icon(Icons.add),
                label: Text("Add"),
              ),
              FlatButton.icon(
                onPressed: !state.isBusy
                    ? () => bloc.emitEvent(SampleEventAsDecrease())
                    : null,
                icon: Icon(Icons.delete),
                label: Text("Remove"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
