class User {
  int userId=0;
  String username='';
  String email='';
  String address='';
  String contact='';
  String role='';

  User(Map<String,dynamic> jsonUser){
    userId = jsonUser['user_id'];
    username = jsonUser['username'];
    email = jsonUser['email'];
    address = jsonUser['address'];
    contact = jsonUser['contact'];
    role = jsonUser['role'];
  }
  User.notLogin(){
    userId=0;
    username='';
    email='';
    address='';
    contact='';
    role='';
  }
}