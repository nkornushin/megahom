import 'package:megaohm/domain/entities/telemetry_entity.dart';

import '../../common/models/telemetry_request.dart';

abstract class MegaohmRepository {
  Future<List<TelemetryEntity>> getTelemetry(TelemetryRequest telemetryRequest);
}
