class Employee {
  int EmployeeID ;
  int DepartmentId ;
  String EmployeeName ;
  String EmployeeEmail ;
  String EmployeeUserName ;
  String EmployeePassword ;
  String EmployeeGender ;
  String EmployeeAge ;
  String EmployeeNationalID ;
  String EmployeePhoneNumber ;
  String EmployeeCountry ;
  String EmployeeCity ;
  String EmployeeAddress ;
  String EmployeeNationality ;
  String EmployeeSalary ;
  String EmployeeBankingInformation ;
  String EmployeeGraduationState ;

  Employee(
  {
    required this.DepartmentId,
    required this.EmployeeAddress,
    required this.EmployeeAge,
    required this.EmployeeBankingInformation,
    required this.EmployeeCity,
    required this.EmployeeCountry,
    required this.EmployeeEmail,
    required this.EmployeeGender,
    required this.EmployeeGraduationState,
    required this.EmployeeID,
    required this.EmployeeName,
    required this.EmployeeNationalID,
    required this.EmployeeNationality,
    required this.EmployeePassword,
    required this.EmployeePhoneNumber,
    required this.EmployeeSalary,
    required this.EmployeeUserName,
  }
  );
}