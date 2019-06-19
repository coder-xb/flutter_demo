import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class RichTextPage extends StatefulWidget {
  @override
  _RichTextState createState() => _RichTextState();
}

class _RichTextState extends State<RichTextPage> {
  final String _titleText = 'RichText';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'I',
            style: TextStyle(
              fontSize: 30,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                text: ' Like',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' Flutter',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}
