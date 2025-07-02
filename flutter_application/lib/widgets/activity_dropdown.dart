import 'package:flutter/material.dart';

class ActivityDropdown extends StatelessWidget {
  final int? selectedActivity;
  final ValueChanged<int?> onChanged;

  const ActivityDropdown({
    super.key,
    required this.selectedActivity,
    required this.onChanged,
  });

  static const activityOptions = {
    0: 'Sedentary',
    1: 'Lightly Active',
    2: 'Moderately Active',
    3: 'Very Active',
    4: 'Extremely Active',
  };

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      dropdownColor: Colors.white,
      value: selectedActivity,
      decoration: InputDecoration(
        labelText: 'Type of Physical Activity',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      items: activityOptions.entries.map((entry) {
        return DropdownMenuItem<int>(
          value: entry.key,
          child: Text(entry.value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
