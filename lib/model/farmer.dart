class Farmer{
  int userId=0;
  String firstname='';
  String lastname='';
  String email='';
  String address='';
  String contact='';
  String farmName='';
  double maxArea=0;

  Farmer(Map<String,dynamic> jsonFarmer){
    userId = jsonFarmer['user_id'];
    firstname = jsonFarmer['firstname'];
    lastname = jsonFarmer['lastname'];
    email = jsonFarmer['email'];
    address = jsonFarmer['address'];
    contact = jsonFarmer['contact'];
    farmName = jsonFarmer['farm_name'];
    maxArea = jsonFarmer['max_area']+0.0;
  }
}