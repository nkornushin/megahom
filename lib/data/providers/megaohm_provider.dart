import '../../common/models/telemetry_request.dart';
import '../model/telemetry.dart';

abstract class MegaohmProvider {
  Future<List<Telemetry>> getTelemetry(TelemetryRequest telemetryRequest);
}
