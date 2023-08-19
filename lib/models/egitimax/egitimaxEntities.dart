class TblAnnounceDoc {
  BigInt id =BigInt.parse('0');
  BigInt? announceId ;
  String? description ;
  String? docPath ;

  TblAnnounceDoc({
    required  this.id,
    this.announceId,
    this.description,
    this.docPath,
  });

  TblAnnounceDoc.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    announceId = json['announceId'] != null ? BigInt.parse((json['announceId']).toString()) : null;
    description = json['description'] as String?;
    docPath = json['docPath'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AnnounceId'] = announceId != null ? BigInt.parse((announceId).toString()) : null;
    data['Description'] = description;
    data['DocPath'] = docPath;
    return data;
  }
}

class TblAnnounceMain {
  BigInt id =BigInt.parse('0');
  String? title ;
  String? description ;
  DateTime? startDate ;
  DateTime? endDate ;
  String? imagePath ;
  int? status ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblAnnounceMain({
    required  this.id,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.imagePath,
    this.status,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblAnnounceMain.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    title = json['title'] as String?;
    description = json['description'] as String?;
    startDate = json['startDate'] != null ? DateTime.tryParse(json['startDate']) : null;
    endDate = json['endDate'] != null ? DateTime.tryParse(json['endDate']) : null;
    imagePath = json['imagePath'] as String?;
    status = json['status'] as int?;
    createdBy = json['createdBy'] != null ? BigInt.parse((json['createdBy']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = json['updatedBy'] != null ? BigInt.parse((json['updatedBy']).toString()) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['Title'] = title;
    data['Description'] = description;
    data['StartDate'] = startDate != null ? startDate!.toIso8601String() : null;
    data['EndDate'] = endDate != null ? endDate!.toIso8601String() : null;
    data['ImagePath'] = imagePath;
    data['Status'] = status;
    data['CreatedBy'] = createdBy != null ? BigInt.parse((createdBy).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = updatedBy != null ? BigInt.parse((updatedBy).toString()) : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblAnnounceSectionMap {
  BigInt id =BigInt.parse('0');
  BigInt? announceId ;
  int? sectionId ;

  TblAnnounceSectionMap({
    required  this.id,
    this.announceId,
    this.sectionId,
  });

  TblAnnounceSectionMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    announceId = json['announceId'] != null ? BigInt.parse((json['announceId']).toString()) : null;
    sectionId = json['sectionId'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AnnounceId'] = announceId != null ? BigInt.parse((announceId).toString()) : null;
    data['SectionId'] = sectionId;
    return data;
  }
}

class TblAssignmentDoc {
  BigInt id =BigInt.parse('0');
  BigInt? assignId ;
  String? docPath ;

  TblAssignmentDoc({
    required  this.id,
    this.assignId,
    this.docPath,
  });

  TblAssignmentDoc.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    assignId = json['assignId'] != null ? BigInt.parse((json['assignId']).toString()) : null;
    docPath = json['docPath'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AssignId'] = assignId != null ? BigInt.parse((assignId).toString()) : null;
    data['DocPath'] = docPath;
    return data;
  }
}

class TblAssignmentMain {
  BigInt id =BigInt.parse('0');
  int? academicYear ;
  int? assignType ;
  BigInt? userId ;
  String? title ;
  String? assignNote ;
  BigInt? questionId ;
  BigInt? quizId ;
  BigInt? lectureId ;
  DateTime? lastRespDate ;
  int? status ;
  DateTime? createdOn ;
  DateTime? updatedOn ;

  TblAssignmentMain({
    required  this.id,
    this.academicYear,
    this.assignType,
    this.userId,
    this.title,
    this.assignNote,
    this.questionId,
    this.quizId,
    this.lectureId,
    this.lastRespDate,
    this.status,
    this.createdOn,
    this.updatedOn,
  });

  TblAssignmentMain.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    academicYear = json['academicYear'] as int?;
    assignType = json['assignType'] as int?;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    title = json['title'] as String?;
    assignNote = json['assignNote'] as String?;
    questionId = json['questionId'] != null ? BigInt.parse((json['questionId']).toString()) : null;
    quizId = json['quizId'] != null ? BigInt.parse((json['quizId']).toString()) : null;
    lectureId = json['lectureId'] != null ? BigInt.parse((json['lectureId']).toString()) : null;
    lastRespDate = json['lastRespDate'] != null ? DateTime.tryParse(json['lastRespDate']) : null;
    status = json['status'] as int?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AcademicYear'] = academicYear;
    data['AssignType'] = assignType;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['Title'] = title;
    data['AssignNote'] = assignNote;
    data['QuestionId'] = questionId != null ? BigInt.parse((questionId).toString()) : null;
    data['QuizId'] = quizId != null ? BigInt.parse((quizId).toString()) : null;
    data['LectureId'] = lectureId != null ? BigInt.parse((lectureId).toString()) : null;
    data['LastRespDate'] = lastRespDate != null ? lastRespDate!.toIso8601String() : null;
    data['Status'] = status;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblAssignmentSectionMap {
  BigInt id =BigInt.parse('0');
  BigInt? assignId ;
  int? sectionId ;

  TblAssignmentSectionMap({
    required  this.id,
    this.assignId,
    this.sectionId,
  });

  TblAssignmentSectionMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    assignId = json['assignId'] != null ? BigInt.parse((json['assignId']).toString()) : null;
    sectionId = json['sectionId'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AssignId'] = assignId != null ? BigInt.parse((assignId).toString()) : null;
    data['SectionId'] = sectionId;
    return data;
  }
}

class TblAssignmentStuMap {
  BigInt id =BigInt.parse('0');
  BigInt? assignId ;
  BigInt? userId ;

  TblAssignmentStuMap({
    required  this.id,
    this.assignId,
    this.userId,
  });

  TblAssignmentStuMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    assignId = json['assignId'] != null ? BigInt.parse((json['assignId']).toString()) : null;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AssignId'] = assignId != null ? BigInt.parse((assignId).toString()) : null;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    return data;
  }
}

class TblAssignmentType {
  int id =0;
  String? assignType ;

  TblAssignmentType({
    required  this.id,
    this.assignType,
  });

  TblAssignmentType.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    assignType = json['assignType'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['AssignType'] = assignType;
    return data;
  }
}

class TblCrsCourseLike {
  BigInt id =BigInt.parse('0');
  BigInt? courseId ;
  BigInt? userId ;
  int? likeType ;
  DateTime? createdOn ;
  int? status ;

  TblCrsCourseLike({
    required  this.id,
    this.courseId,
    this.userId,
    this.likeType,
    this.createdOn,
    this.status,
  });

  TblCrsCourseLike.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    courseId = json['courseId'] != null ? BigInt.parse((json['courseId']).toString()) : null;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    likeType = json['likeType'] as int?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['CourseId'] = courseId != null ? BigInt.parse((courseId).toString()) : null;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['LikeType'] = likeType;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['Status'] = status;
    return data;
  }
}

class TblCrsCourseMain {
  BigInt id =BigInt.parse('0');
  int? locationId ;
  int? academicYear ;
  BigInt? userId ;
  int? branchId ;
  int? gradeId ;
  BigInt? sectionId ;
  String? title ;
  String? description ;
  int? isPublic ;
  int? status ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblCrsCourseMain({
    required  this.id,
    this.locationId,
    this.academicYear,
    this.userId,
    this.branchId,
    this.gradeId,
    this.sectionId,
    this.title,
    this.description,
    this.isPublic,
    this.status,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblCrsCourseMain.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    locationId = json['locationId'] as int?;
    academicYear = json['academicYear'] as int?;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    branchId = json['branchId'] as int?;
    gradeId = json['gradeId'] as int?;
    sectionId = json['sectionId'] != null ? BigInt.parse((json['sectionId']).toString()) : null;
    title = json['title'] as String?;
    description = json['description'] as String?;
    isPublic = json['isPublic'] as int?;
    status = json['status'] as int?;
    createdBy = json['createdBy'] != null ? BigInt.parse((json['createdBy']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = json['updatedBy'] != null ? BigInt.parse((json['updatedBy']).toString()) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['LocationId'] = locationId;
    data['AcademicYear'] = academicYear;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['BranchId'] = branchId;
    data['GradeId'] = gradeId;
    data['SectionId'] = sectionId != null ? BigInt.parse((sectionId).toString()) : null;
    data['Title'] = title;
    data['Description'] = description;
    data['IsPublic'] = isPublic;
    data['Status'] = status;
    data['CreatedBy'] = createdBy != null ? BigInt.parse((createdBy).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = updatedBy != null ? BigInt.parse((updatedBy).toString()) : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblCrsCourseUserMap {
  BigInt id =BigInt.parse('0');
  int? academicYear ;
  BigInt? courseId ;
  int? userType ;
  BigInt? userId ;
  int? isAdmin ;
  int? status ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblCrsCourseUserMap({
    required  this.id,
    this.academicYear,
    this.courseId,
    this.userType,
    this.userId,
    this.isAdmin,
    this.status,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblCrsCourseUserMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    academicYear = json['academicYear'] as int?;
    courseId = json['courseId'] != null ? BigInt.parse((json['courseId']).toString()) : null;
    userType = json['userType'] as int?;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    isAdmin = json['isAdmin'] as int?;
    status = json['status'] as int?;
    createdBy = json['createdBy'] != null ? BigInt.parse((json['createdBy']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = json['updatedBy'] != null ? BigInt.parse((json['updatedBy']).toString()) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AcademicYear'] = academicYear;
    data['CourseId'] = courseId != null ? BigInt.parse((courseId).toString()) : null;
    data['UserType'] = userType;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['IsAdmin'] = isAdmin;
    data['Status'] = status;
    data['CreatedBy'] = createdBy != null ? BigInt.parse((createdBy).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = updatedBy != null ? BigInt.parse((updatedBy).toString()) : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblCrsModuleLectureMap {
  BigInt id =BigInt.parse('0');
  BigInt? moduleId ;
  BigInt? lectureId ;
  int? orderNo ;
  int? status ;

  TblCrsModuleLectureMap({
    required  this.id,
    this.moduleId,
    this.lectureId,
    this.orderNo,
    this.status,
  });

  TblCrsModuleLectureMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    moduleId = json['moduleId'] != null ? BigInt.parse((json['moduleId']).toString()) : null;
    lectureId = json['lectureId'] != null ? BigInt.parse((json['lectureId']).toString()) : null;
    orderNo = json['orderNo'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['ModuleId'] = moduleId != null ? BigInt.parse((moduleId).toString()) : null;
    data['LectureId'] = lectureId != null ? BigInt.parse((lectureId).toString()) : null;
    data['OrderNo'] = orderNo;
    data['Status'] = status;
    return data;
  }
}

class TblCrsModuleMain {
  BigInt id =BigInt.parse('0');
  BigInt? courseId ;
  int? moduleType ;
  String? moduleName ;
  int? orderNo ;
  DateTime? startDate ;
  DateTime? endDate ;
  int? status ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblCrsModuleMain({
    required  this.id,
    this.courseId,
    this.moduleType,
    this.moduleName,
    this.orderNo,
    this.startDate,
    this.endDate,
    this.status,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblCrsModuleMain.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    courseId = json['courseId'] != null ? BigInt.parse((json['courseId']).toString()) : null;
    moduleType = json['moduleType'] as int?;
    moduleName = json['moduleName'] as String?;
    orderNo = json['orderNo'] as int?;
    startDate = json['startDate'] != null ? DateTime.tryParse(json['startDate']) : null;
    endDate = json['endDate'] != null ? DateTime.tryParse(json['endDate']) : null;
    status = json['status'] as int?;
    createdBy = json['createdBy'] != null ? BigInt.parse((json['createdBy']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = json['updatedBy'] != null ? BigInt.parse((json['updatedBy']).toString()) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['CourseId'] = courseId != null ? BigInt.parse((courseId).toString()) : null;
    data['ModuleType'] = moduleType;
    data['ModuleName'] = moduleName;
    data['OrderNo'] = orderNo;
    data['StartDate'] = startDate != null ? startDate!.toIso8601String() : null;
    data['EndDate'] = endDate != null ? endDate!.toIso8601String() : null;
    data['Status'] = status;
    data['CreatedBy'] = createdBy != null ? BigInt.parse((createdBy).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = updatedBy != null ? BigInt.parse((updatedBy).toString()) : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblCrsModuleType {
  int id =0;
  String? typeName ;
  int? status ;

  TblCrsModuleType({
    required  this.id,
    this.typeName,
    this.status,
  });

  TblCrsModuleType.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    typeName = json['typeName'] as String?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['TypeName'] = typeName;
    data['Status'] = status;
    return data;
  }
}

class TblFavGroupLecture {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  String? groupName ;

  TblFavGroupLecture({
    required  this.id,
    this.userId,
    this.groupName,
  });

  TblFavGroupLecture.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    groupName = json['groupName'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['GroupName'] = groupName;
    return data;
  }
}

class TblFavGroupLectureMap {
  BigInt id =BigInt.parse('0');
  BigInt? groupId ;
  BigInt? favLectureId ;

  TblFavGroupLectureMap({
    required  this.id,
    this.groupId,
    this.favLectureId,
  });

  TblFavGroupLectureMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    groupId = json['groupId'] != null ? BigInt.parse((json['groupId']).toString()) : null;
    favLectureId = json['favLectureId'] != null ? BigInt.parse((json['favLectureId']).toString()) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['GroupId'] = groupId != null ? BigInt.parse((groupId).toString()) : null;
    data['FavLectureId'] = favLectureId != null ? BigInt.parse((favLectureId).toString()) : null;
    return data;
  }
}

class TblFavGroupQuest {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  String? groupName ;

  TblFavGroupQuest({
    required  this.id,
    this.userId,
    this.groupName,
  });

  TblFavGroupQuest.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    groupName = json['groupName'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['GroupName'] = groupName;
    return data;
  }
}

class TblFavGroupQuestMap {
  BigInt id =BigInt.parse('0');
  BigInt? groupId ;
  BigInt? favQuestionId ;

  TblFavGroupQuestMap({
    required  this.id,
    this.groupId,
    this.favQuestionId,
  });

  TblFavGroupQuestMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    groupId = json['groupId'] != null ? BigInt.parse((json['groupId']).toString()) : null;
    favQuestionId = json['favQuestionId'] != null ? BigInt.parse((json['favQuestionId']).toString()) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['GroupId'] = groupId != null ? BigInt.parse((groupId).toString()) : null;
    data['FavQuestionId'] = favQuestionId != null ? BigInt.parse((favQuestionId).toString()) : null;
    return data;
  }
}

class TblFavGroupQuiz {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  String? groupName ;

  TblFavGroupQuiz({
    required  this.id,
    this.userId,
    this.groupName,
  });

  TblFavGroupQuiz.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    groupName = json['groupName'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['GroupName'] = groupName;
    return data;
  }
}

class TblFavGroupQuizMap {
  BigInt id =BigInt.parse('0');
  BigInt? groupId ;
  BigInt? favQuizId ;

  TblFavGroupQuizMap({
    required  this.id,
    this.groupId,
    this.favQuizId,
  });

  TblFavGroupQuizMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    groupId = json['groupId'] != null ? BigInt.parse((json['groupId']).toString()) : null;
    favQuizId = json['favQuizId'] != null ? BigInt.parse((json['favQuizId']).toString()) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['GroupId'] = groupId != null ? BigInt.parse((groupId).toString()) : null;
    data['FavQuizId'] = favQuizId != null ? BigInt.parse((favQuizId).toString()) : null;
    return data;
  }
}

class TblFavGroupVid {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  String? groupName ;

  TblFavGroupVid({
    required  this.id,
    this.userId,
    this.groupName,
  });

  TblFavGroupVid.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    groupName = json['groupName'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['GroupName'] = groupName;
    return data;
  }
}

class TblFavGroupVidMap {
  BigInt id =BigInt.parse('0');
  BigInt? groupId ;
  BigInt? favVideoId ;

  TblFavGroupVidMap({
    required  this.id,
    this.groupId,
    this.favVideoId,
  });

  TblFavGroupVidMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    groupId = json['groupId'] != null ? BigInt.parse((json['groupId']).toString()) : null;
    favVideoId = json['favVideoId'] != null ? BigInt.parse((json['favVideoId']).toString()) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['GroupId'] = groupId != null ? BigInt.parse((groupId).toString()) : null;
    data['FavVideoId'] = favVideoId != null ? BigInt.parse((favVideoId).toString()) : null;
    return data;
  }
}

class TblFavLecture {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  BigInt? lectureId ;
  DateTime? createdOn ;

  TblFavLecture({
    required  this.id,
    this.userId,
    this.lectureId,
    this.createdOn,
  });

  TblFavLecture.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    lectureId = json['lectureId'] != null ? BigInt.parse((json['lectureId']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['LectureId'] = lectureId != null ? BigInt.parse((lectureId).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    return data;
  }
}

class TblFavQuestion {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  BigInt? questionId ;
  DateTime? createdOn ;

  TblFavQuestion({
    required  this.id,
    this.userId,
    this.questionId,
    this.createdOn,
  });

  TblFavQuestion.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    questionId = json['questionId'] != null ? BigInt.parse((json['questionId']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['QuestionId'] = questionId != null ? BigInt.parse((questionId).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    return data;
  }
}

class TblFavQuiz {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  BigInt? quizId ;
  DateTime? createdOn ;

  TblFavQuiz({
    required  this.id,
    this.userId,
    this.quizId,
    this.createdOn,
  });

  TblFavQuiz.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    quizId = json['quizId'] != null ? BigInt.parse((json['quizId']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['QuizId'] = quizId != null ? BigInt.parse((quizId).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    return data;
  }
}

class TblFavVideo {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  BigInt? videoId ;
  DateTime? createdOn ;

  TblFavVideo({
    required  this.id,
    this.userId,
    this.videoId,
    this.createdOn,
  });

  TblFavVideo.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    videoId = json['videoId'] != null ? BigInt.parse((json['videoId']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['VideoId'] = videoId != null ? BigInt.parse((videoId).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    return data;
  }
}

class TblLearnMain {
  int id =0;
  String? type ;
  int? parentId ;
  int? orderNo ;
  int? branchId ;
  int? gradeId ;
  String? itemCode ;
  String? name ;
  String? description ;
  int? locationId ;
  int? status ;

  TblLearnMain({
    required  this.id,
    this.type,
    this.parentId,
    this.orderNo,
    this.branchId,
    this.gradeId,
    this.itemCode,
    this.name,
    this.description,
    this.locationId,
    this.status,
  });

  TblLearnMain.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    type = json['type'] as String?;
    parentId = json['parentId'] as int?;
    orderNo = json['orderNo'] as int?;
    branchId = json['branchId'] as int?;
    gradeId = json['gradeId'] as int?;
    itemCode = json['itemCode'] as String?;
    name = json['name'] as String?;
    description = json['description'] as String?;
    locationId = json['locationId'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Type'] = type;
    data['ParentId'] = parentId;
    data['OrderNo'] = orderNo;
    data['BranchId'] = branchId;
    data['GradeId'] = gradeId;
    data['ItemCode'] = itemCode;
    data['Name'] = name;
    data['Description'] = description;
    data['LocationId'] = locationId;
    data['Status'] = status;
    return data;
  }
}

class TblLecFlowStuTracking {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  BigInt? lecFlowItem ;
  int? flowItemStatus ;
  DateTime? startedOn ;
  DateTime? finishedOn ;

  TblLecFlowStuTracking({
    required  this.id,
    this.userId,
    this.lecFlowItem,
    this.flowItemStatus,
    this.startedOn,
    this.finishedOn,
  });

  TblLecFlowStuTracking.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    lecFlowItem = json['lecFlowItem'] != null ? BigInt.parse((json['lecFlowItem']).toString()) : null;
    flowItemStatus = json['flowItemStatus'] as int?;
    startedOn = json['startedOn'] != null ? DateTime.tryParse(json['startedOn']) : null;
    finishedOn = json['finishedOn'] != null ? DateTime.tryParse(json['finishedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['LecFlowItem'] = lecFlowItem != null ? BigInt.parse((lecFlowItem).toString()) : null;
    data['FlowItemStatus'] = flowItemStatus;
    data['StartedOn'] = startedOn != null ? startedOn!.toIso8601String() : null;
    data['FinishedOn'] = finishedOn != null ? finishedOn!.toIso8601String() : null;
    return data;
  }
}

class TblLecLectureDoc {
  BigInt id =BigInt.parse('0');
  BigInt? lectureId ;
  String? description ;
  String? docPath ;
  int? status ;
  BigInt? createdBy ;
  DateTime? createdOn ;

  TblLecLectureDoc({
    required  this.id,
    this.lectureId,
    this.description,
    this.docPath,
    this.status,
    this.createdBy,
    this.createdOn,
  });

  TblLecLectureDoc.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    lectureId = json['lectureId'] != null ? BigInt.parse((json['lectureId']).toString()) : null;
    description = json['description'] as String?;
    docPath = json['docPath'] as String?;
    status = json['status'] as int?;
    createdBy = json['createdBy'] != null ? BigInt.parse((json['createdBy']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['LectureId'] = lectureId != null ? BigInt.parse((lectureId).toString()) : null;
    data['Description'] = description;
    data['DocPath'] = docPath;
    data['Status'] = status;
    data['CreatedBy'] = createdBy != null ? BigInt.parse((createdBy).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    return data;
  }
}

class TblLecLectureFlow {
  BigInt id =BigInt.parse('0');
  BigInt? lectureId ;
  int? orderNo ;
  BigInt? videoId ;
  BigInt? quizId ;
  BigInt? docId ;
  BigInt? questionId ;
  int? status ;

  TblLecLectureFlow({
    required  this.id,
    this.lectureId,
    this.orderNo,
    this.videoId,
    this.quizId,
    this.docId,
    this.questionId,
    this.status,
  });

  TblLecLectureFlow.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    lectureId = json['lectureId'] != null ? BigInt.parse((json['lectureId']).toString()) : null;
    orderNo = json['orderNo'] as int?;
    videoId = json['videoId'] != null ? BigInt.parse((json['videoId']).toString()) : null;
    quizId = json['quizId'] != null ? BigInt.parse((json['quizId']).toString()) : null;
    docId = json['docId'] != null ? BigInt.parse((json['docId']).toString()) : null;
    questionId = json['questionId'] != null ? BigInt.parse((json['questionId']).toString()) : null;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['LectureId'] = lectureId != null ? BigInt.parse((lectureId).toString()) : null;
    data['OrderNo'] = orderNo;
    data['VideoId'] = videoId != null ? BigInt.parse((videoId).toString()) : null;
    data['QuizId'] = quizId != null ? BigInt.parse((quizId).toString()) : null;
    data['DocId'] = docId != null ? BigInt.parse((docId).toString()) : null;
    data['QuestionId'] = questionId != null ? BigInt.parse((questionId).toString()) : null;
    data['Status'] = status;
    return data;
  }
}

class TblLecLectureLike {
  BigInt id =BigInt.parse('0');
  BigInt? lectureId ;
  BigInt? userId ;
  int? likeType ;
  DateTime? createdOn ;
  int? status ;

  TblLecLectureLike({
    required  this.id,
    this.lectureId,
    this.userId,
    this.likeType,
    this.createdOn,
    this.status,
  });

  TblLecLectureLike.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    lectureId = json['lectureId'] != null ? BigInt.parse((json['lectureId']).toString()) : null;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    likeType = json['likeType'] as int?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['LectureId'] = lectureId != null ? BigInt.parse((lectureId).toString()) : null;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['LikeType'] = likeType;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['Status'] = status;
    return data;
  }
}

class TblLecLectureMain {
  BigInt id =BigInt.parse('0');
  int? locationId ;
  int? academicYear ;
  BigInt? userId ;
  int? branchId ;
  int? learnId ;
  int? gradeId ;
  String? title ;
  String? description ;
  double? achievemeter ;
  int? isPublic ;
  int? status ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblLecLectureMain({
    required  this.id,
    this.locationId,
    this.academicYear,
    this.userId,
    this.branchId,
    this.learnId,
    this.gradeId,
    this.title,
    this.description,
    this.achievemeter,
    this.isPublic,
    this.status,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblLecLectureMain.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    locationId = json['locationId'] as int?;
    academicYear = json['academicYear'] as int?;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    branchId = json['branchId'] as int?;
    learnId = json['learnId'] as int?;
    gradeId = json['gradeId'] as int?;
    title = json['title'] as String?;
    description = json['description'] as String?;
    achievemeter = json['achievemeter'] as double?;
    isPublic = json['isPublic'] as int?;
    status = json['status'] as int?;
    createdBy = json['createdBy'] != null ? BigInt.parse((json['createdBy']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = json['updatedBy'] != null ? BigInt.parse((json['updatedBy']).toString()) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['LocationId'] = locationId;
    data['AcademicYear'] = academicYear;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['BranchId'] = branchId;
    data['LearnId'] = learnId;
    data['GradeId'] = gradeId;
    data['Title'] = title;
    data['Description'] = description;
    data['Achievemeter'] = achievemeter;
    data['IsPublic'] = isPublic;
    data['Status'] = status;
    data['CreatedBy'] = createdBy != null ? BigInt.parse((createdBy).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = updatedBy != null ? BigInt.parse((updatedBy).toString()) : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblLecStudentTracking {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  BigInt? lectureId ;
  int? lectureStatus ;
  DateTime? startedOn ;
  DateTime? finishedOn ;

  TblLecStudentTracking({
    required  this.id,
    this.userId,
    this.lectureId,
    this.lectureStatus,
    this.startedOn,
    this.finishedOn,
  });

  TblLecStudentTracking.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    lectureId = json['lectureId'] != null ? BigInt.parse((json['lectureId']).toString()) : null;
    lectureStatus = json['lectureStatus'] as int?;
    startedOn = json['startedOn'] != null ? DateTime.tryParse(json['startedOn']) : null;
    finishedOn = json['finishedOn'] != null ? DateTime.tryParse(json['finishedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['LectureId'] = lectureId != null ? BigInt.parse((lectureId).toString()) : null;
    data['LectureStatus'] = lectureStatus;
    data['StartedOn'] = startedOn != null ? startedOn!.toIso8601String() : null;
    data['FinishedOn'] = finishedOn != null ? finishedOn!.toIso8601String() : null;
    return data;
  }
}

class TblPermPermissionMain {
  int id =0;
  String? permName ;
  String? permDesc ;
  int? status ;

  TblPermPermissionMain({
    required  this.id,
    this.permName,
    this.permDesc,
    this.status,
  });

  TblPermPermissionMain.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    permName = json['permName'] as String?;
    permDesc = json['permDesc'] as String?;
    status = json['status'] as int?;
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
  int id =0;
  int? roleId ;
  int? permId ;
  int? status ;

  TblPermRolePermMap({
    required  this.id,
    this.roleId,
    this.permId,
    this.status,
  });

  TblPermRolePermMap.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    roleId = json['roleId'] as int?;
    permId = json['permId'] as int?;
    status = json['status'] as int?;
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
  int id =0;
  String? roleName ;
  int? status ;

  TblPermUserRole({
    required  this.id,
    this.roleName,
    this.status,
  });

  TblPermUserRole.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    roleName = json['roleName'] as String?;
    status = json['status'] as int?;
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
  int id =0;
  BigInt? userId ;
  int? roleId ;
  int? status ;

  TblPermUserRoleMap({
    required  this.id,
    this.userId,
    this.roleId,
    this.status,
  });

  TblPermUserRoleMap.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    roleId = json['roleId'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['RoleId'] = roleId;
    data['Status'] = status;
    return data;
  }
}

class TblPostComment {
  BigInt id =BigInt.parse('0');
  BigInt? postId ;
  BigInt? userId ;
  BigInt? parentCommentId ;
  String? commentText ;
  String? mediaPath ;
  DateTime? createdOn ;
  DateTime? updatedOn ;
  int? status ;

  TblPostComment({
    required  this.id,
    this.postId,
    this.userId,
    this.parentCommentId,
    this.commentText,
    this.mediaPath,
    this.createdOn,
    this.updatedOn,
    this.status,
  });

  TblPostComment.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    postId = json['postId'] != null ? BigInt.parse((json['postId']).toString()) : null;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    parentCommentId = json['parentCommentId'] != null ? BigInt.parse((json['parentCommentId']).toString()) : null;
    commentText = json['commentText'] as String?;
    mediaPath = json['mediaPath'] as String?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['PostId'] = postId != null ? BigInt.parse((postId).toString()) : null;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['ParentCommentId'] = parentCommentId != null ? BigInt.parse((parentCommentId).toString()) : null;
    data['CommentText'] = commentText;
    data['MediaPath'] = mediaPath;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    data['Status'] = status;
    return data;
  }
}

class TblPostLike {
  BigInt id =BigInt.parse('0');
  BigInt? postId ;
  BigInt? userId ;
  int? likeType ;
  DateTime? createdOn ;

  TblPostLike({
    required  this.id,
    this.postId,
    this.userId,
    this.likeType,
    this.createdOn,
  });

  TblPostLike.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    postId = json['postId'] != null ? BigInt.parse((json['postId']).toString()) : null;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    likeType = json['likeType'] as int?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['PostId'] = postId != null ? BigInt.parse((postId).toString()) : null;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['LikeType'] = likeType;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    return data;
  }
}

class TblPostMain {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  String? postTitle ;
  String? postContent ;
  String? mediaPath ;
  int? status ;
  DateTime? createdOn ;
  DateTime? updatedOn ;

  TblPostMain({
    required  this.id,
    this.userId,
    this.postTitle,
    this.postContent,
    this.mediaPath,
    this.status,
    this.createdOn,
    this.updatedOn,
  });

  TblPostMain.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    postTitle = json['postTitle'] as String?;
    postContent = json['postContent'] as String?;
    mediaPath = json['mediaPath'] as String?;
    status = json['status'] as int?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['PostTitle'] = postTitle;
    data['PostContent'] = postContent;
    data['MediaPath'] = mediaPath;
    data['Status'] = status;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblQueQuestionAchvMap {
  BigInt id =BigInt.parse('0');
  BigInt? questionId ;
  int? achvId ;
  int? status ;

  TblQueQuestionAchvMap({
    required  this.id,
    this.questionId,
    this.achvId,
    this.status,
  });

  TblQueQuestionAchvMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    questionId = json['questionId'] != null ? BigInt.parse((json['questionId']).toString()) : null;
    achvId = json['achvId'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['QuestionId'] = questionId != null ? BigInt.parse((questionId).toString()) : null;
    data['AchvId'] = achvId;
    data['Status'] = status;
    return data;
  }
}

class TblQueQuestionLike {
  BigInt id =BigInt.parse('0');
  BigInt? questionId ;
  BigInt? userId ;
  int? likeType ;
  DateTime? createdOn ;
  int? status ;

  TblQueQuestionLike({
    required  this.id,
    this.questionId,
    this.userId,
    this.likeType,
    this.createdOn,
    this.status,
  });

  TblQueQuestionLike.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    questionId = json['questionId'] != null ? BigInt.parse((json['questionId']).toString()) : null;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    likeType = json['likeType'] as int?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['QuestionId'] = questionId != null ? BigInt.parse((questionId).toString()) : null;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['LikeType'] = likeType;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['Status'] = status;
    return data;
  }
}

class TblQueQuestionMain {
  BigInt id =BigInt.parse('0');
  int? academicYear ;
  int? difficultyLev ;
  int? locationId ;
  BigInt? userId ;
  int? gradeId ;
  int? learnId ;
  String? relationId ;
  String? questionToken ;
  String? questionText ;
  String? resolution ;
  int? isPublic ;
  int? status ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblQueQuestionMain({
    required  this.id,
    this.academicYear,
    this.difficultyLev,
    this.locationId,
    this.userId,
    this.gradeId,
    this.learnId,
    this.relationId,
    this.questionToken,
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
    id = BigInt.parse((json['id']??'0').toString());
    academicYear = json['academicYear'] as int?;
    difficultyLev = json['difficultyLev'] as int?;
    locationId = json['locationId'] as int?;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    gradeId = json['gradeId'] as int?;
    learnId = json['learnId'] as int?;
    relationId = json['relationId'] as String?;
    questionToken = json['questionToken'] as String?;
    questionText = json['questionText'] as String?;
    resolution = json['resolution'] as String?;
    isPublic = json['isPublic'] as int?;
    status = json['status'] as int?;
    createdBy = json['createdBy'] != null ? BigInt.parse((json['createdBy']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = json['updatedBy'] != null ? BigInt.parse((json['updatedBy']).toString()) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AcademicYear'] = academicYear;
    data['DifficultyLev'] = difficultyLev;
    data['LocationId'] = locationId;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['GradeId'] = gradeId;
    data['LearnId'] = learnId;
    data['RelationId'] = relationId;
    data['QuestionToken'] = questionToken;
    data['QuestionText'] = questionText;
    data['Resolution'] = resolution;
    data['IsPublic'] = isPublic;
    data['Status'] = status;
    data['CreatedBy'] = createdBy != null ? BigInt.parse((createdBy).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = updatedBy != null ? BigInt.parse((updatedBy).toString()) : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblQueQuestionOption {
  BigInt id =BigInt.parse('0');
  BigInt? questionId ;
  String? optIdentifier ;
  String? optText ;
  int? isCorrect ;
  int? status ;

  TblQueQuestionOption({
    required  this.id,
    this.questionId,
    this.optIdentifier,
    this.optText,
    this.isCorrect,
    this.status,
  });

  TblQueQuestionOption.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    questionId = json['questionId'] != null ? BigInt.parse((json['questionId']).toString()) : null;
    optIdentifier = json['optIdentifier'] as String?;
    optText = json['optText'] as String?;
    isCorrect = json['isCorrect'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['QuestionId'] = questionId != null ? BigInt.parse((questionId).toString()) : null;
    data['OptIdentifier'] = optIdentifier;
    data['OptText'] = optText;
    data['IsCorrect'] = isCorrect;
    data['Status'] = status;
    return data;
  }
}

class TblQuizLike {
  BigInt id =BigInt.parse('0');
  BigInt? quizId ;
  BigInt? userId ;
  int? likeType ;
  DateTime? createdOn ;
  int? status ;

  TblQuizLike({
    required  this.id,
    this.quizId,
    this.userId,
    this.likeType,
    this.createdOn,
    this.status,
  });

  TblQuizLike.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    quizId = json['quizId'] != null ? BigInt.parse((json['quizId']).toString()) : null;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    likeType = json['likeType'] as int?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['QuizId'] = quizId != null ? BigInt.parse((quizId).toString()) : null;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['LikeType'] = likeType;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['Status'] = status;
    return data;
  }
}

class TblQuizMain {
  BigInt id =BigInt.parse('0');
  int? locationId ;
  int? academicYear ;
  BigInt? userId ;
  int? gradeId ;
  String? title ;
  String? description ;
  int? duration ;
  String? headerText ;
  String? footerText ;
  int? isPublic ;
  int? status ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblQuizMain({
    required  this.id,
    this.locationId,
    this.academicYear,
    this.userId,
    this.gradeId,
    this.title,
    this.description,
    this.duration,
    this.headerText,
    this.footerText,
    this.isPublic,
    this.status,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblQuizMain.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    locationId = json['locationId'] as int?;
    academicYear = json['academicYear'] as int?;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    gradeId = json['gradeId'] as int?;
    title = json['title'] as String?;
    description = json['description'] as String?;
    duration = json['duration'] as int?;
    headerText = json['headerText'] as String?;
    footerText = json['footerText'] as String?;
    isPublic = json['isPublic'] as int?;
    status = json['status'] as int?;
    createdBy = json['createdBy'] != null ? BigInt.parse((json['createdBy']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = json['updatedBy'] != null ? BigInt.parse((json['updatedBy']).toString()) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['LocationId'] = locationId;
    data['AcademicYear'] = academicYear;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['GradeId'] = gradeId;
    data['Title'] = title;
    data['Description'] = description;
    data['Duration'] = duration;
    data['HeaderText'] = headerText;
    data['FooterText'] = footerText;
    data['IsPublic'] = isPublic;
    data['Status'] = status;
    data['CreatedBy'] = createdBy != null ? BigInt.parse((createdBy).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = updatedBy != null ? BigInt.parse((updatedBy).toString()) : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblQuizSection {
  BigInt id =BigInt.parse('0');
  BigInt? quizId ;
  int? branchId ;
  int? orderNo ;
  String? sectionDesc ;
  int? status ;

  TblQuizSection({
    required  this.id,
    this.quizId,
    this.branchId,
    this.orderNo,
    this.sectionDesc,
    this.status,
  });

  TblQuizSection.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    quizId = json['quizId'] != null ? BigInt.parse((json['quizId']).toString()) : null;
    branchId = json['branchId'] as int?;
    orderNo = json['orderNo'] as int?;
    sectionDesc = json['sectionDesc'] as String?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['QuizId'] = quizId != null ? BigInt.parse((quizId).toString()) : null;
    data['BranchId'] = branchId;
    data['OrderNo'] = orderNo;
    data['SectionDesc'] = sectionDesc;
    data['Status'] = status;
    return data;
  }
}

class TblQuizSectQuestMap {
  BigInt id =BigInt.parse('0');
  BigInt? sectionId ;
  BigInt? questionId ;
  int? orderNo ;
  int? status ;

  TblQuizSectQuestMap({
    required  this.id,
    this.sectionId,
    this.questionId,
    this.orderNo,
    this.status,
  });

  TblQuizSectQuestMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    sectionId = json['sectionId'] != null ? BigInt.parse((json['sectionId']).toString()) : null;
    questionId = json['questionId'] != null ? BigInt.parse((json['questionId']).toString()) : null;
    orderNo = json['orderNo'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['SectionId'] = sectionId != null ? BigInt.parse((sectionId).toString()) : null;
    data['QuestionId'] = questionId != null ? BigInt.parse((questionId).toString()) : null;
    data['OrderNo'] = orderNo;
    data['Status'] = status;
    return data;
  }
}

class TblSchOrgType {
  int id =0;
  String? orgTypeName ;
  int? locationId ;
  int? status ;

  TblSchOrgType({
    required  this.id,
    this.orgTypeName,
    this.locationId,
    this.status,
  });

  TblSchOrgType.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    orgTypeName = json['orgTypeName'] as String?;
    locationId = json['locationId'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['OrgTypeName'] = orgTypeName;
    data['LocationId'] = locationId;
    data['Status'] = status;
    return data;
  }
}

class TblSchSchoolMain {
  int id =0;
  String? name ;
  int? schoolType ;
  int? orgType ;
  String? address ;
  int? locationId ;
  String? telephone ;
  String? fax ;
  String? email ;
  int? status ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblSchSchoolMain({
    required  this.id,
    this.name,
    this.schoolType,
    this.orgType,
    this.address,
    this.locationId,
    this.telephone,
    this.fax,
    this.email,
    this.status,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblSchSchoolMain.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String?;
    schoolType = json['schoolType'] as int?;
    orgType = json['orgType'] as int?;
    address = json['address'] as String?;
    locationId = json['locationId'] as int?;
    telephone = json['telephone'] as String?;
    fax = json['fax'] as String?;
    email = json['email'] as String?;
    status = json['status'] as int?;
    createdBy = json['createdBy'] != null ? BigInt.parse((json['createdBy']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = json['updatedBy'] != null ? BigInt.parse((json['updatedBy']).toString()) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['SchoolType'] = schoolType;
    data['OrgType'] = orgType;
    data['Address'] = address;
    data['LocationId'] = locationId;
    data['Telephone'] = telephone;
    data['Fax'] = fax;
    data['Email'] = email;
    data['Status'] = status;
    data['CreatedBy'] = createdBy != null ? BigInt.parse((createdBy).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = updatedBy != null ? BigInt.parse((updatedBy).toString()) : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblSchSchoolType {
  int id =0;
  String? typeName ;
  int? locationId ;
  int? status ;

  TblSchSchoolType({
    required  this.id,
    this.typeName,
    this.locationId,
    this.status,
  });

  TblSchSchoolType.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    typeName = json['typeName'] as String?;
    locationId = json['locationId'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['TypeName'] = typeName;
    data['LocationId'] = locationId;
    data['Status'] = status;
    return data;
  }
}

class TblSchSectionMain {
  int id =0;
  int? academicYear ;
  int? schoolId ;
  int? gradeId ;
  String? sectionName ;
  String? description ;
  int? isPublic ;
  int? status ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblSchSectionMain({
    required  this.id,
    this.academicYear,
    this.schoolId,
    this.gradeId,
    this.sectionName,
    this.description,
    this.isPublic,
    this.status,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblSchSectionMain.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    academicYear = json['academicYear'] as int?;
    schoolId = json['schoolId'] as int?;
    gradeId = json['gradeId'] as int?;
    sectionName = json['sectionName'] as String?;
    description = json['description'] as String?;
    isPublic = json['isPublic'] as int?;
    status = json['status'] as int?;
    createdBy = json['createdBy'] != null ? BigInt.parse((json['createdBy']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = json['updatedBy'] != null ? BigInt.parse((json['updatedBy']).toString()) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['AcademicYear'] = academicYear;
    data['SchoolId'] = schoolId;
    data['GradeId'] = gradeId;
    data['SectionName'] = sectionName;
    data['Description'] = description;
    data['IsPublic'] = isPublic;
    data['Status'] = status;
    data['CreatedBy'] = createdBy != null ? BigInt.parse((createdBy).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = updatedBy != null ? BigInt.parse((updatedBy).toString()) : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblSchSectionStuMap {
  BigInt id =BigInt.parse('0');
  int? academicYear ;
  int? sectionId ;
  BigInt? userId ;
  int? status ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblSchSectionStuMap({
    required  this.id,
    this.academicYear,
    this.sectionId,
    this.userId,
    this.status,
    this.updatedBy,
    this.updatedOn,
  });

  TblSchSectionStuMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    academicYear = json['academicYear'] as int?;
    sectionId = json['sectionId'] as int?;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    status = json['status'] as int?;
    updatedBy = json['updatedBy'] != null ? BigInt.parse((json['updatedBy']).toString()) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AcademicYear'] = academicYear;
    data['SectionId'] = sectionId;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['Status'] = status;
    data['UpdatedBy'] = updatedBy != null ? BigInt.parse((updatedBy).toString()) : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblSchUserMap {
  BigInt id =BigInt.parse('0');
  int? academicYear ;
  BigInt? schoolId ;
  int? userType ;
  BigInt? userId ;
  int? isAdmin ;
  int? status ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblSchUserMap({
    required  this.id,
    this.academicYear,
    this.schoolId,
    this.userType,
    this.userId,
    this.isAdmin,
    this.status,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblSchUserMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    academicYear = json['academicYear'] as int?;
    schoolId = json['schoolId'] != null ? BigInt.parse((json['schoolId']).toString()) : null;
    userType = json['userType'] as int?;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    isAdmin = json['isAdmin'] as int?;
    status = json['status'] as int?;
    createdBy = json['createdBy'] != null ? BigInt.parse((json['createdBy']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = json['updatedBy'] != null ? BigInt.parse((json['updatedBy']).toString()) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AcademicYear'] = academicYear;
    data['SchoolId'] = schoolId != null ? BigInt.parse((schoolId).toString()) : null;
    data['UserType'] = userType;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['IsAdmin'] = isAdmin;
    data['Status'] = status;
    data['CreatedBy'] = createdBy != null ? BigInt.parse((createdBy).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = updatedBy != null ? BigInt.parse((updatedBy).toString()) : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblStudentAnsweredQuest {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  BigInt? questionId ;
  BigInt? selectedOpt ;
  int? isCorrect ;
  int? lookAgain ;
  DateTime? createdOn ;
  DateTime? updatedOn ;

  TblStudentAnsweredQuest({
    required  this.id,
    this.userId,
    this.questionId,
    this.selectedOpt,
    this.isCorrect,
    this.lookAgain,
    this.createdOn,
    this.updatedOn,
  });

  TblStudentAnsweredQuest.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    questionId = json['questionId'] != null ? BigInt.parse((json['questionId']).toString()) : null;
    selectedOpt = json['selectedOpt'] != null ? BigInt.parse((json['selectedOpt']).toString()) : null;
    isCorrect = json['isCorrect'] as int?;
    lookAgain = json['lookAgain'] as int?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['QuestionId'] = questionId != null ? BigInt.parse((questionId).toString()) : null;
    data['SelectedOpt'] = selectedOpt != null ? BigInt.parse((selectedOpt).toString()) : null;
    data['IsCorrect'] = isCorrect;
    data['LookAgain'] = lookAgain;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblStudentQuestAchGap {
  BigInt id =BigInt.parse('0');
  int? achvId ;
  BigInt? questionId ;
  DateTime? createdOn ;

  TblStudentQuestAchGap({
    required  this.id,
    this.achvId,
    this.questionId,
    this.createdOn,
  });

  TblStudentQuestAchGap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    achvId = json['achvId'] as int?;
    questionId = json['questionId'] != null ? BigInt.parse((json['questionId']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AchvId'] = achvId;
    data['QuestionId'] = questionId != null ? BigInt.parse((questionId).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    return data;
  }
}

class TblStudentTakenQuiz {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  BigInt? quizId ;
  int? quizStatus ;
  int? iterationNo ;
  DateTime? startedOn ;
  DateTime? finishedOn ;

  TblStudentTakenQuiz({
    required  this.id,
    this.userId,
    this.quizId,
    this.quizStatus,
    this.iterationNo,
    this.startedOn,
    this.finishedOn,
  });

  TblStudentTakenQuiz.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    quizId = json['quizId'] != null ? BigInt.parse((json['quizId']).toString()) : null;
    quizStatus = json['quizStatus'] as int?;
    iterationNo = json['iterationNo'] as int?;
    startedOn = json['startedOn'] != null ? DateTime.tryParse(json['startedOn']) : null;
    finishedOn = json['finishedOn'] != null ? DateTime.tryParse(json['finishedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['QuizId'] = quizId != null ? BigInt.parse((quizId).toString()) : null;
    data['QuizStatus'] = quizStatus;
    data['IterationNo'] = iterationNo;
    data['StartedOn'] = startedOn != null ? startedOn!.toIso8601String() : null;
    data['FinishedOn'] = finishedOn != null ? finishedOn!.toIso8601String() : null;
    return data;
  }
}

class TblStudentVideoFillAchGap {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  int? achvId ;
  BigInt? videoId ;
  DateTime? createdOn ;

  TblStudentVideoFillAchGap({
    required  this.id,
    this.userId,
    this.achvId,
    this.videoId,
    this.createdOn,
  });

  TblStudentVideoFillAchGap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    achvId = json['achvId'] as int?;
    videoId = json['videoId'] != null ? BigInt.parse((json['videoId']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['AchvId'] = achvId;
    data['VideoId'] = videoId != null ? BigInt.parse((videoId).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    return data;
  }
}

class TblStudentWatchedVideo {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  BigInt? videoId ;
  DateTime? startedOn ;
  DateTime? finishedOn ;

  TblStudentWatchedVideo({
    required  this.id,
    this.userId,
    this.videoId,
    this.startedOn,
    this.finishedOn,
  });

  TblStudentWatchedVideo.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    videoId = json['videoId'] != null ? BigInt.parse((json['videoId']).toString()) : null;
    startedOn = json['startedOn'] != null ? DateTime.tryParse(json['startedOn']) : null;
    finishedOn = json['finishedOn'] != null ? DateTime.tryParse(json['finishedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['VideoId'] = videoId != null ? BigInt.parse((videoId).toString()) : null;
    data['StartedOn'] = startedOn != null ? startedOn!.toIso8601String() : null;
    data['FinishedOn'] = finishedOn != null ? finishedOn!.toIso8601String() : null;
    return data;
  }
}

class TblUserActivity {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  String? accessUrl ;
  DateTime? accessTimestamp ;

  TblUserActivity({
    required  this.id,
    this.userId,
    this.accessUrl,
    this.accessTimestamp,
  });

  TblUserActivity.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    accessUrl = json['accessUrl'] as String?;
    accessTimestamp = json['accessTimestamp'] != null ? DateTime.tryParse(json['accessTimestamp']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['AccessUrl'] = accessUrl;
    data['AccessTimestamp'] = accessTimestamp != null ? accessTimestamp!.toIso8601String() : null;
    return data;
  }
}

class TblUserContractGdpr {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  String? gdprVer ;
  String? contractVer ;
  DateTime? gdprAppDate ;
  DateTime? contractAppDate ;

  TblUserContractGdpr({
    required  this.id,
    this.userId,
    this.gdprVer,
    this.contractVer,
    this.gdprAppDate,
    this.contractAppDate,
  });

  TblUserContractGdpr.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    gdprVer = json['gdprVer'] as String?;
    contractVer = json['contractVer'] as String?;
    gdprAppDate = json['gdprAppDate'] != null ? DateTime.tryParse(json['gdprAppDate']) : null;
    contractAppDate = json['contractAppDate'] != null ? DateTime.tryParse(json['contractAppDate']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['GdprVer'] = gdprVer;
    data['ContractVer'] = contractVer;
    data['GdprAppDate'] = gdprAppDate != null ? gdprAppDate!.toIso8601String() : null;
    data['ContractAppDate'] = contractAppDate != null ? contractAppDate!.toIso8601String() : null;
    return data;
  }
}

class TblUserFollow {
  int id =0;
  BigInt? follower ;
  BigInt? following ;
  int? followStatus ;
  DateTime? reqestedOn ;
  DateTime? acceptedOn ;

  TblUserFollow({
    required  this.id,
    this.follower,
    this.following,
    this.followStatus,
    this.reqestedOn,
    this.acceptedOn,
  });

  TblUserFollow.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    follower = json['follower'] != null ? BigInt.parse((json['follower']).toString()) : null;
    following = json['following'] != null ? BigInt.parse((json['following']).toString()) : null;
    followStatus = json['followStatus'] as int?;
    reqestedOn = json['reqestedOn'] != null ? DateTime.tryParse(json['reqestedOn']) : null;
    acceptedOn = json['acceptedOn'] != null ? DateTime.tryParse(json['acceptedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Follower'] = follower != null ? BigInt.parse((follower).toString()) : null;
    data['Following'] = following != null ? BigInt.parse((following).toString()) : null;
    data['FollowStatus'] = followStatus;
    data['ReqestedOn'] = reqestedOn != null ? reqestedOn!.toIso8601String() : null;
    data['AcceptedOn'] = acceptedOn != null ? acceptedOn!.toIso8601String() : null;
    return data;
  }
}

class TblUserFollowStatus {
  int id =0;
  String? statusName ;

  TblUserFollowStatus({
    required  this.id,
    this.statusName,
  });

  TblUserFollowStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    statusName = json['statusName'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['StatusName'] = statusName;
    return data;
  }
}

class TblUserMain {
  BigInt id =BigInt.parse('0');
  int? userType ;
  String? email ;
  String? userPassword ;
  String? nationalId ;
  int? teacherBranchId ;
  int? studentGradeId ;
  String? name ;
  String? surname ;
  String? mobile ;
  String? profilePhotoPath ;
  String? firebaseUserid ;
  int? locationId ;
  int? teachEmpType ;
  String? teachDutyCert ;
  String? refCode ;
  BigInt? refUser ;
  String? parentName ;
  String? parentSurname ;
  String? headlineText ;
  int? isPublic ;
  int? status ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;
  BigInt? approvedBy ;
  DateTime? approvedOn ;

  TblUserMain({
    required  this.id,
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
    userType = json['userType'] as int?;
    email = json['email'] as String?;
    userPassword = json['userPassword'] as String?;
    nationalId = json['nationalId'] as String?;
    teacherBranchId = json['teacherBranchId'] as int?;
    studentGradeId = json['studentGradeId'] as int?;
    name = json['name'] as String?;
    surname = json['surname'] as String?;
    mobile = json['mobile'] as String?;
    profilePhotoPath = json['profilePhotoPath'] as String?;
    firebaseUserid = json['firebaseUserid'] as String?;
    locationId = json['locationId'] as int?;
    teachEmpType = json['teachEmpType'] as int?;
    teachDutyCert = json['teachDutyCert'] as String?;
    refCode = json['refCode'] as String?;
    refUser = json['refUser'] != null ? BigInt.parse((json['refUser']).toString()) : null;
    parentName = json['parentName'] as String?;
    parentSurname = json['parentSurname'] as String?;
    headlineText = json['headlineText'] as String?;
    isPublic = json['isPublic'] as int?;
    status = json['status'] as int?;
    createdBy = json['createdBy'] != null ? BigInt.parse((json['createdBy']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = json['updatedBy'] != null ? BigInt.parse((json['updatedBy']).toString()) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
    approvedBy = json['approvedBy'] != null ? BigInt.parse((json['approvedBy']).toString()) : null;
    approvedOn = json['approvedOn'] != null ? DateTime.tryParse(json['approvedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
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
    data['RefUser'] = refUser != null ? BigInt.parse((refUser).toString()) : null;
    data['ParentName'] = parentName;
    data['ParentSurname'] = parentSurname;
    data['HeadlineText'] = headlineText;
    data['IsPublic'] = isPublic;
    data['Status'] = status;
    data['CreatedBy'] = createdBy != null ? BigInt.parse((createdBy).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = updatedBy != null ? BigInt.parse((updatedBy).toString()) : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    data['ApprovedBy'] = approvedBy != null ? BigInt.parse((approvedBy).toString()) : null;
    data['ApprovedOn'] = approvedOn != null ? approvedOn!.toIso8601String() : null;
    return data;
  }
}

class TblUsersLogin {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  DateTime? loginDatetime ;
  String? loginIp ;
  String? loginPort ;
  DateTime? logoffDatetime ;
  int? isSuccesfull ;

  TblUsersLogin({
    required  this.id,
    this.userId,
    this.loginDatetime,
    this.loginIp,
    this.loginPort,
    this.logoffDatetime,
    this.isSuccesfull,
  });

  TblUsersLogin.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    loginDatetime = json['loginDatetime'] != null ? DateTime.tryParse(json['loginDatetime']) : null;
    loginIp = json['loginIp'] as String?;
    loginPort = json['loginPort'] as String?;
    logoffDatetime = json['logoffDatetime'] != null ? DateTime.tryParse(json['logoffDatetime']) : null;
    isSuccesfull = json['isSuccesfull'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['LoginDatetime'] = loginDatetime != null ? loginDatetime!.toIso8601String() : null;
    data['LoginIp'] = loginIp;
    data['LoginPort'] = loginPort;
    data['LogoffDatetime'] = logoffDatetime != null ? logoffDatetime!.toIso8601String() : null;
    data['IsSuccesfull'] = isSuccesfull;
    return data;
  }
}

class TblUserType {
  int id =0;
  String? typeName ;
  int? status ;

  TblUserType({
    required  this.id,
    this.typeName,
    this.status,
  });

  TblUserType.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    typeName = json['typeName'] as String?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['TypeName'] = typeName;
    data['Status'] = status;
    return data;
  }
}

class TblUtilAcademicYear {
  int id =0;
  String? academicYear ;
  int? isDefault ;
  int? status ;

  TblUtilAcademicYear({
    required  this.id,
    this.academicYear,
    this.isDefault,
    this.status,
  });

  TblUtilAcademicYear.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    academicYear = json['academicYear'] as String?;
    isDefault = json['isDefault'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['AcademicYear'] = academicYear;
    data['IsDefault'] = isDefault;
    data['Status'] = status;
    return data;
  }
}

class TblUtilBranch {
  int id =0;
  String? branchName ;
  String? shortForm ;
  int? locationId ;
  int? status ;

  TblUtilBranch({
    required  this.id,
    this.branchName,
    this.shortForm,
    this.locationId,
    this.status,
  });

  TblUtilBranch.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    branchName = json['branchName'] as String?;
    shortForm = json['shortForm'] as String?;
    locationId = json['locationId'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['BranchName'] = branchName;
    data['ShortForm'] = shortForm;
    data['LocationId'] = locationId;
    data['Status'] = status;
    return data;
  }
}

class TblUtilCurrency {
  int id =0;
  String? curencyName ;
  int? locationId ;
  String? shortForm ;
  int? status ;

  TblUtilCurrency({
    required  this.id,
    this.curencyName,
    this.locationId,
    this.shortForm,
    this.status,
  });

  TblUtilCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    curencyName = json['curencyName'] as String?;
    locationId = json['locationId'] as int?;
    shortForm = json['shortForm'] as String?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['CurencyName'] = curencyName;
    data['LocationId'] = locationId;
    data['ShortForm'] = shortForm;
    data['Status'] = status;
    return data;
  }
}

class TblUtilDifficulty {
  int id =0;
  String? difficultyLev ;
  int? status ;

  TblUtilDifficulty({
    required  this.id,
    this.difficultyLev,
    this.status,
  });

  TblUtilDifficulty.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    difficultyLev = json['difficultyLev'] as String?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['DifficultyLev'] = difficultyLev;
    data['Status'] = status;
    return data;
  }
}

class TblUtilGrade {
  int id =0;
  int? schoolType ;
  int? gradeNumber ;
  String? gradeName ;
  int? locationId ;
  int? status ;

  TblUtilGrade({
    required  this.id,
    this.schoolType,
    this.gradeNumber,
    this.gradeName,
    this.locationId,
    this.status,
  });

  TblUtilGrade.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    schoolType = json['schoolType'] as int?;
    gradeNumber = json['gradeNumber'] as int?;
    gradeName = json['gradeName'] as String?;
    locationId = json['locationId'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['SchoolType'] = schoolType;
    data['GradeNumber'] = gradeNumber;
    data['GradeName'] = gradeName;
    data['LocationId'] = locationId;
    data['Status'] = status;
    return data;
  }
}

class TblUtilLanguage {
  int id =0;
  String? language ;
  String? shortForm ;
  int? status ;

  TblUtilLanguage({
    required  this.id,
    this.language,
    this.shortForm,
    this.status,
  });

  TblUtilLanguage.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    language = json['language'] as String?;
    shortForm = json['shortForm'] as String?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Language'] = language;
    data['ShortForm'] = shortForm;
    data['Status'] = status;
    return data;
  }
}

class TblUtilLikeType {
  int id =0;
  String? likeType ;
  int? status ;

  TblUtilLikeType({
    required  this.id,
    this.likeType,
    this.status,
  });

  TblUtilLikeType.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    likeType = json['likeType'] as String?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['LikeType'] = likeType;
    data['Status'] = status;
    return data;
  }
}

class TblUtilLocation {
  int id =0;
  String? type ;
  int? parentId ;
  String? locCode ;
  String? name ;
  int? status ;

  TblUtilLocation({
    required  this.id,
    this.type,
    this.parentId,
    this.locCode,
    this.name,
    this.status,
  });

  TblUtilLocation.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    type = json['type'] as String?;
    parentId = json['parentId'] as int?;
    locCode = json['locCode'] as String?;
    name = json['name'] as String?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Type'] = type;
    data['ParentId'] = parentId;
    data['LocCode'] = locCode;
    data['Name'] = name;
    data['Status'] = status;
    return data;
  }
}

class TblUtilLocationType {
  int id =0;
  String? locTypeName ;
  int? status ;

  TblUtilLocationType({
    required  this.id,
    this.locTypeName,
    this.status,
  });

  TblUtilLocationType.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    locTypeName = json['locTypeName'] as String?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['LocTypeName'] = locTypeName;
    data['Status'] = status;
    return data;
  }
}

class TblUtilStatus {
  int id =0;
  int? statusId ;
  String? statusName ;
  String? statusDesc ;
  int? isActive ;

  TblUtilStatus({
    required  this.id,
    this.statusId,
    this.statusName,
    this.statusDesc,
    this.isActive,
  });

  TblUtilStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    statusId = json['statusId'] as int?;
    statusName = json['statusName'] as String?;
    statusDesc = json['statusDesc'] as String?;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['StatusId'] = statusId;
    data['StatusName'] = statusName;
    data['StatusDesc'] = statusDesc;
    data['IsActive'] = isActive;
    return data;
  }
}

class TblVidVideoAchvMap {
  BigInt id =BigInt.parse('0');
  BigInt? videoId ;
  int? achvId ;
  int? status ;

  TblVidVideoAchvMap({
    required  this.id,
    this.videoId,
    this.achvId,
    this.status,
  });

  TblVidVideoAchvMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    videoId = json['videoId'] != null ? BigInt.parse((json['videoId']).toString()) : null;
    achvId = json['achvId'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['VideoId'] = videoId != null ? BigInt.parse((videoId).toString()) : null;
    data['AchvId'] = achvId;
    data['Status'] = status;
    return data;
  }
}

class TblVidVideoLike {
  BigInt id =BigInt.parse('0');
  BigInt? videoId ;
  BigInt? userId ;
  int? likeType ;
  DateTime? createdOn ;
  int? status ;

  TblVidVideoLike({
    required  this.id,
    this.videoId,
    this.userId,
    this.likeType,
    this.createdOn,
    this.status,
  });

  TblVidVideoLike.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    videoId = json['videoId'] != null ? BigInt.parse((json['videoId']).toString()) : null;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    likeType = json['likeType'] as int?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['VideoId'] = videoId != null ? BigInt.parse((videoId).toString()) : null;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['LikeType'] = likeType;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['Status'] = status;
    return data;
  }
}

class TblVidVideoMain {
  BigInt id =BigInt.parse('0');
  int? academicYear ;
  int? locationId ;
  BigInt? userId ;
  int? gradeId ;
  int? learnId ;
  String? relationId ;
  String? title ;
  String? description ;
  String? videoPath ;
  List<int>? videoData ;
  int? isPublic ;
  int? status ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblVidVideoMain({
    required  this.id,
    this.academicYear,
    this.locationId,
    this.userId,
    this.gradeId,
    this.learnId,
    this.relationId,
    this.title,
    this.description,
    this.videoPath,
    this.videoData,
    this.isPublic,
    this.status,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblVidVideoMain.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    academicYear = json['academicYear'] as int?;
    locationId = json['locationId'] as int?;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    gradeId = json['gradeId'] as int?;
    learnId = json['learnId'] as int?;
    relationId = json['relationId'] as String?;
    title = json['title'] as String?;
    description = json['description'] as String?;
    videoPath = json['videoPath'] as String?;
    videoData = json['videoData'] as List<int>?;
    isPublic = json['isPublic'] as int?;
    status = json['status'] as int?;
    createdBy = json['createdBy'] != null ? BigInt.parse((json['createdBy']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = json['updatedBy'] != null ? BigInt.parse((json['updatedBy']).toString()) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AcademicYear'] = academicYear;
    data['LocationId'] = locationId;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['GradeId'] = gradeId;
    data['LearnId'] = learnId;
    data['RelationId'] = relationId;
    data['Title'] = title;
    data['Description'] = description;
    data['VideoPath'] = videoPath;
    data['VideoData'] = videoData;
    data['IsPublic'] = isPublic;
    data['Status'] = status;
    data['CreatedBy'] = createdBy != null ? BigInt.parse((createdBy).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = updatedBy != null ? BigInt.parse((updatedBy).toString()) : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class ViewQueQuestionMain {
  BigInt id =BigInt.parse('0');
  int? academicYear ;
  int? difficultyLev ;
  int? locationId ;
  BigInt? userId ;
  int? gradeId ;
  int? learnId ;
  int? branchId ;
  String? relationId ;
  String? questionToken ;
  String? questionText ;
  String? resolution ;
  int? isPublic ;
  String? isPublicName ;
  int? status ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;
  String? academicYearName ;
  String? difficultyLevName ;
  String? locationNameChain ;
  String? userNameSurname ;
  String? gradeName ;
  String? learnNameChain ;
  String? statusName ;
  String? createdByNameSurname ;
  String? updatedByNameSurname ;
  String? branchName ;

  ViewQueQuestionMain({
    required  this.id,
    this.academicYear,
    this.difficultyLev,
    this.locationId,
    this.userId,
    this.gradeId,
    this.learnId,
    this.branchId,
    this.relationId,
    this.questionToken,
    this.questionText,
    this.resolution,
    this.isPublic,
    this.isPublicName,
    this.status,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
    this.academicYearName,
    this.difficultyLevName,
    this.locationNameChain,
    this.userNameSurname,
    this.gradeName,
    this.learnNameChain,
    this.statusName,
    this.createdByNameSurname,
    this.updatedByNameSurname,
    this.branchName,
  });

  ViewQueQuestionMain.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    academicYear = json['academicYear'] as int?;
    difficultyLev = json['difficultyLev'] as int?;
    locationId = json['locationId'] as int?;
    userId = json['userId'] != null ? BigInt.parse((json['userId']).toString()) : null;
    gradeId = json['gradeId'] as int?;
    learnId = json['learnId'] as int?;
    branchId = json['branchId'] as int?;
    relationId = json['relationId'] as String?;
    questionToken = json['questionToken'] as String?;
    questionText = json['questionText'] as String?;
    resolution = json['resolution'] as String?;
    isPublic = json['isPublic'] as int?;
    isPublicName = json['isPublicName'] as String?;
    status = json['status'] as int?;
    createdBy = json['createdBy'] != null ? BigInt.parse((json['createdBy']).toString()) : null;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = json['updatedBy'] != null ? BigInt.parse((json['updatedBy']).toString()) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
    academicYearName = json['academicYearName'] as String?;
    difficultyLevName = json['difficultyLevName'] as String?;
    locationNameChain = json['locationNameChain'] as String?;
    userNameSurname = json['userNameSurname'] as String?;
    gradeName = json['gradeName'] as String?;
    learnNameChain = json['learnNameChain'] as String?;
    statusName = json['statusName'] as String?;
    createdByNameSurname = json['createdByNameSurname'] as String?;
    updatedByNameSurname = json['updatedByNameSurname'] as String?;
    branchName = json['branchName'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AcademicYear'] = academicYear;
    data['DifficultyLev'] = difficultyLev;
    data['LocationId'] = locationId;
    data['UserId'] = userId != null ? BigInt.parse((userId).toString()) : null;
    data['GradeId'] = gradeId;
    data['LearnId'] = learnId;
    data['BranchId'] = branchId;
    data['RelationId'] = relationId;
    data['QuestionToken'] = questionToken;
    data['QuestionText'] = questionText;
    data['Resolution'] = resolution;
    data['IsPublic'] = isPublic;
    data['IsPublicName'] = isPublicName;
    data['Status'] = status;
    data['CreatedBy'] = createdBy != null ? BigInt.parse((createdBy).toString()) : null;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = updatedBy != null ? BigInt.parse((updatedBy).toString()) : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    data['AcademicYearName'] = academicYearName;
    data['DifficultyLevName'] = difficultyLevName;
    data['LocationNameChain'] = locationNameChain;
    data['UserNameSurname'] = userNameSurname;
    data['GradeName'] = gradeName;
    data['LearnNameChain'] = learnNameChain;
    data['StatusName'] = statusName;
    data['CreatedByNameSurname'] = createdByNameSurname;
    data['UpdatedByNameSurname'] = updatedByNameSurname;
    data['BranchName'] = branchName;
    return data;
  }
}

