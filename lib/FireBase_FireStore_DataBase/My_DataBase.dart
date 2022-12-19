import 'package:app/FireBase_FireStore_DataBase/car/car.dart';
import 'package:app/FireBase_FireStore_DataBase/car/employee.dart';
import 'package:app/FireBase_FireStore_DataBase/car/user.dart';
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

  static Stream<QuerySnapshot<Car>> getcardatastream(){
    return getCarCollection().snapshots();
  }

  static Stream<QuerySnapshot<Car>> getcardatastreamwithQuire(String departmentid){
    return getCarCollection().where('DepartmentID' , isEqualTo: departmentid ).where('isAvilable' , isEqualTo: true).snapshots();
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

  static Stream<QuerySnapshot<Employee>> getEmployeesData(){
    return getEmployeeCollection().snapshots();
  }

  static deleteEmployee(Employee employee) async{
    var cardoc = getEmployeeCollection().doc(employee.EmployeeID);
    return cardoc.delete();
  }

  static updateEmployee(Employee employee) async {
    var cardoc = getEmployeeCollection().doc(employee.EmployeeID);
    var ref = cardoc.update(employee.tofirestore());
  }

  static CollectionReference<User> getUsersCollection(){
    var carcollectionref = FirebaseFirestore.instance.collection("Users").withConverter(
        fromFirestore: (snapshot, options) => User.fromFireStore(snapshot.data()!),
        toFirestore: (value, options) => value.tofirestore() );
    return carcollectionref ;
  }

  static Future<void> insertUserData(User user){
    var ref = getUsersCollection();
    var doc = ref.doc();
    user.id = doc.id ;
    return doc.set(user);
  }

  static Stream<QuerySnapshot<User>> getUserData(){
    return getUsersCollection().snapshots();
  }

  static deleteUse(User user) async{
    var cardoc = getUsersCollection().doc(user.id);
    return cardoc.delete();
  }

  static updateUser(User user) async {
    var cardoc = getUsersCollection().doc(user.id);
    var ref = cardoc.update(user.tofirestore());
  }
}