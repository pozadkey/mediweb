import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = StateProvider<String>((ref) => '');

class NameTextField extends ConsumerWidget {
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

<<<<<<< HEAD:lib/providers/textfields/name-textfield.dart
=======
  const NameTextField({super.key});

>>>>>>> a794e00108db83741887ce7968d2028e53992d53:lib/providers/textfields/name_textfield.dart
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 750,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter your name';
          } else {
            return null;
          }
        },
        onChanged: (String value) =>
            ref.watch(nameProvider.notifier).update((state) => value),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          isDense: true,
          labelStyle: _labelFont,
          hintText: 'Patient\'s Name',
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
    /*return TextFormField(
      
      decoration: InputDecoration(
        hintText: 'Full name',
        border: const OutlineInputBorder(),
      ),
    );*/
  }
}
