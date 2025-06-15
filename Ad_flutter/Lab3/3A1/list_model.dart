class User{
  String name;
  int age;

  User(this.name,this.age);

  @override
  String toString() => 'User(name: $name, age :$age)';
}

class UserModel{
  final List<dynamic> _users = [];

  void addUser(String name, int age){
    _users.add(User(name,age));
  }

  List<dynamic> getAllUsers() => _users;

  void updateUser(int index,String newName, int newAge){
    if(index>=0 && index<_users.length){
      _users[index] = User(newName,newAge);
    }
  }

  void deleteUser(int index){
    if(index>=0 && index<_users.length){
      _users.removeAt(index);
    }
  }
}