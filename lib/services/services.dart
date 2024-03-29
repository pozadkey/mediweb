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
<<<<<<< HEAD
    String token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6InBvemFydG5nQGdtYWlsLmNvbSIsInJvbGUiOiJVc2VyIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvc2lkIjoiOTEwNyIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvdmVyc2lvbiI6IjEwOSIsImh0dHA6Ly9leGFtcGxlLm9yZy9jbGFpbXMvbGltaXQiOiIxMDAiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL21lbWJlcnNoaXAiOiJCYXNpYyIsImh0dHA6Ly9leGFtcGxlLm9yZy9jbGFpbXMvbGFuZ3VhZ2UiOiJlbi1nYiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZXhwaXJhdGlvbiI6IjIwOTktMTItMzEiLCJodHRwOi8vZXhhbXBsZS5vcmcvY2xhaW1zL21lbWJlcnNoaXBzdGFydCI6IjIwMjMtMDItMDUiLCJpc3MiOiJodHRwczovL2F1dGhzZXJ2aWNlLnByaWFpZC5jaCIsImF1ZCI6Imh0dHBzOi8vaGVhbHRoc2VydmljZS5wcmlhaWQuY2giLCJleHAiOjE2NzYzNzI5MDIsIm5iZiI6MTY3NjM2NTcwMn0.D2NDbtYO5EEV20yIr-X469kiWC4ob38dzBEyiHhD0CE';
=======
    String token = await freshData();
>>>>>>> a794e00108db83741887ce7968d2028e53992d53
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
