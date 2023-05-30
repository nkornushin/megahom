import 'package:dio/dio.dart';
import 'package:megaohm/common/models/telemetry_request.dart';

import 'package:megaohm/data/model/telemetry.dart';

import 'megaohm_provider.dart';

class MegaohmProviderImpl implements MegaohmProvider {
  final Dio dio;

  MegaohmProviderImpl(this.dio);

  @override
  Future<List<Telemetry>> getTelemetry(
      TelemetryRequest telemetryRequest) async {
    final response = await dio.get(
      '/tm/${telemetryRequest.id}',
      queryParameters: telemetryRequest.toJson(),
    );

    final List<Telemetry> list = (response.data as List<dynamic>)
        .map((item) => Telemetry.fromJson(item))
        .toList();

    return list;
  }
}
