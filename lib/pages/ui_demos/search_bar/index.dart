import 'package:flutter/material.dart';
import './assets.dart';
import '../../../widgets/index.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchBar'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showSearch(
                  context: context,
                  delegate: _SearchDelegate(),
                ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('SearchBar'),
      ),
    );
  }
}

class _SearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) => <Widget>[
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => query = '',
        ),
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Container(
          width: 100,
          height: 100,
          child: Card(
            color: Colors.white,
            child: Center(
              child: Text(query),
            ),
          ),
        ),
      );

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    final _list = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
            onTap: () {
              query = _list[index];
              showResults(context);
            },
            title: RichText(
              text: TextSpan(
                text: _list[index].substring(0, query.length),
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: _list[index].substring(query.length),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
