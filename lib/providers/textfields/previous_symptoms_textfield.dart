import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final previousSymptomsProvider = StateProvider<String>((ref) => '');

class PreviousSymptomsTextField extends ConsumerWidget {
  final _labelFont = const TextStyle(
      fontSize: 12,
      color: Color.fromARGB(255, 145, 146, 150),
      height: 1.5,
      letterSpacing: 0.6,
      fontWeight: FontWeight.w500);

  const PreviousSymptomsTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 750,
      child: TextFormField(
        onChanged: (String value) => ref
            .watch(previousSymptomsProvider.notifier)
            .update((state) => value),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          isDense: true,
          labelStyle: _labelFont,
          hintText: 'Previous Symptoms (Optional)',
          hintStyle: _labelFont,
          alignLabelWithHint: true,
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
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 211, 47, 47),
            ),
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
      ),
    );
  }
}
