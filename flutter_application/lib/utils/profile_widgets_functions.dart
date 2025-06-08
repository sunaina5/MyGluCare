import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<DateTime?> pickDate(BuildContext context, DateTime? selectedDob) async {
  DateTime tempPickedDate = selectedDob ?? DateTime(2000);

  return await showCupertinoModalPopup<DateTime>(
    context: context,
    builder: (_) => Container(
      height: 350,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(null),
                  style: OutlinedButton.styleFrom(foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Cancel'),
                ),
                OutlinedButton(
                  
                  onPressed: () {
                    Navigator.of(context).pop(tempPickedDate);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    side: const BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Done'),
                ),
              ],
            ),
          ),
          Expanded(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: tempPickedDate,
              minimumDate: DateTime(1900),
              maximumDate: DateTime.now(),
              onDateTimeChanged: (date) {
                tempPickedDate = date;
              },
            ),
          ),
          
        ],
      ),
    ),
  );
}


Future<String?> showSexPicker({
  required BuildContext context,
  String? currentValue,
}) async {
  final List<String> sexOptions = [
    'Male',
    'Female',
    'Transgender',
    'Non-Binary',
    'Genderqueer',
    'Agender',
    'Two-Spirit',
    'Intersex',
    'Prefer not to say',
    'Other',
  ];

  int initialIndex = currentValue != null
      ? sexOptions.indexOf(currentValue)
      : 0;
  int tempIndex = initialIndex;

  return await showCupertinoModalPopup<String>(
    context: context,
    builder: (_) => SafeArea(
      child: Container(
        height: 300,
        color: Colors.white,
        child: Column(
          children: [
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    
                    onPressed: () => Navigator.of(context).pop(null),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                  OutlinedButton(
                    
                    onPressed: () {
                      Navigator.of(context).pop(sexOptions[tempIndex]);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      side: const BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Done'),
                  ),
                ],
              ),
             ),
            Expanded(
              child: CupertinoPicker(
                itemExtent: 40,
                scrollController:
                    FixedExtentScrollController(initialItem: initialIndex),
                onSelectedItemChanged: (int index) {
                  tempIndex = index;
                },
                children: sexOptions.map((e) => Text(e)).toList(),
              ),
            ),
           
          ],
        ),
      ),
    ),
  );
}