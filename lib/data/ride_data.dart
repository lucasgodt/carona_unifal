import 'package:carona_unifal/data/car_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RideData{

  String driverName;
  String rideAvatar;
  DateTime rideTime;
  CarData rideCar;
  int spots;
  List<String> ridePlaces;

  RideData.fromDocument(DocumentSnapshot snapshot){
      driverName = snapshot.data["drivername"];
      rideAvatar = snapshot.data["rideavatar"];
      rideTime = _toDateTime(snapshot.data["ridetime"]);
      rideCar = _toCarData(snapshot.data["cars"]);
      spots = snapshot.data["spots"];
      ridePlaces = _toList(snapshot.data["rideplaces"]);
  }

  DateTime _toDateTime(Timestamp time){
      DateTime time = DateTime(1998);
      return time;
  }

  CarData _toCarData(DocumentSnapshot carsSnapshot){
    CarData x = CarData();
    x.color = "Vermelho";
    x.model = "Up";
    x.plate = "PZE7961";
    return x;
  }

  List<String> _toList(List<dynamic> placesSnapshot){
    return ["Postop","Fonseca"];
  }

}