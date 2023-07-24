
///User
class User {
  late BigInt id;
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
    id = BigInt.parse((json['id']??'0').toString());
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
  late BigInt id;
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
  BigInt? refUser;
  String? parentName;
  String? parentSurname;
  String? headlineText;
  int? isPublic;
  int? status;
  BigInt? createdBy;
  DateTime? createdOn;
  BigInt? updatedBy;
  DateTime? updatedOn;
  BigInt? approvedBy;
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
    id = BigInt.parse((json['id']??'0').toString());
    userType = json['userType'];
    email = json['email'];
    userPassword = json['userPassword'];
    nationalId = json['nationalId'];
    teacherBranchId = json['teacherBranchId'];
    studentGradeId = json['studentGradeId'];
    name = json['name'];
    surname = json['surname'];
    mobile = json['mobile'];
    profilePhotoPath = json['profilePhotoPath'];
    firebaseUserid = json['firebaseUserid'];
    locationId = json['locationId'];
    teachEmpType = json['teachEmpType'];
    teachDutyCert = json['teachDutyCert'];
    refCode = json['refCode'];
    refUser = BigInt.parse((json['refUser']??'0').toString());
    parentName = json['parentName'];
    parentSurname = json['parentSurname'];
    headlineText = json['headlineText'];
    isPublic = json['isPublic'];
    status = json['status'];
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn']!=null ? DateTime.tryParse(json['createdOn']) :null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn']!=null ? DateTime.tryParse(json['updatedOn']) :null;
    approvedBy = BigInt.parse((json['approvedBy']??'0').toString());
    approvedOn =json['approvedOn']!=null ? DateTime.tryParse(json['approvedOn']) :null;
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
    id = json['id'];
    permName = json['permName'];
    permDesc = json['permDesc'];
    status = json['status'];
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
    id = json['id'];
    roleId = json['roleId'];
    permId = json['permId'];
    status = json['status'];
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
    id = json['id'];
    roleName = json['roleName'];
    status = json['status'];
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
  BigInt? userId;
  int? roleId;
  int? status;

  TblPermUserRoleMap({
    required this.id,
    this.userId,
    this.roleId,
    this.status,
  });

  TblPermUserRoleMap.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = BigInt.parse((json['userId']??'0').toString());
    roleId = json['roleId'];
    status = json['status'];
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
  late BigInt id;
  String? connectionId;
  late BigInt userId;
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
    id = BigInt.parse((json['id']??'0').toString());
    connectionId = json['connectionId'];
    userId = json['userId'];
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
  late BigInt id;
  int? academicYear;
  int? difficultyLev;
  int? locationId;
  late BigInt userId;
  int? gradeId;
  int? learnId;
  String? questionText;
  String? resolution;
  int? isPublic;
  int? status;
  BigInt? createdBy;
  DateTime? createdOn;
  BigInt? updatedBy;
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
    id = json['id'];
    academicYear = json['academicYear'];
    difficultyLev = json['difficultyLev'];
    locationId = json['locationId'];
    userId = json['userId'];
    gradeId = json['gradeId'];
    learnId = json['learnId'];
    questionText = json['questionText'];
    resolution = json['resolution'];
    isPublic = json['isPublic'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn']!=null ? DateTime.tryParse(json['createdOn']) :null;
    updatedBy = json['updatedBy'];
    updatedOn = json['updatedOn']!=null ? DateTime.tryParse(json['updatedOn']) :null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AcademicYear'] = academicYear;
    data['DifficultyLev'] = difficultyLev;
    data['LocationId'] = locationId;
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['GradeId'] = gradeId;
    data['LearnId'] = learnId;
    data['QuestionText'] = questionText;
    data['Resolution'] = resolution;
    data['IsPublic'] = isPublic;
    data['Status'] = status;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn?.toIso8601String();
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn?.toIso8601String();
    return data;
  }
}

class TblQueQuestionOption {
  late int id;
  BigInt? questionId;
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
    id = json['id'];
    questionId = BigInt.parse((json['questionId']??'0').toString());
    optIdentifier = json['optIdentifier'];
    optText = json['optText'];
    isCorrect = json['isCorrect'];
    status = json['status'];
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
  late BigInt id;
  BigInt? userId;
  BigInt? questionId;
  DateTime? createdOn;

  TblFavQuestion({
    required this.id,
    this.userId,
    this.questionId,
    this.createdOn,
  });

  TblFavQuestion.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    questionId = BigInt.parse((json['questionId']??'0').toString());
    createdOn = json['createdOn']!=null ? DateTime.tryParse(json['createdOn']) :null;
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
  late BigInt id;
  BigInt? groupId;
  BigInt? favQuestionId;

  TblFavGroupQuestMap({
    required this.id,
    this.groupId,
    this.favQuestionId,
  });

  TblFavGroupQuestMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    groupId = BigInt.parse((json['groupId']??'0').toString());
    favQuestionId = BigInt.parse((json['favQuestionId']??'0').toString());
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
  late BigInt id;
  BigInt? userId;
  String? groupName;

  TblFavGroupQuest({
    required this.id,
    this.userId,
    this.groupName,
  });

  TblFavGroupQuest.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    groupName = json['groupName'];
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