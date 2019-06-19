/*void main() {
  SortedCollection call = SortedCollection(sort);
  if (call.compare is Function) {
    print('call.compare is Function');
  }
}

class SortedCollection {
  Function compare;
  SortedCollection(int fn(Object a, Object b)) {
    compare = fn;
  }
}

int sort(Object a, Object b) => 0;*/
void main() {
  SortedCollection call = SortedCollection(sort);
  if (call.compare is Function) {
    print('call.compare is Function');
  }
  if (call.compare is Compare) {
    print('call.compare is Compare');
  }
}
// 相当于取一个别名
typedef Compare = int Function(Object a, Object b);
class SortedCollection {
  Compare compare;
  SortedCollection(this.compare);
}

int sort(Object a, Object b) => 0;
