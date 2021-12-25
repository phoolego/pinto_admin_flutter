class Farmer{
  int userId=0;
  String firstname='';
  String lastname='';
  String email='';
  String address='';
  String contact='';
  String farmName='';
  double maxArea=0;
  String role='';

  Farmer(Map<String,dynamic> jsonFarmer){
    userId = jsonFarmer['user_id'];
    firstname = jsonFarmer['firstname'];
    lastname = jsonFarmer['lastname'];
    email = jsonFarmer['email'];
    address = jsonFarmer['address'];
    contact = jsonFarmer['contact'];
    farmName = jsonFarmer['farm_name'] ?? '';
    maxArea = jsonFarmer['max_area']==null?0:jsonFarmer['max_area']+0.0;
    role = jsonFarmer['role'];
  }

  String getRole(){
    if(role=='ADMIN'){
      return 'ผู้ดูแลระบบ';
    }else if(role=='REQ-FARMER'){
      return 'ขอสิทธิ์เกษตกร';
    }else{
      return 'เกษตกร';
    }
  }
}