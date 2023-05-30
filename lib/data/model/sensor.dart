class Sensors {
  final String sid;
  final double h;
  final double t;

  const Sensors({
    required this.h,
    required this.sid,
    required this.t,
  });

  factory Sensors.fromJson(dynamic json) {
    return Sensors(
      sid: json['sid'] as String,
      h: json['h'] as double,
      t: json['t'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sid'] = sid;
    data['h'] = h;
    data['t'] = t;
    return data;
  }
}
