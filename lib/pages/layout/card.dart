import 'package:flutter/material.dart';

import '../../widgets/index.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // scaffold是一个基于Material的组件框架
    return Scaffold(
      appBar: AppBar(
        title: Text('Card'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: SizedBox( // SizedBox一个特定大小的盒子组件
          height: 210,
          child: Card( // 卡片组件
            child: Column(
              children: [
                ListTile( // ListTile一个固定高度的行，通常包含一些文本，以及一个行前或行尾图标
                  title: Text(
                    '1625 Main Street',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('My City, CA 99984'),
                  leading: Icon(Icons.restaurant_menu, color: Colors.blue[500]),
                ),
                Divider(), // 一个逻辑1像素厚的水平分割线，两边都有填充
                ListTile(
                  title: Text(
                    '(408) 555-1212',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.contact_phone, color: Colors.blue[500]),
                ),
                ListTile(
                  title: Text('costa@example.com'),
                  leading: Icon(Icons.contact_mail, color: Colors.blue[500]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
