import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../../widgets/index.dart';

class PavlovaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleText = Container(
      padding: EdgeInsets.all(20),
      child: Text(
        'Strawberry Pavlova',
        style: TextStyle(
            fontWeight: FontWeight.w800, letterSpacing: 0.5, fontSize: 30),
      ),
    );
    final subTitleText = Text(
      'Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.',
      textAlign: TextAlign.center,
      style: TextStyle(fontFamily: 'Georgia', fontSize: 25),
    );
    final ratings = Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
              Icon(Icons.star, color: Colors.black),
            ],
          ),
          Text(
            '170 Reviews',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 20),
          ),
        ],
      ),
    );
    final descStyle = TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontFamily: 'Roboto',
        letterSpacing: 0.5,
        fontSize: 18,
        height: 2);
    final buildIcon = (IconData icon, String text, String subtext) {
      return Column(
        children: <Widget>[
          Icon(icon, color: Colors.green[500]),
          Text(text),
          Text(subtext),
        ],
      );
    };
    final iconList = DefaultTextStyle.merge(
        style: descStyle,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              buildIcon(Icons.kitchen, 'PREP:', '25 min'),
              buildIcon(Icons.timer, 'COOK:', '1 hr'),
              buildIcon(Icons.restaurant, 'FEEDS:', '4-6'),
            ],
          ),
        ));
    final leftColumn = Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: <Widget>[titleText, subTitleText, ratings, iconList],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Pavlova'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(5),
          height: 600,
          child: Row(
            children: <Widget>[
              Container(
                width: 400,
                child: leftColumn,
              ),
              Image.asset('assets/images/pavlova.jpg', fit: BoxFit.cover)
            ],
          ),
        ),
      ),
    );
  }
}
