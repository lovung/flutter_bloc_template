import 'package:flutter/material.dart';
import 'package:blocdemo/base/bloc_builder.dart';
import 'package:blocdemo/sample/sample_bloc.dart';
import 'package:blocdemo/sample/sample_event.dart';
import 'package:blocdemo/sample/sample_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SampleBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SampleBloc(initialEvent: SampleEventAsIncrease());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: BlocLazyBuilder<SampleEvent, SampleState>(
              bloc: bloc,
              builder: (BuildContext context, SampleState state) {
                if (state.done) {
                  return !state.isError
                      ? Text("${state.counter}", style: TextStyle(fontSize: 30))
                      : Text("${state.error}", style: TextStyle(fontSize: 30));
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                onPressed: () => bloc.emitEvent(SampleEventAsIncrease()),
                icon: Icon(Icons.add),
                label: Text("Add"),
              ),
              FlatButton.icon(
                onPressed: () => bloc.emitEvent(SampleEventAsDecrease()),
                icon: Icon(Icons.delete),
                label: Text("Remove"),
              ),
            ],
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => bloc.emitEvent(SampleEventAsIncrease()),
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
