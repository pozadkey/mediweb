// ignore_for_file: prefer_const_constructors

class FaqModel {
  String title;
  String content;

  FaqModel({
    required this.title,
    required this.content,
  });
}

List<FaqModel> faqList = [
  FaqModel(
      title: 'What is a medical diagnostic tool?',
      content:
          'A medical diagnostic tool is a tool that allows users to enter symptoms, as well as other medical and demographic information, to get a list of possible medical conditions. They can be used as a starting point to get a medical diagnosis from a doctor.'),
  FaqModel(
      title: 'How safe and accurate are online medical diagnostic tools?',
      content:
          'Most doctors agree that online symptom checkers are can encourage people with life-threatening symptoms to seek urgent attention, potentially saving lives. They’re also useful for reassuring patients who may have sought urgent care when they didn’t need to.\nWhile these self diagnosis tools can certainly be useful for determining whether a trip to hospital is necessary, they can’t match the expertise of an experienced health professional.'),
  FaqModel(
      title:
          'Why should I bother with all this research rather than just going to see the doctor?',
      content:
          'We understand that many patients, particularly when feeling worried and unwell, will not want to go through this process. However, today’s doctors are increasingly time- pressured and may not be able to offer you an appointment quickly. During your consultation, they will not always have the time to go through your case in detail or, in some cases, the skills and knowledge to work out your condition, particularly if it’s rare or your presentation is unusual. Doctors are only human and make mistakes like the rest of us, especially if what you’re suffering from is unusual. You can considerably improve the chances of getting a correct diagnosis first time if you are well informed before your visit and can present an accurate report to your doctor of what you are experiencing and ask more relevant questions.'),
  FaqModel(
      title: 'How does putting in my age affect the results?',
      content:
          'The results will reflect the prevalence of the conditions based on the age range you have entered.'),
  FaqModel(
      title: 'Is the first condition in the list the most likely one?',
      content:
          'No. The order of the condition results is sorted by relevance and keyword and does NOT indicate the degree of clinical likelihood. Please review all conditions rather than focusing on just the first condition.'),
  FaqModel(
      title: 'Do I still need to see a doctor after using a symptom checker?',
      content:
          'A symptom checker is not a substitute for seeing a doctor. It is a tool to help gather information and determine what type of doctor to see in order to have a more productive visit with the goal of getting the correct diagnosis sooner. Whether that\'s intense cramps from a menstrual period or a case of COVID-19, our symptom checking tool can help.\nStudies reported that for people living with a rare disease, it takes an average of nearly 5 years between onset of symptoms and correct diagnosis. In that time, they see an average of over 7 physicians each. And over half of patients agreed with the statement, "Because of a slow diagnosis, treatment was delayed and the impact on my condition has been negative.\' Mediweb aims to speed up the process of finding the correct diagnosis with the help of your physician.')
];
