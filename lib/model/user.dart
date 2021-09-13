class User {
  int userId=0;
  String firstname='';
  String lastname='';
  String email='';
  String address='';
  String contact='';
  String role='';

  User(Map<String,dynamic> jsonUser){
    userId = jsonUser['user_id'];
    firstname = jsonUser['firstname'];
    lastname = jsonUser['lastname'];
    email = jsonUser['email'];
    address = jsonUser['address'];
    contact = jsonUser['contact'];
    role = jsonUser['role'];
  }
  User.notLogin(){
    userId=0;
    firstname='';
    lastname='';
    email='';
    address='';
    contact='';
    role='';
  }
}