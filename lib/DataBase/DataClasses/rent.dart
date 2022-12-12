class Rent {
  int RentalID ;
  int BorroerID ;
  int CarId ;
  int Duration ;
  DateTime RentalDate;
  String PaymentMethod ;

  Rent(
  {
    required this.Duration,
    required this.BorroerID,
    required this.CarId,
    required this.PaymentMethod,
    required this.RentalDate,
    required this.RentalID
  }
  );
}