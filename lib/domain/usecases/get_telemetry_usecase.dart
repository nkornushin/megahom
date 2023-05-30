import '../../common/models/telemetry_request.dart';
import '../entities/telemetry_entity.dart';
import '../repositories/megaohm_repository.dart';

class GetTelemetryUseCase {
  final MegaohmRepository repository;

  GetTelemetryUseCase({
    required this.repository,
  });

  Future<List<TelemetryEntity>> call(TelemetryRequest telemetryRequest) async {
    return await repository.getTelemetry(telemetryRequest);
  }
}
