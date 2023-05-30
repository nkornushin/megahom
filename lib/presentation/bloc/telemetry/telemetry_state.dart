part of 'telemetry_cubit.dart';

abstract class TelemetryState extends Equatable {
  const TelemetryState();

  @override
  List<Object> get props => [];
}

class TelemetryInitial extends TelemetryState {}

class TelemetryLoading extends TelemetryState {
  @override
  List<Object> get props => [];
}

class TelemetryReceived extends TelemetryState {
  final List<TelemetryEntity> telemetry;

  const TelemetryReceived(this.telemetry);

  @override
  List<Object> get props => [telemetry];
}

class TelemetryFailure extends TelemetryState {
  @override
  List<Object> get props => [];
}
