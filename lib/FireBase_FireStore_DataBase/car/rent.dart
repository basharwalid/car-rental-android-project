class Rent {
  String Rentid ;
  String Carid ;
  String Userid;
  String Departmentid;
  double payment ;
  Rent ({
    required this.Rentid ,
    required this.Carid ,
    required this.Userid ,
    required this.Departmentid,
    required this.payment
  });

  Rent.fromFireStore(Map<String,dynamic> data):this(
    Carid: data['Carid'],
    Departmentid: data['Departmentid'],
    Rentid:data['Rentid'] ,
    Userid: data['Userid'],
    payment: data['payment']
  );

  Map<String ,dynamic> toFireStore(){
    return {
      'Carid' : Carid ,
      'Departmentid' : Departmentid ,
      'Rentid' : Rentid,
      'Userid' : Userid,
      'payment' :payment
    };
  }
}