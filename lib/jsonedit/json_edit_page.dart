import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterappjsonedit/jsonedit/json_format_util.dart';

class JsonEditorPage extends StatefulWidget {
  final String jsonString;
  JsonEditorPage({@required this.jsonString});

  @override
  State<StatefulWidget> createState() {
    return _JsonEditorPageState();
  }
}

class _JsonEditorPageState extends State<JsonEditorPage> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    //TextField赋初始值
    _controller.text = JsonFormatUtil.formatJson(widget.jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Json Editor"),
        ),
        body: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 10, top: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Edit the following json to mock the data :",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
            Container(
              height: 1.5,
              color: Colors.blue,
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
//                      decoration: InputDecoration(
//                          border: InputBorder.none,
//                          ),
                      controller: _controller,
                      maxLines: 1000000)),
            ),
            SizedBox(
              height: 13,
            ),
            Builder(
              builder: (BuildContext context) {
                return RaisedButton(
                  color: Colors.blue[300],
                  onPressed: () {
                    _saveMockJson(context);
                  },
                  child: Text("Save"),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }

  //保存mockJson
  void _saveMockJson(BuildContext context) {
    print('onPressed---' + _controller.text);
    try {
      jsonDecode(_controller.text);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("save the json", textAlign: TextAlign.center),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.blue,
        duration: Duration(seconds: 1),
      ));
    } catch (error) {
      print('error---' + error.toString());
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Json format error, failed to save",
            textAlign: TextAlign.center),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.blue,
        duration: Duration(seconds: 1),
      ));
    }
  }
}
