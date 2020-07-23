import 'package:flutter/material.dart';
import 'package:flutterappjsonedit/jsonedit/json_edit_page.dart';
import 'package:flutterappjsonedit/jsonedit/json_mock_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Json Editor Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  Center(
        child: MaterialButton(
          color: Colors.blue,
          child: Text("Json edit"),
          onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                return JsonEditorPage(jsonString: jsonMock4);
              }));

          },),
      )
    );
  }
}
