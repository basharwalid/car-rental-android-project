class Car{
  String CarID ;
  String DepartmentID ;
  String Color ;
  String ManufacturCompany ;
  String CarModel ;
  String HorsePower ;
  String MaximumSpeed ;
  String TransmissionType ;
  String YearModel ;
  String Seats;
  double Price;
  String Image;
  bool isAvilable ;

  Car ({
    required this.CarID ,
    required this.DepartmentID ,
    required this.Color ,
    required this.ManufacturCompany ,
    required this.CarModel ,
    required this.HorsePower ,
    required this.MaximumSpeed ,
    required this.TransmissionType ,
    required this.YearModel ,
    required this.Seats,
    required this.Price,
    required this.Image,
    this.isAvilable = true,
  });

  Car.fromFireStore(Map<String , dynamic> data):this(
    CarID : data['CarID'] ,
    DepartmentID : data['DepartmentID'] ,
    Color : data['Color'] ,
    ManufacturCompany : data['ManufacturCompany'] ,
    CarModel : data['CarModel'] ,
    HorsePower : data['HorsePower'] ,
    MaximumSpeed : data['MaximumSpeed'] ,
    TransmissionType : data['TransmissionType'] ,
    YearModel : data['YearModel'] ,
    Seats : data['Seats'] ,
    Price : data['Price'] ,
    Image : data['Image'] ,
    isAvilable : data['isAvilable'] ,
    );

  Map<String ,dynamic> toFireStore(){
    return{
      'CarId':CarID ,
      'DepartmentID':DepartmentID ,
      'Color':Color,
      'ManufacturCompany':ManufacturCompany ,
      'CarModel':CarModel ,
      'HorsePower':HorsePower,
      'MaximumSpeed':MaximumSpeed ,
      'TransmissionType':TransmissionType ,
      'YearModel':YearModel ,
      'Seats':Seats,
      'Price':Price ,
      'Image':Image ,
      'isAvilable':isAvilable
    };
  }
}