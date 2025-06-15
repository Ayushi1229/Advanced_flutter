class Demo{
  void showDetails(){
    print("This is the demo class");
  }
}
class NewDemo extends Demo{
  @override
  void showDetails(){
    print("This is from NewDemo class");
  }
}
void main(){
  NewDemo newDemo = NewDemo();
  newDemo.showDetails();
  // it will override the Demo's Method and print newDemo's showDetails method
}