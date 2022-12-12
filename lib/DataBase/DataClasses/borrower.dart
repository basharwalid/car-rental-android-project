class Borrower {
  int BorrowerID ;
  String BorrowerName ;
  String BorrowerGender ;
  String BorrowerAge;
  String BorrowerNationalID ;
  String BorrowerPhoneNumber ;
  String BorrowerEmail ;
  String BorrowerPassword ;
  String BorrowerUserName ;
  String BorrowerCity ;
  String BorrowerCounter ;
  String BorrowerNationality ;

  Borrower(
  {
    required this.BorrowerAge,
    required this.BorrowerCity,
    required this.BorrowerCounter,
    required this.BorrowerEmail,
    required this.BorrowerGender ,
    required this.BorrowerID,
    required this.BorrowerName,
    required this.BorrowerNationalID,
    required this.BorrowerNationality,
    required this.BorrowerPassword,
    required this.BorrowerPhoneNumber,
    required this.BorrowerUserName
  }
  );
}