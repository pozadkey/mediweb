import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../models/symptoms_model.dart';

class ApiServices {
  freshData() async {
    return await FirebaseFirestore.instance
        .collection('admin')
        .doc('my-admin')
        .get()
        .then((value) {
      return value.data()!['token'].toString();
    });
  }

  Future<List<SymptomsModel>> getDiagnosis(
    String gender,
    String dob,
    String symptoms,
  ) async {
    String baseURL = 'https://healthservice.priaid.ch';
    String route = '/diagnosis?';
    symptoms;
    gender;
    dob;
    String token = await freshData();
    String format = 'json';
    String language = 'en-gb';

    switch (symptoms) {
      case 'Anxiety':
        {
          symptoms = '238';
        }
        break;
      case "Back pain":
        {
          symptoms = '104';
        }
        break;
      case "Burning eyes":
        {
          symptoms = '75';
        }
        break;
      case "Burning in the throat":
        {
          symptoms = '46';
        }
        break;
      case "Cheek swelling":
        {
          symptoms = '170';
        }
        break;
      case "Chest pain":
        {
          symptoms = '17';
        }
        break;
      case "Chest tightness":
        {
          symptoms = '31';
        }
        break;
      case "Chills":
        {
          symptoms = '175';
        }
        break;
      case "Cold sweats":
        {
          symptoms = '139';
        }
        break;
      case 'Cough':
        {
          symptoms = '15';
        }
        break;
      case 'Drooping eyelid':
        {
          symptoms = '244';
        }
        break;
      case 'Dry eyes':
        {
          symptoms = '273';
        }
        break;
      case 'Dizziness':
        {
          symptoms = '207';
        }
        break;
      case "Earache":
        {
          symptoms = '87';
        }
        break;
      case "Early satiety":
        {
          symptoms = '92';
        }
        break;

      case "Eye pain":
        {
          symptoms = '287';
        }
        break;
      case "Eye redness":
        {
          symptoms = '33';
        }
        break;
      case "Fast, deepened breathing":
        {
          symptoms = '153';
        }
        break;
      case "Feeling of foreign body in the eye":
        {
          symptoms = '76';
        }
        break;
      case "Fever":
        {
          symptoms = '11';
        }
        break;
      case "Going black before the eyes":
        {
          symptoms = '57';
        }
        break;
      case "Headache":
        {
          symptoms = '9';
        }
        break;
      case "Heartburn":
        {
          symptoms = '45';
        }
        break;
      case "Hiccups":
        {
          symptoms = '122';
        }
    }

    String endpoint = '$baseURL${route}symptoms=${[
      symptoms
    ]}&gender=$gender&year_of_birth=$dob&token=$token&format=$format&language=$language';

    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final json = response.body;
      List myList = jsonDecode(json);
      return myList.map((e) => SymptomsModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final diagonsisProvider = Provider<ApiServices>((ref) => ApiServices());
