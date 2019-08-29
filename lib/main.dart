import 'package:carona_unifal/data/ride_data.dart';
import 'package:carona_unifal/tiles/ride_tile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MaterialApp(
  title: "Caronas Unifal",
  theme: ThemeData(
    primaryColor: Colors.blueAccent[900],
  ),
  home: HomeScreen(),
  debugShowCheckedModeBanner: false,
));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Caronas Unifal"),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("rides").getDocuments(),
            builder: (context, snapshot){
              if(!snapshot.hasData){
                return Center( child: CircularProgressIndicator(),);
              } else {
                return ListView.builder(
                    padding: EdgeInsets.all(4.0),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index){
                      RideData rideData = RideData.fromDocument(snapshot.data.documents[index]);
                      return RideTile(rideData);
                    }
                );
              }
            },
        ),
      );
  }
}


