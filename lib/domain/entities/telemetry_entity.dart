import 'package:equatable/equatable.dart';

import 'sys1_entity.dart';

class TelemetryEntity extends Equatable {
  final Sys1Entity? air;
  final String ts;

  const TelemetryEntity({
    this.air,
    required this.ts,
  });

  @override
  List<Object?> get props => [
        air,
        ts,
      ];
}
