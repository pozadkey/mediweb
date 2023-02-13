import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final genderProvider = StateProvider<String>((ref) => 'Select Gender');

// Initial Selected Value
String dropdownvalue = 'male';

// List of items in our dropdown menu
var items = [
  'Select Gender',
  'Male',
  'Female',
];

const _labelFont = TextStyle(
    fontSize: 12,
    color: Colors.black,
    height: 1.5,
    letterSpacing: 0.6,
    fontWeight: FontWeight.w500);

class GenderMenu extends ConsumerWidget {
  const GenderMenu({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          
          borderSide: BorderSide(color: Colors.transparent, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          
          borderSide: BorderSide(color: Colors.transparent, width: 2),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 200, 200, 200),
      ),
      dropdownColor: const Color.fromARGB(255, 200, 200, 200),
      // Initial Value
      value: ref.watch(genderProvider),

      // Down Arrow Icon
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: Colors.black,
      ),

      // Array list of items
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(
            items,
            style: _labelFont,
          ),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        ref
            .watch(genderProvider.notifier)
            .update((state) => dropdownvalue = newValue!);
      },
    );
  }
}
