class Question {
  String question = '';
  bool answer = false;

  Question({required String q, required bool a}) {
    question = q;
    answer = a;
  }
}

List<Question> questionBank = [
  Question(q: 'You can lead a cow down stairs but not upstairs.', a: false),
  Question(
    q: 'Approximately one quarter of human bones are in the feet.',
    a: true,
  ),
  Question(q: 'A slug\'s blood is green.', a: true),
];
