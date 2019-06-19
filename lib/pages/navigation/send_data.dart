import 'package:flutter/material.dart';
import '../../widgets/index.dart';
// 跨页面传参
class SendDataPage extends StatelessWidget {
  final todos = List.generate(
      20,
      (index) => _ToDo('ToDo $index',
          'A description of what needs to be done for Todo $index'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Data'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      // 动态创建一些todo的list数据
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(todos[index].title),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => _DetailPage(todo: todos[index]),
                  )),
            ),
      ),
    );
  }
}

class _ToDo {
  final String title;
  final String description;
  _ToDo(this.title, this.description);
}

class _DetailPage extends StatelessWidget {
  final _ToDo todo;
  // 构造函数
  _DetailPage({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${todo.title}'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('${todo.description}'),
      ),
    );
  }
}
