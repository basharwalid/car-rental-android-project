class Car {
  int CarID ;
  String Color ;
  String ManfuterCompany ;
  String CarModel;
  String EnginePower ;
  String HorsePower ;
  String MaximumSpeed ;
  String TransmissionType ;
  String Year ;
  String TrunkSize ;
  String Seats;
  String TractionCapacity ;
  String FuelTankCapability ;
  String NumberofCylinders;
  String Price ;
  String RentalPoints ;

  Car(
    {
      required this.CarID ,
      required this.Color ,
      required this.ManfuterCompany,
      required this.CarModel ,
      required this.EnginePower ,
      required this.Price ,
      required this.MaximumSpeed,
      required this.FuelTankCapability,
      required this.HorsePower,
      required this.NumberofCylinders,
      required this.RentalPoints,
      required this.Seats,
      required this.TractionCapacity,
      required this.TransmissionType,
      required this.TrunkSize,
      required this.Year,
    }
  );

}