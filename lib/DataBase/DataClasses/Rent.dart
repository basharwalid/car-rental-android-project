class Rent {
  int RentID ;
  int BorrowerID ;
  int CarID ;
  int Duration;
  DateTime RentalDate ;
  String PaymentMethod ;
  Rent ({
    required this.RentID ,
    required this.BorrowerID ,
    required this.CarID ,
    required this.Duration ,
    required this.RentalDate ,
    required this.PaymentMethod
  });
}
