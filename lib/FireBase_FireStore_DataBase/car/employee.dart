class Employee {
  String EmployeeID ;
  int    EmployeeDepartment ;
  String EmployeeName ;
  String EmployeeEmail ;
  String EmployeePassword ;
  String EmployeeAge ;
  String EmployeeNationalID ;
  String EmployeePhoneNumber ;
  double EmployeeSalary ;
  String Image ;

  Employee ({
    required this.EmployeeID ,
    required this.EmployeeDepartment ,
    required this.EmployeeName ,
    required this.EmployeeEmail ,
    required this.EmployeePassword ,
    required this.EmployeeAge ,
    required this.EmployeeNationalID ,
    required this.EmployeePhoneNumber ,
    required this.EmployeeSalary ,
    required this.Image
  });

  Employee.fromFireStore(Map<String , dynamic> data):this(
      EmployeeID : data['EmployeeID'],
      EmployeeDepartment : data['EmployeeDepartment'],
      EmployeeName : data['EmployeeName'] ,
      EmployeeEmail : data ['EmployeeEmail'],
      EmployeePassword : data['EmployeePassword'],
      EmployeeAge : data['EmployeeAge'],
      EmployeeNationalID : data['EmployeeNationalID'] ,
      EmployeePhoneNumber : data['EmployeePhoneNumber'] ,
      EmployeeSalary : data['EmployeeSalary'],
      Image : data['Image'],
  );

  Map<String , dynamic> tofirestore (){
    return {
      'EmployeeID' : EmployeeID ,
      'EmployeeDepartment' : EmployeeDepartment,
      'EmployeeName' : EmployeeName ,
      'EmployeeEmail' : EmployeeEmail,
      'EmployeePassword' : EmployeePassword,
      'EmployeeAge' : EmployeeAge,
      'EmployeeNationalID' : EmployeeNationalID,
      'EmployeePhoneNumber' : EmployeePhoneNumber ,
      'EmployeeSalary' : EmployeeSalary ,
      'Image' : Image,
    };
}
}