void main() {
  /*var rect = Rectangle(3, 4, 20, 15);
  print('left: '+ rect.left.toString());
  print('right: '+ rect.right.toString());
  rect.right = 30;
  print('更改right值为30之后：');
  print('left: '+ rect.left.toString());
  print('right: '+ rect.right.toString());

  print('top: '+ rect.top.toString());
  print('bottom: '+ rect.bottom.toString());
  rect.bottom = 50;
  print('更改bottom值为50之后：');
  print('top: '+ rect.top.toString());
  print('bottom: '+ rect.bottom.toString());*/


  /*final v = Vector(2, 3);
  final w = Vector(2, 2);
  final r1 = v + w;
  print('r1.x = ' + r1.x.toString() + ' r1.y = ' + r1.y.toString());
  final r2 = v - w;
  print('r2.x = ' + r2.x.toString() + ' r2.y = ' + r2.y.toString());*/

  /*print('实例化一个动物类：');
  var animal = Animal();
  animal.eat();
  animal.run();

  print('实例化一个人类：');
  var human = Human();
  human.eat();
  human.run();
  human.say();
  human.study();*/

  /*var db = DBOperateImpl();
  db.inset();
  db.delet();
  db.update();
  db.query();*/
  /*T t = T();
  t.a();
  t.b();*/

  print(sayHello(Person('李四')));
  print(sayHello(PersonImpl()));
  // List<Color> colors = Color.values;
}
// 构造函数
class User{
  String name; // 成员变量
  int age;
  // 常规构造函数
  /*User(String name, int age) {
    this.name = name;
    this.age = age;
  }*/
  // 常规构造函数(简写)
  /*User(this.name, this.age);*/

  // 初始化列表构造函数
  User(String name, int age) : name = name, age = age;
}
// 读取和写入类
class Rectangle {
  num left;
  num top;
  num width;
  num height;
  Rectangle(this.left, this.top, this.width, this.height);
  // getter 获取right值
  num get right => left + width;
  // setter 设置right值，同时left发生相应变化
  set right(num val) => left = val - width;
  // getter 获取bottom值
  num get bottom => top + height;
  // setter 设置bottom值，同时top发生相应变化
  set bottom(num val) => top = val - height;
}
// 重载操作符
class Vector {
  final int x;
  final int y;
  const Vector(this.x, this.y);

  Vector operator - (Vector v) {
    return Vector(x - v.x, y - v.y);
  }
  Vector operator + (Vector v) {
    return Vector(x + v.x, y + v.y);
  }
}
// 类的继承及成员函数的复写
class Animal {
  void eat() {
    print('动物会吃');
  }
  void run() {
    print('动物会跑');
  }
}
class Human extends Animal {
  @override
  void eat() {
    print('人类会吃');
  }
  @override
  void run() {
    print('人类会跑');
  }

  void say() {
    print('人类会说话');
  }
  void study() {
    print('人类会学习');
  }
}
// 抽象类(接口)
abstract class DBOperate {
  void inset(); // 插入
  void delet(); // 删除
  void update(); // 更新
  void query(); // 查询
}
class DBOperateImpl extends DBOperate {
  void inset(){
    print('插入方法');
  } // 插入
  void delet(){
    print('删除方法');
  } // 插入
  void update(){
    print('更新方法');
  } // 插入
  void query(){
    print('查询方法');
  } // 插入
}
// Mixins 混入
class S {
  a() {
    print('S.a');
  }
}
class A {
  a() {
    print('A.a');
  }
  b() {
    print('A.b');
  }
}
class T = A with S; // 可以视作将两个类合并，重合部分保留S类里面的
// 隐式接口 implements
class Person {
  final name;
  Person(this.name);
  String say(str) => '你好，$str, 我是 $name';
}
class PersonImpl implements Person {
  final name = '';
  String say(str) => '你好，$str, 你知道我是谁吗？';
}
sayHello(Person person) => person.say('张三');
// 枚举 - 特殊类
enum Color {
  red, green, blue
}
