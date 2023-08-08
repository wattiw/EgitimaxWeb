class ReceivedQuestionStatus {
  final String topic;
  final QuestionStatusMessage message;

  ReceivedQuestionStatus({required this.topic, required this.message});

  factory ReceivedQuestionStatus.fromJson(Map<String, dynamic> json) {
    return ReceivedQuestionStatus(
      topic: json['topic'],
      message: QuestionStatusMessage.fromJson(json['message']),
    );
  }
}

class QuestionStatusMessage {
  final String qToken;
  final int qId;
  final int userId;
  final bool isCompleted;

  QuestionStatusMessage({
    required this.qToken,
    required this.qId,
    required this.userId,
    required this.isCompleted,
  });

  factory QuestionStatusMessage.fromJson(Map<String, dynamic> json) {
    return QuestionStatusMessage(
      qToken: json['qToken'],
      qId: json['qId'],
      userId: json['userId'],
      isCompleted: json['isCompleted'],
    );
  }
}
