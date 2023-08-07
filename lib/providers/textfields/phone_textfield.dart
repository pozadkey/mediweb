import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final phoneProvider = StateProvider<String>((ref) => '');

class PhoneTextField extends ConsumerWidget {
  final _labelFont = const TextStyle(
      fontSize: 12,
      color: Color.fromARGB(255, 145, 146, 150),
      height: 1.5,
      letterSpacing: 0.6,
      fontWeight: FontWeight.w500);

  final _errorText = const TextStyle(
      fontSize: 12,
      color: Color.fromARGB(255, 240, 93, 93),
      height: 1.5,
      letterSpacing: 0.6,
      fontWeight: FontWeight.w500);

  const PhoneTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 750,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter your phone number';
          } else {
            return null;
          }
        },
        onChanged: (String value) =>
            ref.watch(phoneProvider.notifier).update((state) => value),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          isDense: true,
          labelStyle: _labelFont,
          hintText: 'Phone number',
          hintStyle: _labelFont,
          alignLabelWithHint: true,
          errorStyle: _errorText,
          fillColor: const Color.fromARGB(255, 237, 236, 236),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(240, 52, 3, 199),
            ),
            borderRadius: BorderRadius.circular(2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 240, 93, 93),
            ),
            borderRadius: BorderRadius.circular(2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 240, 93, 93),
            ),
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
      ),
    );
  }
}
