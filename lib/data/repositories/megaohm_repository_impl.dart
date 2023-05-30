import 'package:megaohm/common/models/telemetry_request.dart';
import 'package:megaohm/data/model/telemetry.dart';
import 'package:megaohm/data/providers/megaohm_provider.dart';

import 'package:megaohm/domain/entities/telemetry_entity.dart';

import '../../common/mappers/telemetry_mapper.dart';
import '../../domain/repositories/megaohm_repository.dart';

class MegaohmRepositoryImpl implements MegaohmRepository {
  final MegaohmProvider provider;

  MegaohmRepositoryImpl(this.provider);

  @override
  Future<List<TelemetryEntity>> getTelemetry(
      TelemetryRequest telemetryRequest) async {
    final List<Telemetry> telemetry =
        await provider.getTelemetry(telemetryRequest);
    return telemetry.map((item) => telemetryMapper(item)).toList();
  }
}
