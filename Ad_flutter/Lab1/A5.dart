class Counter {
  static int count = 0;

  static void increment() {
    count++;
    print('Current count: $count');
  }
}
class ClassA {
  void accessStatic() {
    print('ClassA accessing static variable:');
    Counter.increment();
  }
}
class ClassB {
  void accessStatic() {
    print('ClassB accessing static variable:');
    Counter.increment();
  }
}

void main() {
  ClassA a = ClassA();
  ClassB b = ClassB();

  a.accessStatic();
  b.accessStatic();
}
