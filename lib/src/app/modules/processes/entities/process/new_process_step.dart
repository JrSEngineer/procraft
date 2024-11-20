class NewProcessStep {
  String title;
  String description;
  DateTime startForecast;
  DateTime finishForecast;

  NewProcessStep({
    required this.title,
    required this.description,
    required this.startForecast,
    required this.finishForecast,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'startForecast': startForecast.millisecondsSinceEpoch,
      'finishForecast': finishForecast.millisecondsSinceEpoch,
    };
  }

  factory NewProcessStep.fromMap(Map<String, dynamic> map) {
    return NewProcessStep(
      title: map['title'] as String,
      description: map['description'] as String,
      startForecast: DateTime.fromMillisecondsSinceEpoch(map['startForecast'] as int),
      finishForecast: DateTime.fromMillisecondsSinceEpoch(map['finishForecast'] as int),
    );
  }
}
