import 'package:app/FireBase_FireStore_DataBase/car/car.dart';
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
}