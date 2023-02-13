import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mediweb/providers/dropdown/gender_provider.dart';
import 'package:mediweb/services/services.dart';

import '../models/symptoms_model.dart';
import 'dropdown/symptoms_provider.dart';
import 'textfields/age-textfield.dart';

final diagonsisDataProvider = FutureProvider<List<SymptomsModel>>((ref) async {
  return ref.watch(diagonsisProvider).getDiagnosis(
        ref.watch(genderProvider),
        ref.watch(ageProvider),
        ref.watch(symptomNameProvider),
      );
});
