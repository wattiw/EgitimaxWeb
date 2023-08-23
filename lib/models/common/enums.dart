import 'package:flutter/cupertino.dart';

enum Action {
  create,
  createVerified,
  update,
  updateVerified,
  delete,
  deleteVerified,
  remove,
  removeVerified,
}
extension ActionExtension on Action {
  int getValue(BuildContext context) {
    switch (this) {
      case Action.create:
        return 1;
      case Action.createVerified:
        return 2;
      case Action.update:
        return 3;
      case Action.updateVerified:
        return 4;
      case Action.delete:
        return 5;
      case Action.deleteVerified:
        return 6;
      case Action.remove:
        return 7;
      case Action.removeVerified:
        return 8;
      default:
        return 0;
    }
  }
}

enum QuestionTableAction {
  create,
  update,
  delete,
  remove,
  details
}
extension QuestionTableActionExtension on QuestionTableAction {
  String  getValue(BuildContext context) {
    switch (this) {
      case QuestionTableAction.create:
        return 'Create';
      case QuestionTableAction.update:
        return 'Update';
      case QuestionTableAction.delete:
        return 'Delete';
      case QuestionTableAction.remove:
        return 'Remove';
      case QuestionTableAction.details:
        return 'Details';
      default:
        return '';
    }
  }
}

enum QuestionTableType {
  myFavoriteQuestion,
  myQuestion,
  allPublicQuestion,
}
extension QuestionTableTypeExtension on QuestionTableType {
  String getValue(BuildContext context) {
    switch (this) {
      case QuestionTableType.myFavoriteQuestion:
        return 'My Favorite Questions';
      case QuestionTableType.myQuestion:
        return 'My Questions';
      case QuestionTableType.allPublicQuestion:
        return 'Public Eğitimax Question';
      default:
        return '';
    }
  }
}
extension QuestionTableTypeListExtension on QuestionTableType {
  static List<QuestionTypeKeyValuePair> getKeyValuePairs(BuildContext context) {
    return QuestionTableType.values
        .map((type) => QuestionTypeKeyValuePair(type, type.getValue(context)))
        .toList();
  }
}
class QuestionTypeKeyValuePair {
  final QuestionTableType type;
  final String displayValue;

  QuestionTypeKeyValuePair(this.type, this.displayValue);
}