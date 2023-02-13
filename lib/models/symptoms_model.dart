// To parse this JSON data, do
//
//     final symptomsModel = symptomsModelFromJson(jsonString);

import 'dart:convert';

List<SymptomsModel> symptomsModelFromJson(String str) =>
    List<SymptomsModel>.from(
        json.decode(str).map((x) => SymptomsModel.fromJson(x)));

String symptomsModelToJson(List<SymptomsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SymptomsModel {
  SymptomsModel({
    required this.issue,
  });

  Issue issue;

  factory SymptomsModel.fromJson(Map<String, dynamic> json) => SymptomsModel(
        issue: Issue.fromJson(json["Issue"]),
      );

  Map<String, dynamic> toJson() => {
        "Issue": issue.toJson(),
      };
}

class Issue {
  Issue({
    required this.name,
    required this.accuracy,
    required this.icd,
    required this.icdName,
    required this.profName,
  });

  String name;
  double accuracy;
  String icd;
  String icdName;
  String profName;

  factory Issue.fromJson(Map<String, dynamic> json) => Issue(
        name: json["Name"] ?? 'Check',
        accuracy: json["Accuracy"] ?? 20,
        icd: json["Icd"] ?? 'Check',
        icdName: json["IcdName"] ?? 'Check',
        profName: json["ProfName"] ?? 'Check',
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Accuracy": accuracy,
        "Icd": icd,
        "IcdName": icdName,
        "ProfName": profName,
      };
}
