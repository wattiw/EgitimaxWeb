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
  int get getValue {
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
  String get getValue {
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
