import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
    required this.controller,
    required this.onPickedDate,
    this.labelText = 'Выберите дату',
  });

  final TextEditingController controller;
  final String labelText;
  final Function(DateTime? pickedDate) onPickedDate;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        icon: const Icon(
          Icons.calendar_today,
        ),
        labelText: labelText,
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(
            2000,
          ),
          lastDate: DateTime(2101),
        );

        onPickedDate(pickedDate);
      },
    );
  }
}
