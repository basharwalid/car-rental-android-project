import 'package:app/FireBase_FireStore_DataBase/car/car.dart';
import 'package:app/FireBase_FireStore_DataBase/car/employee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class  MyDataBase {

  static CollectionReference<Car> getCarCollection(){
    var carcollectionref = FirebaseFirestore.instance.collection("Car").withConverter(
        fromFirestore: (snapshot, options) => Car.fromFireStore(snapshot.data()!),
        toFirestore: (value, options) => value.toFireStore()
    );
    return carcollectionref ;
  }

  static Future<void> insertCarData(Car car){
    var ref =  getCarCollection() ;
    var doc = ref.doc();
    car.CarID = doc.id ;
    return doc.set(car);
  }

  static Future<List<Car>> getCarsData() async{
    var snapshot = await getCarCollection().get();
    var list = snapshot.docs.map((doc) => doc.data()).toList();
    return list;
  }

  static deletecar(Car car) async{
    var cardoc = getCarCollection().doc(car.CarID);
    return cardoc.delete();
  }

  static updatecar(Car car) async {
    var cardoc = getCarCollection().doc(car.CarID);
    var ref = cardoc.update(car.toFireStore());
  }

  static CollectionReference<Employee> getEmployeeCollection(){
    var carcollectionref = FirebaseFirestore.instance.collection("Employee").withConverter(
        fromFirestore: (snapshot, options) => Employee.fromFireStore(snapshot.data()!),
        toFirestore: (value, options) => value.tofirestore() );
    return carcollectionref ;
  }

  static Future<void> insertEmployeeData(Employee employee){
    var ref = getEmployeeCollection();
    var doc = ref.doc();
    employee.EmployeeID = doc.id ;
    return doc.set(employee);
  }

  static Future<List<Employee>> getEmployeesData() async{
    var snapshot = await getEmployeeCollection().get();
    var list = snapshot.docs.map((doc) => doc.data()).toList();
    return list;
  }

  static deleteEmployee(Employee employee) async{
    var cardoc = getEmployeeCollection().doc(employee.EmployeeID);
    return cardoc.delete();
  }

  static updateEmployee(Employee employee) async {
    var cardoc = getEmployeeCollection().doc(employee.EmployeeID);
    var ref = cardoc.update(employee.tofirestore());
  }
}