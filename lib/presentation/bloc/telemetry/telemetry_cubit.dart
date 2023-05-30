import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:megaohm/domain/entities/telemetry_entity.dart';

import '../../../common/models/telemetry_request.dart';
import '../../../domain/usecases/get_telemetry_usecase.dart';

part 'telemetry_state.dart';

class TelemetryCubit extends Cubit<TelemetryState> {
  final GetTelemetryUseCase getTelemetryUseCase;

  TelemetryCubit({required this.getTelemetryUseCase})
      : super(TelemetryInitial());

  Future<void> getTelemetry(TelemetryRequest telemetryRequest) async {
    try {
      emit(TelemetryLoading());

      final telemetry = await getTelemetryUseCase.call(telemetryRequest);

      emit(TelemetryReceived(telemetry));
    } catch (_) {
      emit(TelemetryFailure());
    }
  }
}
