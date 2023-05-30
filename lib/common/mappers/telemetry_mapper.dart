import 'package:megaohm/data/model/sys1.dart';
import 'package:megaohm/domain/entities/sensor_entity.dart';
import 'package:megaohm/domain/entities/sys1_entity.dart';

import '../../data/model/telemetry.dart';
import '../../domain/entities/telemetry_entity.dart';

TelemetryEntity telemetryMapper(Telemetry telemetry) {
  return TelemetryEntity(
    air: _sys1ToEntity(telemetry.air),
    ts: telemetry.ts,
  );
}

Sys1Entity _sys1ToEntity(Sys1? sys1) {
  return Sys1Entity(
    sensors: sys1 != null
        ? sys1.sensors
            .map((s) => SensorsEntity(h: s.h, sid: s.sid, t: s.t))
            .toList()
        : [],
  );
}
