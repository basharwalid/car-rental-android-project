import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class SQLDB {

  static Database? _db;

  Future<Database?> get db async {
    if (_db == null){
      _db  = await instialDB() ;
      return _db ;
    }else {
      return _db ;
    }
  }

  instialDB() async {
    String databasepath = await getDatabasesPath() ;
    String path = join(databasepath , 'Car Rental System DataBase.db') ;
    Database mydb = await openDatabase(path , onCreate: _onCreate , version: 1  , onUpgrade:_onUpgrade ) ;
    return mydb ;
  }

  _onUpgrade(Database db , int oldvertion , int newVersion){
    print(db.path);
    print("onupgrade ========================");
  }

  _onCreate(Database db , int version) async{
    print ("Start Creating Database \n  ==================================================");
    await db.execute('''
      CREATE TABLE Make (
        MakerID INTEGER NOT NULL ,
        MakerName TEXT NOT NULL ,
        OriginCountry TEXT NULL ,
        Agent TEXT NULL , 
      
        PRIMARY KEY (MakerID)
      )
    ''');
    print ("Create Make Table \n  ==================================================");
    await db.execute('''
    CREATE TABLE Department (
      DepartmentID INTEGER NOT NULL , 
      DepartmentName TEXT NOT NULL , 
      DepartmentLocation TEXT NOT NULL , 
      DepartmentStartDate TEXT NOT NULL ,
    
      PRIMARY KEY (DepartmentID)
    )

    ''');
    print ("Create Department Table \n  ==================================================");
    await db.execute('''
    CREATE TABLE Car (
      CarID INTEGER  NOT NULL ,
      Color TEXT NOT NULL , 
      DepartmentID INTEGER NOT NULL,
      MakerID INTEGER NOT NULL ,
      ManufacturCompany TEXT NOT NULL ,
      CarModel TEXT NOT NULL , 
      EngineCapacity TEXT NOT NULL , 
      HorsePower TEXT NOT NULL , 
      MaximumSpeed TEXT NOT NULL ,
      TransmissionType TEXT NOT NULL ,
      YearModel TEXT NOT NULL , 
      Fuel TEXT NOT NULL , 
      TankSize TEXT NOT NULL , 
      Seats TEXT NOT NULL , 
      TractionType TEXT NOT NULL , 
      FuelTankCapacity TEXT NOT NULL , 
      NumberOfCylinder TEXT NOT NULL , 
      Price REAL NOT NULL ,
    
      PRIMARY KEY (CarID) ,
      FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ,
      FOREIGN KEY (MakerID) REFERENCES Make(MakerID)
    )
    ''');
    print ("Create car Table \n  ==================================================");
    await db.execute('''
    CREATE TABLE Borrower (
      BorrowerID INTEGER NOT NULL , 
      BorrowerName TEXT NOT NULL , 
      Gender TEXT NOT NULL , 
      NationalID TEXT NOT NULL , 
      PhoneNumber TEXT NOT NULL ,
      Email TEXT NOT NULL ,
      BorrowerPassword TEXT NOT NULL , 
      UserName TEXT , 
      City TEXT NOT NULL , 
      Country TEXT NOT NULL , 
      Nationalty TEXT NOT NULL ,
    
      PRIMARY KEY (BorrowerID) 
    )
    ''');
    print ("Create Borrower Table \n  ==================================================");
    await db.execute('''
    CREATE TABLE Employee (
      EmployeeID INTEGER NOT NULL , 
      EmployeeName TEXT NOT NULL , 
      EmployeeDepartment INTEGER NOT NULL ,
      EmployeeEmail TEXT NOT NULL , 
      EmployeeUserName TEXT NOT NULL , 
      EmployeePassword TEXT NOT NULL , 
      EmployeeGender TEXT NOT NULL , 
      EmployeeAge TEXT NOT NULL , 
      EmployeeNationalID TEXT NOT NULL , 
      EmployeePhoneNumber TEXT NOT NULL , 
      EmployeeCountry TEXT NOT NULL , 
      EmployeeCity TEXT NOT NULL , 
      EmployeeAddress TEXT NOT NULL , 
      EmployeeNationality TEXT NOT NULL , 
      EmployeeSalary TEXT NOT NULL , 
      EmployeeBankingInforamtion TEXT NOT NULL ,
      EmployeeGraduationState TEXT NOT NULL ,
    
      PRIMARY KEY (EmployeeID),
      FOREIGN KEY (EmployeeDepartment) REFERENCES Department(DepartmentID) ON DELETE CASCADE ON UPDATE CASCADE 
    
    )
    ''');
    print ("Create Employee Table \n  ==================================================");
    await db.execute('''
    CREATE TABLE Reservation (
      ReservationID INTEGER NOT NULL , 
      CarId INTEGER NOT NULL ,
      DepartmentID INTEGER NOT NULL ,
      BorroweID INTEGER NOT NULL ,
    
      PRIMARY KEY (ReservationID),
      FOREIGN KEY (CarId) REFERENCES Car(CarID),
      FOREIGN KEY (BorroweID) REFERENCES Borrower(BorrowerID),
      FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
    )
    ''');
    print ("Create Reservation Table \n  ==================================================");
    await db.execute('''
    CREATE TABLE Rent (
      RentID INTEGER NOT NULL , 
      BorrowerID INTEGER NOT NULL , 
      CarID INTEGER NOT NULL , 
      Duration INTEGER NOT NULL , 
      RentalDate DATE NOT NULL , 
      PaymentMethod TEXT NOT NULL , 
    
      PRIMARY KEY (RentID) ,
      FOREIGN KEY (BorrowerID) REFERENCES Borrower(BorrowerID) ON DELETE CASCADE ON UPDATE CASCADE ,
      FOREIGN KEY (CarID ) REFERENCES Car(CarID) ON DELETE CASCADE ON UPDATE CASCADE 
    )
    ''');
    print ("Create Rent Table \n  ==================================================");

  }

  readData(String sql) async{
    Database? mydb = await db;
    var response =  await mydb!.rawQuery(sql);
    return response;
  }
  insertData(String sql) async{
    Database? mydb = await db;
    var response =  await mydb!.rawInsert(sql);
    print(mydb.path);
    return response;
  }
  deleteData(String sql) async{
    Database? mydb = await db;
    var response =  await mydb!.rawDelete(sql);
    return response;
  }
  updateData(String sql) async{
    Database? mydb = await db;
    var response =  await mydb!.rawUpdate(sql);
    return response;
  }

}