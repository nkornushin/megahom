import 'sensor.dart';

class Sys1 {
  final List<Sensors> sensors;

  const Sys1({
    required this.sensors,
  });

  factory Sys1.fromJson(dynamic json) {
    List<Sensors> sensors = [];
    if (json['sensors'] != null) {
      json['sensors'].forEach((v) {
        sensors.add(Sensors.fromJson(v));
      });
    }
    return Sys1(
      sensors: sensors,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sensors'] = sensors.map((v) => v.toJson()).toList();
    return data;
  }
}
