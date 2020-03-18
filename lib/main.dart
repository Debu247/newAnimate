import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
final RelativeRectTween relativeRectTween = RelativeRectTween(
  begin: RelativeRect.fromLTRB(40, 0, 40, 0),
  end: RelativeRect.fromLTRB(10, 40, 0, 140),
);

class Pos extends StatefulWidget {
  _PosState createState() => _PosState();
}
class _PosState extends State<Pos> with TickerProviderStateMixin {


  AnimationController _controller;

  bool _first = true;

  initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
//      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          color: Colors.blue[50],
          height: 400,
          width: 400,
          child: Stack(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  if (_first) {
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                  _first = !_first;
                },
                child: Text(
                  "CLICK ME!",
                ),
              ),
              
              PositionedTransition(

                rect: relativeRectTween.animate(_controller),
                child: Container(
                  child: Container(
                    width: 200,
                    height: 200,
                    padding: EdgeInsets.all(20),
                    child: Icon(Icons.looks_two)
                    
                  ),
                ),
              ),
            ],
          ),
        ),



      ],
    );
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'boom boom',
      home: Pos(),
    );
  }
}

void main() => runApp(MyApp());