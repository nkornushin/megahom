import 'sys1.dart';

class Telemetry {
  final Sys1? air;
  final String ts;

  const Telemetry({
    this.air,
    required this.ts,
  });

  factory Telemetry.fromJson(dynamic json) {
    return Telemetry(
      air: json['air'] != null ? Sys1.fromJson(json['air']) : null,
      ts: json['ts'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (air != null) {
      data['air'] = air!.toJson();
    }
    data['ts'] = ts;
    return data;
  }
}
