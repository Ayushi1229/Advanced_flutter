class Parent{
  void showparentdetails(){
    print("This is parent class");
  }
}
class Child extends Parent{
  void showchilddetails(){
    super.showparentdetails();
    print("This is child class");
  }
}
void main(){
  Parent parent = Parent();
  //in the above line parent is the reference of the object and Parent() is the object
  Child child = Child();

  parent.showparentdetails();
  child.showchilddetails();
}