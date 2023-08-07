// ignore_for_file: prefer_const_constructors

class AboutModel {
  String content;

  AboutModel({
    required this.content,
  });
}

List<AboutModel> aboutList = [
  AboutModel(
      content:
          'Mediweb is a web-based medical diagnostic system that offers a medical symptom checker primarily for patients. Based on the entered symptoms it tells the patient what possible diseases he has. It directs him to more medical information and shows the right doctor for further clarifications. The symptom checker is integrated via the flexible API (Application Programming Interface) from ApiMedic. This is a modular programming interface, which offers the symptom checker functionalities for a main program.\nMediweb allows you to choose a variety of factors related to your symptom, in order to help you narrow the potential medical conditions related to your symptom. This tool does not incorporate all the personal, health and demographic factors related to you, individually, that would allow a definitive cause or causes to be suggested. The most reliable way to determine the cause of your symptom, and what to do, is to visit your health-care provider.')
];
