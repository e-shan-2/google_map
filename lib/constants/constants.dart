import 'dart:math';

class Constants {
  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  List<dynamic> data = [
    {
      //Eshan's location
      "lat": 37.422099,
      "lng": -122.084047,
    },
    {
      //saqlain's location
      "lat": 37.427193,
      "lng": -122.080707,
    },
    {
      //vikrants's location
      "lat": 37.433906,
      "lng": -122.088947,
    },
    {
      //hardiks location
      "lat": 37.416360,
      "lng": -122.0853358,
    },
  ];

  double totaldistance = 0;

  String? pass(int i) {
    totaldistance = calculateDistance(
        data[0]["lat"], data[0]["lng"], data[i]["lat"], data[i]["lng"]);
    int value = totaldistance.round();
    return value.toString();
  }
}
