import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megaohm/presentation/screens/home_screen_presenter.dart';
import 'package:megaohm/presentation/widgets/chart_widget.dart';
import 'package:megaohm/presentation/widgets/date_picker.dart';
import 'package:provider/provider.dart';

import '../../common/enums/discrete.dart';
import '../../common/models/telemetry_request.dart';
import '../../main.dart';
import '../bloc/telemetry/telemetry_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController dateinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final presenter = context.read<HomeScreenPresenter>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: const Text('Telemetry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: presenter.deviceIdController,
              decoration: const InputDecoration(
                hintText: '12ABCDEF',
                labelText: 'id устройства',
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: DatePicker(
                    controller: presenter.dateFromController,
                    onPickedDate: presenter.onDateFromSelect,
                    labelText: 'с',
                  ),
                ),
                Expanded(
                  child: DatePicker(
                    controller: presenter.dateToController,
                    onPickedDate: presenter.onDateToSelect,
                    labelText: 'по',
                  ),
                ),
              ],
            ),
            StreamBuilder<Discrete>(
                stream: presenter.controllerDiscrete.stream,
                initialData: presenter.discrete,
                builder: (context, snapshot) {
                  return DropdownButton(
                    value: TelemetryRequest.discreteToString(snapshot.data!),
                    items: dropdownItems,
                    onChanged: (String? value) {
                      presenter.setDiscrete(value ?? '');
                    },
                  );
                }),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<TelemetryCubit>(context).getTelemetry(
                  TelemetryRequest(
                    id: presenter.deviceIdController.text,
                    startDate: presenter.dateTimeFrom!,
                    endDate: presenter.dateTimeTo!,
                    discrete: presenter.discrete,
                  ),
                );
              },
              child: const Text('Получить данные'),
            ),
            BlocBuilder<TelemetryCubit, TelemetryState>(
              builder: (context, state) {
                if (state is TelemetryReceived) {
                  return ChartWidget(telemetry: state.telemetry);
                }

                if (state is TelemetryLoading) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
        value: 'hourly',
        child: Text('Ежечасно'),
      ),
      const DropdownMenuItem(
        value: 'daily',
        child: Text('Ежедневно'),
      ),
      const DropdownMenuItem(
        value: 'monthly',
        child: Text('Ежемесячно'),
      ),
    ];
    return menuItems;
  }
}
