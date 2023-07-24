
///User
class User {
  late int id;
  TblUserMain? tblUserMain;
  List<TblPermPermissionMain>? tblPermPermissionMains;
  List<TblPermRolePermMap>? tblPermRolePermMaps;
  List<TblPermUserRole>? tblPermUserRoles;
  List<TblPermUserRoleMap>? tblPermUserRoleMaps;

  User({
    required this.id,
    this.tblUserMain,
    this.tblPermPermissionMains,
    this.tblPermRolePermMaps,
    this.tblPermUserRoles,
    this.tblPermUserRoleMaps,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    tblUserMain = json['tblUserMain'] != null ? TblUserMain.fromJson(json['tblUserMain']) : null;
    if (json['tblPermPermissionMains'] != null) {
      tblPermPermissionMains = <TblPermPermissionMain>[];
      json['tblPermPermissionMains'].forEach((v) {
        tblPermPermissionMains!.add(TblPermPermissionMain.fromJson(v));
      });
    }
    if (json['tblPermRolePermMaps'] != null) {
      tblPermRolePermMaps = <TblPermRolePermMap>[];
      json['tblPermRolePermMaps'].forEach((v) {
        tblPermRolePermMaps!.add(TblPermRolePermMap.fromJson(v));
      });
    }
    if (json['tblPermUserRoles'] != null) {
      tblPermUserRoles = <TblPermUserRole>[];
      json['tblPermUserRoles'].forEach((v) {
        tblPermUserRoles!.add(TblPermUserRole.fromJson(v));
      });
    }
    if (json['tblPermUserRoleMaps'] != null) {
      tblPermUserRoleMaps = <TblPermUserRoleMap>[];
      json['tblPermUserRoleMaps'].forEach((v) {
        tblPermUserRoleMaps!.add(TblPermUserRoleMap.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    if (tblUserMain != null) {
      data['tblUserMain'] = tblUserMain!.toMap();
    }
    if (tblPermPermissionMains != null) {
      data['tblPermPermissionMains'] = tblPermPermissionMains!.map((v) => v.toMap()).toList();
    }
    if (tblPermRolePermMaps != null) {
      data['tblPermRolePermMaps'] = tblPermRolePermMaps!.map((v) => v.toMap()).toList();
    }
    if (tblPermUserRoles != null) {
      data['tblPermUserRoles'] = tblPermUserRoles!.map((v) => v.toMap()).toList();
    }
    if (tblPermUserRoleMaps != null) {
      data['tblPermUserRoleMaps'] = tblPermUserRoleMaps!.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class TblUserMain {
  late int id;
  int? userType;
  String? email;
  String? userPassword;
  String? nationalId;
  int? teacherBranchId;
  int? studentGradeId;
  String? name;
  String? surname;
  String? mobile;
  String? profilePhotoPath;
  String? firebaseUserid;
  int? locationId;
  int? teachEmpType;
  String? teachDutyCert;
  String? refCode;
  int? refUser;
  String? parentName;
  String? parentSurname;
  String? headlineText;
  int? isPublic;
  int? status;
  int? createdBy;
  DateTime? createdOn;
  int? updatedBy;
  DateTime? updatedOn;
  int? approvedBy;
  DateTime? approvedOn;

  TblUserMain({
    required this.id,
    this.userType,
    this.email,
    this.userPassword,
    this.nationalId,
    this.teacherBranchId,
    this.studentGradeId,
    this.name,
    this.surname,
    this.mobile,
    this.profilePhotoPath,
    this.firebaseUserid,
    this.locationId,
    this.teachEmpType,
    this.teachDutyCert,
    this.refCode,
    this.refUser,
    this.parentName,
    this.parentSurname,
    this.headlineText,
    this.isPublic,
    this.status,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
    this.approvedBy,
    this.approvedOn,
  });

  TblUserMain.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userType = json['UserType'];
    email = json['Email'];
    userPassword = json['UserPassword'];
    nationalId = json['NationalId'];
    teacherBranchId = json['TeacherBranchId'];
    studentGradeId = json['StudentGradeId'];
    name = json['Name'];
    surname = json['Surname'];
    mobile = json['Mobile'];
    profilePhotoPath = json['ProfilePhotoPath'];
    firebaseUserid = json['FirebaseUserid'];
    locationId = json['LocationId'];
    teachEmpType = json['TeachEmpType'];
    teachDutyCert = json['TeachDutyCert'];
    refCode = json['RefCode'];
    refUser = json['RefUser'];
    parentName = json['ParentName'];
    parentSurname = json['ParentSurname'];
    headlineText = json['HeadlineText'];
    isPublic = json['IsPublic'];
    status = json['Status'];
    createdBy = json['CreatedBy'];
    createdOn = DateTime.tryParse(json['CreatedOn']);
    updatedBy = json['UpdatedBy'];
    updatedOn = DateTime.tryParse(json['UpdatedOn']);
    approvedBy = json['ApprovedBy'];
    approvedOn = DateTime.tryParse(json['ApprovedOn']);
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserType'] = userType;
    data['Email'] = email;
    data['UserPassword'] = userPassword;
    data['NationalId'] = nationalId;
    data['TeacherBranchId'] = teacherBranchId;
    data['StudentGradeId'] = studentGradeId;
    data['Name'] = name;
    data['Surname'] = surname;
    data['Mobile'] = mobile;
    data['ProfilePhotoPath'] = profilePhotoPath;
    data['FirebaseUserid'] = firebaseUserid;
    data['LocationId'] = locationId;
    data['TeachEmpType'] = teachEmpType;
    data['TeachDutyCert'] = teachDutyCert;
    data['RefCode'] = refCode;
    data['RefUser'] = refUser;
    data['ParentName'] = parentName;
    data['ParentSurname'] = parentSurname;
    data['HeadlineText'] = headlineText;
    data['IsPublic'] = isPublic;
    data['Status'] = status;
    data['CreatedBy'] = createdBy;
    data['CreatedOn'] = createdOn?.toIso8601String();
    data['UpdatedBy'] = updatedBy;
    data['UpdatedOn'] = updatedOn?.toIso8601String();
    data['ApprovedBy'] = approvedBy;
    data['ApprovedOn'] = approvedOn?.toIso8601String();
    return data;
  }
}

class TblPermPermissionMain {
  late int id;
  String? permName;
  String? permDesc;
  int? status;

  TblPermPermissionMain({
    required this.id,
    this.permName,
    this.permDesc,
    this.status,
  });

  TblPermPermissionMain.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    permName = json['PermName'];
    permDesc = json['PermDesc'];
    status = json['Status'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['PermName'] = permName;
    data['PermDesc'] = permDesc;
    data['Status'] = status;
    return data;
  }
}

class TblPermRolePermMap {
  late int id;
  int? roleId;
  int? permId;
  int? status;

  TblPermRolePermMap({
    required this.id,
    this.roleId,
    this.permId,
    this.status,
  });

  TblPermRolePermMap.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    roleId = json['RoleId'];
    permId = json['PermId'];
    status = json['Status'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['RoleId'] = roleId;
    data['PermId'] = permId;
    data['Status'] = status;
    return data;
  }
}

class TblPermUserRole {
  late int id;
  String? roleName;
  int? status;

  TblPermUserRole({
    required this.id,
    this.roleName,
    this.status,
  });

  TblPermUserRole.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    roleName = json['RoleName'];
    status = json['Status'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['RoleName'] = roleName;
    data['Status'] = status;
    return data;
  }
}

class TblPermUserRoleMap {
  late int id;
  int? userId;
  int? roleId;
  int? status;

  TblPermUserRoleMap({
    required this.id,
    this.userId,
    this.roleId,
    this.status,
  });

  TblPermUserRoleMap.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['UserId'];
    roleId = json['RoleId'];
    status = json['Status'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = userId;
    data['RoleId'] = roleId;
    data['Status'] = status;
    return data;
  }
}

///Question
class Question {
  late int id;
  String? connectionId;
  late int userId;
  TblQueQuestionMain? tblQueQuestionMain;
  List<TblQueQuestionOption>? tblQueQuestionOptions;
  TblFavQuestion? tblFavQuestion;
  List<TblFavGroupQuestMap>? tblFavGroupQuestMaps;
  List<TblFavGroupQuest>? tblFavGroupQuests;

  Question({
    required this.id,
    this.connectionId,
    required this.userId,
    this.tblQueQuestionMain,
    this.tblQueQuestionOptions,
    this.tblFavQuestion,
    this.tblFavGroupQuestMaps,
    this.tblFavGroupQuests,
  });

  Question.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    connectionId = json['ConnectionId'];
    userId = json['UserId'];
    tblQueQuestionMain = json['tblQueQuestionMain'] != null ? TblQueQuestionMain.fromJson(json['tblQueQuestionMain']) : null;
    if (json['tblQueQuestionOptions'] != null) {
      tblQueQuestionOptions = <TblQueQuestionOption>[];
      json['tblQueQuestionOptions'].forEach((v) {
        tblQueQuestionOptions!.add(TblQueQuestionOption.fromJson(v));
      });
    }
    tblFavQuestion = json['tblFavQuestion'] != null ? TblFavQuestion.fromJson(json['tblFavQuestion']) : null;
    if (json['tblFavGroupQuestMaps'] != null) {
      tblFavGroupQuestMaps = <TblFavGroupQuestMap>[];
      json['tblFavGroupQuestMaps'].forEach((v) {
        tblFavGroupQuestMaps!.add(TblFavGroupQuestMap.fromJson(v));
      });
    }
    if (json['tblFavGroupQuests'] != null) {
      tblFavGroupQuests = <TblFavGroupQuest>[];
      json['tblFavGroupQuests'].forEach((v) {
        tblFavGroupQuests!.add(TblFavGroupQuest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['ConnectionId'] = connectionId;
    data['UserId'] = userId;
    if (tblQueQuestionMain != null) {
      data['tblQueQuestionMain'] = tblQueQuestionMain!.toMap();
    }
    if (tblQueQuestionOptions != null) {
      data['tblQueQuestionOptions'] = tblQueQuestionOptions!.map((v) => v.toMap()).toList();
    }
    if (tblFavQuestion != null) {
      data['tblFavQuestion'] = tblFavQuestion!.toMap();
    }
    if (tblFavGroupQuestMaps != null) {
      data['tblFavGroupQuestMaps'] = tblFavGroupQuestMaps!.map((v) => v.toMap()).toList();
    }
    if (tblFavGroupQuests != null) {
      data['tblFavGroupQuests'] = tblFavGroupQuests!.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class TblQueQuestionMain {
  late int id;
  int? academicYear;
  int? difficultyLev;
  int? locationId;
  late int userId;
  int? gradeId;
  int? learnId;
  String? questionText;
  String? resolution;
  int? isPublic;
  int? status;
  int? createdBy;
  DateTime? createdOn;
  int? updatedBy;
  DateTime? updatedOn;

  TblQueQuestionMain({
    required this.id,
    this.academicYear,
    this.difficultyLev,
    this.locationId,
    required this.userId,
    this.gradeId,
    this.learnId,
    this.questionText,
    this.resolution,
    this.isPublic,
    this.status,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblQueQuestionMain.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    academicYear = json['AcademicYear'];
    difficultyLev = json['DifficultyLev'];
    locationId = json['LocationId'];
    userId = json['UserId'];
    gradeId = json['GradeId'];
    learnId = json['LearnId'];
    questionText = json['QuestionText'];
    resolution = json['Resolution'];
    isPublic = json['IsPublic'];
    status = json['Status'];
    createdBy = json['CreatedBy'];
    createdOn = DateTime.tryParse(json['CreatedOn']);
    updatedBy = json['UpdatedBy'];
    updatedOn = DateTime.tryParse(json['UpdatedOn']);
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['AcademicYear'] = academicYear;
    data['DifficultyLev'] = difficultyLev;
    data['LocationId'] = locationId;
    data['UserId'] = userId;
    data['GradeId'] = gradeId;
    data['LearnId'] = learnId;
    data['QuestionText'] = questionText;
    data['Resolution'] = resolution;
    data['IsPublic'] = isPublic;
    data['Status'] = status;
    data['CreatedBy'] = createdBy;
    data['CreatedOn'] = createdOn?.toIso8601String();
    data['UpdatedBy'] = updatedBy;
    data['UpdatedOn'] = updatedOn?.toIso8601String();
    return data;
  }
}

class TblQueQuestionOption {
  late int id;
  int? questionId;
  String? optIdentifier;
  String? optText;
  int? isCorrect;
  int? status;

  TblQueQuestionOption({
    required this.id,
    this.questionId,
    this.optIdentifier,
    this.optText,
    this.isCorrect,
    this.status,
  });

  TblQueQuestionOption.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    questionId = json['QuestionId'];
    optIdentifier = json['OptIdentifier'];
    optText = json['OptText'];
    isCorrect = json['IsCorrect'];
    status = json['Status'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['QuestionId'] = questionId;
    data['OptIdentifier'] = optIdentifier;
    data['OptText'] = optText;
    data['IsCorrect'] = isCorrect;
    data['Status'] = status;
    return data;
  }
}

class TblFavQuestion {
  late int id;
  int? userId;
  int? questionId;
  DateTime? createdOn;

  TblFavQuestion({
    required this.id,
    this.userId,
    this.questionId,
    this.createdOn,
  });

  TblFavQuestion.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['UserId'];
    questionId = json['QuestionId'];
    createdOn = DateTime.tryParse(json['CreatedOn']);
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = userId;
    data['QuestionId'] = questionId;
    data['CreatedOn'] = createdOn?.toIso8601String();
    return data;
  }
}

class TblFavGroupQuestMap {
  late int id;
  int? groupId;
  int? favQuestionId;

  TblFavGroupQuestMap({
    required this.id,
    this.groupId,
    this.favQuestionId,
  });

  TblFavGroupQuestMap.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    groupId = json['GroupId'];
    favQuestionId = json['FavQuestionId'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['GroupId'] = groupId;
    data['FavQuestionId'] = favQuestionId;
    return data;
  }
}

class TblFavGroupQuest {
  late int id;
  int? userId;
  String? groupName;

  TblFavGroupQuest({
    required this.id,
    this.userId,
    this.groupName,
  });

  TblFavGroupQuest.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['UserId'];
    groupName = json['GroupName'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = userId;
    data['GroupName'] = groupName;
    return data;
  }
}


///Dummy Models Below
class WeatherForecast {
  final DateTime date;
  final int temperatureC;
  int get temperatureF => 32 + (temperatureC ~/ 0.5556);
  final String? summary;

  WeatherForecast({
    required this.date,
    required this.temperatureC,
    this.summary,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      date: DateTime.parse(json['date']),
      temperatureC: json['temperatureC'],
      summary: json['summary'],
    );
  }

}