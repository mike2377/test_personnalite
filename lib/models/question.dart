class Question {
  final String text;
  final List<String> options;
  late int selectOption;

  Question(
    {
      required this.text,
      required this.options,
      this.selectOption = -1,
    }
  );

  
}
