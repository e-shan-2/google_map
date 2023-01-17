
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Markingpostion{
  
  static Marker markingLocation(int id,String name,String distance){
    return Marker(markerId:const MarkerId('Id-4'),
  position:const LatLng(28.59691391499506, 77.34976207928399),
  infoWindow: InfoWindow(title:'$name Postion',snippet: distance),
  );
  }
}