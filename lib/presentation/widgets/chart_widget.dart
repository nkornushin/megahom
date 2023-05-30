import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:intl/intl.dart';
import 'package:megaohm/domain/entities/telemetry_entity.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    super.key,
    required this.telemetry,
  });

  final List<TelemetryEntity> telemetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: 350,
      height: 300,
      child: Chart(
        data: lineMarkerData(telemetry),
        variables: {
          'date': Variable(
            accessor: (Map datum) => datum['date'] as String,
            scale: OrdinalScale(inflate: true),
          ),
          'value': Variable(
            accessor: (Map datum) => datum['value'] as num,
            scale: LinearScale(
              // max: 15,
              // min: -3,
              // tickCount: 7,
              //formatter: (v) => '${v.toInt()} ℃',
              formatter: (v) => '${v.toInt()}',
            ),
          ),
          'group': Variable(
            accessor: (Map datum) => datum['group'] as String,
          ),
        },
        marks: [
          LineMark(
            position: Varset('date') * Varset('value') / Varset('group'),
            color: ColorEncode(
              variable: 'group',
              values: [
                const Color(0xff5470c6),
                const Color(0xff91cc75),
                const Color.fromARGB(255, 198, 84, 166),
                const Color.fromARGB(255, 204, 179, 117),
              ],
            ),
          ),
        ],
        axes: [
          Defaults.horizontalAxis,
          Defaults.verticalAxis,
        ],
        selections: {
          'tooltipMouse': PointSelection(on: {
            GestureType.hover,
          }, devices: {
            PointerDeviceKind.mouse
          }, variable: 'date', dim: Dim.x),
          'tooltipTouch': PointSelection(on: {
            GestureType.scaleUpdate,
            GestureType.tapDown,
            GestureType.longPressMoveUpdate
          }, devices: {
            PointerDeviceKind.touch
          }, variable: 'date', dim: Dim.x),
        },
        tooltip: TooltipGuide(
          followPointer: [true, true],
          align: Alignment.topLeft,
          variables: ['group', 'value'],
        ),
        crosshair: CrosshairGuide(
          followPointer: [false, true],
        ),
        annotations: [
          LineAnnotation(
            dim: Dim.y,
            value: 11.14,
            style: PaintStyle(
              strokeColor: const Color(0xff5470c6).withAlpha(100),
              dash: [2],
            ),
          ),
          LineAnnotation(
            dim: Dim.y,
            value: 1.57,
            style: PaintStyle(
              strokeColor: const Color(0xff91cc75).withAlpha(100),
              dash: [2],
            ),
          ),
          // CustomAnnotation(
          //     renderer: (offset, _) => [
          //           CircleElement(
          //               center: offset,
          //               radius: 5,
          //               style: PaintStyle(fillColor: const Color(0xff5470c6)))
          //         ],
          //     values: ['Wed', 13]),
          // CustomAnnotation(
          //     renderer: (offset, _) => [
          //           CircleElement(
          //               center: offset,
          //               radius: 5,
          //               style: PaintStyle(fillColor: const Color(0xff5470c6)))
          //         ],
          //     values: ['Sun', 9]),
          // CustomAnnotation(
          //     renderer: (offset, _) => [
          //           CircleElement(
          //               center: offset,
          //               radius: 5,
          //               style: PaintStyle(fillColor: const Color(0xff91cc75)))
          //         ],
          //     values: ['Tue', -2]),
          // CustomAnnotation(
          //     renderer: (offset, _) => [
          //           CircleElement(
          //               center: offset,
          //               radius: 5,
          //               style: PaintStyle(fillColor: const Color(0xff91cc75)))
          //         ],
          //     values: ['Thu', 5]),
          // TagAnnotation(
          //   label: Label(
          //       '13',
          //       LabelStyle(
          //         textStyle: Defaults.textStyle,
          //         offset: const Offset(0, -10),
          //       )),
          //   values: ['Wed', 13],
          // ),
          // TagAnnotation(
          //   label: Label(
          //       '9',
          //       LabelStyle(
          //         textStyle: Defaults.textStyle,
          //         offset: const Offset(0, -10),
          //       )),
          //   values: ['Sun', 9],
          // ),
          // TagAnnotation(
          //   label: Label(
          //       '-2',
          //       LabelStyle(
          //         textStyle: Defaults.textStyle,
          //         offset: const Offset(0, -10),
          //       )),
          //   values: ['Tue', -2],
          // ),
          // TagAnnotation(
          //   label: Label(
          //       '5',
          //       LabelStyle(
          //         textStyle: Defaults.textStyle,
          //         offset: const Offset(0, -10),
          //       )),
          //   values: ['Thu', 5],
          // ),
        ],
      ),
    );
  }

  List<Map<dynamic, dynamic>> lineMarkerData(List<TelemetryEntity> telemetry) {
    List<Map<dynamic, dynamic>> data = [];
    //{'day': 'Mon', 'value': 10, 'group': 'Highest'},
    telemetry.map((t) {
      var ts = t.ts.substring(0, t.ts.indexOf('.'));

      var date = DateFormat('yyyy-MM-dd HH:mm:ss')
          .format(DateTime.fromMillisecondsSinceEpoch(int.parse(ts) * 1000));
      data.add({
        'date': date,
        'value': t.air!.sensors[0].h,
        'group': 's1 h',
      });
      data.add({
        'date': date,
        'value': t.air!.sensors[0].t,
        'group': 's1 t',
      });
      data.add({
        'date': date,
        'value': t.air!.sensors[1].h,
        'group': 's2 h',
      });
      data.add({
        'date': date,
        'value': t.air!.sensors[1].t,
        'group': 's2 t',
      });
    }).toList();

    return data;
  }
}
