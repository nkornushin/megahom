import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/enums/discrete.dart';

class HomeScreenPresenter {
  final TextEditingController deviceIdController = TextEditingController()
    ..text = '12ABCDEF';
  final TextEditingController dateFromController = TextEditingController();
  final TextEditingController dateToController = TextEditingController();

  final String _dateFormat = 'dd.MM.yyyy';
  DateTime? _dateTimeFrom;
  DateTime? _dateTimeTo;

  DateTime? get dateTimeFrom => _dateTimeFrom;
  DateTime? get dateTimeTo => _dateTimeTo;

  Discrete _discrete = Discrete.hourly;

  StreamController<Discrete> controllerDiscrete = StreamController<Discrete>();

  Discrete get discrete => _discrete;

  void init() {
    controllerDiscrete.add(discrete);
  }

  void setDiscrete(String seletedDiscrete) {
    if (seletedDiscrete == 'hourly') {
      _discrete = Discrete.hourly;
    }

    if (seletedDiscrete == 'monthly') {
      _discrete = Discrete.monthly;
    }

    if (seletedDiscrete == 'daily') {
      _discrete = Discrete.daily;
    }

    controllerDiscrete.add(_discrete);
  }

  void dispose() {
    deviceIdController.dispose();
    dateFromController.dispose();
    dateToController.dispose();
  }

  void onDateFromSelect(DateTime? dateTime) {
    if (dateTime != null) {
      _dateTimeFrom = dateTime;
      dateFromController.text = DateFormat(_dateFormat).format(dateTime);
    }
  }

  void onDateToSelect(DateTime? dateTime) {
    if (dateTime != null) {
      _dateTimeTo = dateTime;
      dateToController.text = DateFormat(_dateFormat).format(dateTime);
    }
  }
}
