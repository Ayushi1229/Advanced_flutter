import 'dart:io';

class Student{
  String? name;
  int? id;

  Student({this.name, this.id});

  void StudentDetail(){
    print("Student Details:");
    print("Name: ${name}");
    print("Id: ${id}");
  }
}

void main(){
  Student student1 = Student(name: "bob", id :101);
  student1.StudentDetail();
  print("\n");
}