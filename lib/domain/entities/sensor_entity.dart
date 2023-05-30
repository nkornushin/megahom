import 'package:equatable/equatable.dart';

class SensorsEntity extends Equatable {
  final String sid;
  final double h;
  final double t;

  const SensorsEntity({
    required this.h,
    required this.sid,
    required this.t,
  });

  @override
  List<Object?> get props => [
        sid,
        h,
        t,
      ];
}
