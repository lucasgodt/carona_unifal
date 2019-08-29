import 'package:carona_unifal/data/ride_data.dart';
import 'package:carona_unifal/tiles/places_tile.dart';
import 'package:flutter/material.dart';

class RideTile extends StatelessWidget {

  RideData rideData;

  RideTile(this.rideData);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Flexible(
                child: Image.network(rideData.rideAvatar, fit: BoxFit.cover, height: 100),
                flex: 1,
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Motorista: " + rideData.driverName),
                    PlacesTile(rideData.ridePlaces),
                    Text("Horário: " + rideData.rideTime.toString()),
                    Text("Vagas: " + rideData.spots.toString()),
                    Text("Modelo do carro: " + rideData.rideCar.model),
                    Text("Cor do carro: " + rideData.rideCar.color),
                    Text("Placa do carro: " + rideData.rideCar.plate),
                  ],
                ),
              ),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
