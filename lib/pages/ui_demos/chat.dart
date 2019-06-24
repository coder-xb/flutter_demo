import 'dart:async';
import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<ChatPage> {
  StreamController _msgController;
  TextEditingController _textController;
  List<dynamic> _msgLists;
  final String _myName = 'MissXb';

  @override
  void initState() {
    _msgController = StreamController();
    _textController = TextEditingController();
    _msgLists = List<dynamic>();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    _msgController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatPage'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                reverse: true,
                itemCount: _msgLists.length,
                itemBuilder: (BuildContext context, int index) => _buildMsgWidget(_msgLists[index], context),
              ),
            ),
            Divider(height: 1),
            _buildInpWidget(context),
          ],
        ),
      ),
    );
  }

  // 创建输入框组件
  Widget _buildInpWidget(BuildContext context) => SizedBox(
    child: Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              decoration: InputDecoration(hintText: 'Speak something...'),
              controller: _textController,
              onChanged: _onMsgChanged,
              onSubmitted: _onMsgSubmitted,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: StreamBuilder(
              initialData: '',
              stream: _msgController.stream,
              builder: (BuildContext context, AsyncSnapshot snapshot) => IconButton(
                icon: Icon(Icons.send),
                color: snapshot.data == '' ? Colors.grey : Theme.of(context).accentColor,
                onPressed: () => _onMsgSubmitted(_textController.text),
              ),
            ),
          )
        ],
      ),
    ),
  );


  // 创建聊天列表项（我方）
  Widget _buildMsgWidget(String text, BuildContext context) => Container(
    margin: const EdgeInsets.symmetric(vertical: 10), // 垂直方向上下各10单位的外边距
    width: MediaQuery.of(context).size.width / 2,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(_myName, style: Theme.of(context).textTheme.subhead,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue.withOpacity(.2),
                ),
                margin: const EdgeInsets.only(top: 5, left: 20),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    text, overflow: TextOverflow.fade,
                    softWrap: true,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 16, left: 8),
          child: CircleAvatar(
            child: Text(_myName[0]),
            backgroundColor: Colors.blueGrey,
          ),
        ),
      ],
    ),
  );

  // 创建聊天列表项（对方）
  /*Widget _buildMsgWidget(String text, BuildContext context) => Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: MediaQuery.of(context).size.width / 2,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 8, left: 16),
          child: CircleAvatar(
            child: Text(_myName[0]),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_myName, style: Theme.of(context).textTheme.subhead,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue.withOpacity(.2),
                ),
                margin: const EdgeInsets.only(top: 5, right: 20),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    text, overflow: TextOverflow.fade,
                    softWrap: true,
                  ),
                ),
              )
            ],
          ),
        ),

      ],
    ),
  );*/

  // 按钮颜色的变化
  void _onMsgChanged(String msg) {
    _msgController.sink.add(msg);
  }

  // 信息提交时
  void _onMsgSubmitted(String msg) {
    _textController.clear();
    if (msg != '') {
      setState(() {
        _msgLists.insert(0, msg);
      });
    }
    _onMsgChanged('');
  }
}
