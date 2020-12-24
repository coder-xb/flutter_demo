import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../widgets/index.dart';

class AudioPage extends StatefulWidget {
  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<AudioPage> {
  Stopwatch _stopwatch = Stopwatch();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AudioDemo [录音机UI]'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        color: Colors.orangeAccent.withOpacity(.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _recordState(),
            _timerText(),
            _bottomBtn(context),
          ],
        ),
      ),
    );
  }

  Widget _recordState() => Container(
        width: 100,
        height: 100,
        child: _stopwatch.isRunning
            ? Center(
                child: SpinKitWave(
                  color: Colors.black87.withOpacity(.7),
                  type: SpinKitWaveType.start,
                ),
              )
            : Image.asset('assets/images/recorder.png'),
      );

  Widget _bottomBtn(BuildContext context) => Row(
        children: <Widget>[
          _buildButton(_leftButton, Colors.redAccent, context, Icons.stop),
          _buildButton(_rightButton, Colors.blueAccent, context,
              _stopwatch.isRunning ? Icons.pause : Icons.play_arrow),
        ],
      );

  void _leftButton() {
    setState(() {
      _stopwatch
        ..stop()
        ..reset();
    });
  }

  void _rightButton() {
    setState(() {
      _stopwatch.isRunning ? _stopwatch.stop() : _stopwatch.start();
    });
  }

  Widget _buildButton(
      VoidCallback callback, Color color, BuildContext context, IconData icon) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width / 2,
      alignment: Alignment.center,
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36),
        ),
        color: color,
        onPressed: callback,
        child: Icon(
          icon,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }

  Widget _timerText() => Container(
        height: 200,
        child: Center(
          child: _TimerText(stopwatch: _stopwatch),
        ),
      );
}

class _TimerText extends StatefulWidget {
  final Stopwatch stopwatch;
  _TimerText({this.stopwatch});

  @override
  _TimerState createState() => _TimerState(stopwatch: stopwatch);
}

class _TimerState extends State<_TimerText> {
  Timer timer;
  final Stopwatch stopwatch;
  _TimerState({this.stopwatch}) {
    timer = Timer.periodic(Duration(milliseconds: 30), _callback);
  }

  void _callback(Timer timer) {
    if (stopwatch.isRunning) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final TextStyle _textStyle = const TextStyle(
      fontSize: 60,
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w300,
      color: Colors.black87,
    );
    List<String> _formatterTime =
        TimerTextFormatter.format(stopwatch.elapsedMilliseconds);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text(
            '${_formatterTime[0]}:',
            style: _textStyle,
          ),
          width: _width / 5,
        ),
        Container(
          child: Text(
            '${_formatterTime[1]}:',
            style: _textStyle,
          ),
          width: _width / 5,
        ),
        Container(
          child: Text(
            '${_formatterTime[2]}',
            style: _textStyle,
          ),
          width: _width / 5,
        )
      ],
    );
  }
}

class TimerTextFormatter {
  static List<String> format(int ms) {
    int _h = (ms / 10).truncate(), // 时
        _s = (_h / 100).truncate(), // 秒
        _m = (_s / 60).truncate(); // 分

    return [
      (_m % 60).toString().padLeft(2, '0'),
      (_s % 60).toString().padLeft(2, '0'),
      (_h % 100).toString().padLeft(2, '0'),
    ];
  }
}
