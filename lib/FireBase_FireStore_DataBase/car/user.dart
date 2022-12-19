class User {
  String id ;
  String Name ;
  String Email ;
  String Password ;
  String PhoneNumber ;
  String Country ;
  String Iamge ;

  User ({
    required this.id,
    required this.Name,
    required this.Email,
    required this.Password,
    required this.PhoneNumber,
    required this.Country,
    required this.Iamge,
  });

  User.fromFireStore(Map<String,dynamic> data):this(
    id: data['id'],
    Name: data['Name'],
    Email: data ['Email'],
    Password: data['Password'],
    PhoneNumber: data['PhoneNumber'],
    Country: data['Country'],
    Iamge: data['Image']
  );

  Map<String , dynamic> tofirestore (){
    return{
      'id':id,
      'Name':Name ,
      'Email':Email,
      'Password':Password,
      'PhoneNumber':PhoneNumber,
      'Country':Country,
      'Image' : Iamge ,
    };
  }
}