import 'package:app/DataBase/DataClasses/Car.dart';
import 'package:app/UI/Admin_Interface/cartaps/carCardWidget.dart';
import 'package:flutter/material.dart';

import '../../../DataBase/Database.dart';

class ShowCarsTap extends StatelessWidget {
  SQLDB SqlDb = SQLDB();
  List<Car> cars = [];
  @override
  Widget build(BuildContext context) {
    readCardata();
    return ListView.builder(
              itemBuilder:(_, index) => CarCardWidget(car: cars[index],),
              itemCount: cars.length,
    );
  }
  readCardata ()async{
    List<Map<String , dynamic>> response = await SqlDb.readData("SELECT * FROM 'Car'");
    cars = List.generate(response.length, (index) {
      return Car(
        MakerID: response[index]['MakerID'],
        CarID: response[index]['CarID'],
        CarModel: response[index]['CarModel'],
        Color: response[index]['Color'],
        DepartmentID: response[index]['DepartmentID'],
        EngineCapacity: response[index]['EngineCapacity'],
        Fuel: response[index]['Fuel'],
        FuelTankCapacity: response[index]['FuelTankCapacity'],
        HorsePower: response[index]['HorsePower'],
        ManufacturCompany: response[index]['ManufacturCompany'],
        Image:  response[index]['Image'],
        MaximumSpeed:   response[index]['MaximumSpeed'],
        NumberOfCylinder: response[index]['NumberOfCylinder'],
        Price: response[index]['Price'],
        Seats: response[index]['Seats'],
        TankSize: response[index]['TankSize'],
        TractionType: response[index]['TractionType'],
        TransmissionType:  response[index]['TransmissionType'],
        YearModel:  response[index]['YearModel'],
      );
    });
  }

}
