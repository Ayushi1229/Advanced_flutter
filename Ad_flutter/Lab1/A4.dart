abstract class Person{
  void sound();
  void eat(){
    print("Person is eating");
  }
}
class Man extends Person{ 
  @override
  void sound(){
    print("Person shouts");
  }
}

class Girl extends Person{
  @override
  void sound(){
    print("Girl is singing");
  }
}

void main(){
  Man man = Man();
  man.sound();
  man.eat();

  Girl girl = Girl();
  girl.sound();
  girl.eat();
}