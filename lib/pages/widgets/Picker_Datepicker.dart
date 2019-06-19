import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class DatePickerPage extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePickerPage> {
  final String _titleText = 'DatePicker';
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  Future<void> _pickDate(BuildContext context) async {
    final DateTime _picker = await showDatePicker(
      context: context,
      // 初始日期
      initialDate: _date,
      // 起始日期
      firstDate: DateTime(2019, 1),
      // 结束日期
      lastDate: DateTime(2099, 1),
    );
    if (_picker != null && _picker != _date) {
      print('The current selection date is：${_date.toString()}');
    }
    setState(() {
      _date = _picker;
    });

    if (_picker == null) {
      _date = DateTime.now();
    }

  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay _picker = await showTimePicker(
      context: context,
      // 初始日期
      initialTime: _time,
    );
    if (_picker != null && _picker != _time) {
      print('The current selection time is：${_time.toString()}');
    }
    setState(() {
      _time = _picker;
    });

    if (_picker == null) {
      _time = TimeOfDay.now();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Date selection'),
            RaisedButton(
              child: Text('Date selection result：${_date.toString()}'),
              onPressed: () {
                _pickDate(context);
              },
            ),
            Divider(),
            Text('Time selection'),
            RaisedButton(
              child: Text('Time selection result：${_time.toString()}'),
              onPressed: () {
                _pickTime(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
