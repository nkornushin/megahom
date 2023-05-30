import 'package:intl/intl.dart';
import '../enums/discrete.dart';

class TelemetryRequest {
  final String id;
  final DateTime startDate;
  final DateTime endDate;
  final Discrete discrete;

  TelemetryRequest({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.discrete,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['start_date'] = _dateTimeToString(startDate);
    data['end_date'] = _dateTimeToString(endDate);
    data['discrete'] = discreteToString(discrete);

    return data;
  }

  String _dateTimeToString(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String discreteToString(Discrete discrete) {
    String discreteStr = '';

    switch (discrete) {
      case Discrete.daily:
        discreteStr = 'daily';
        break;
      case Discrete.monthly:
        discreteStr = 'monthly';
        break;
      case Discrete.hourly:
        discreteStr = 'hourly';
        break;
      default:
        break;
    }

    return discreteStr;
  }
}
