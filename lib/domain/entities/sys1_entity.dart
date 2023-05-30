import 'package:equatable/equatable.dart';

import 'sensor_entity.dart';

class Sys1Entity extends Equatable {
  final List<SensorsEntity> sensors;

  const Sys1Entity({
    required this.sensors,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        sensors,
      ];
}
