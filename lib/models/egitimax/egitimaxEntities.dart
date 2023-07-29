class TblAnnounceClassMap {
  BigInt id =BigInt.parse('0');
  BigInt? announceId ;
  BigInt? classId ;

  TblAnnounceClassMap({
    required  this.id,
    this.announceId,
    this.classId,
  });

  TblAnnounceClassMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    announceId = BigInt.parse((json['announceId']??'0').toString());
    classId = BigInt.parse((json['classId']??'0').toString());
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AnnounceId'] = BigInt.parse((announceId??'0').toString());
    data['ClassId'] = BigInt.parse((classId??'0').toString());
    return data;
  }
}

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
    announceId = BigInt.parse((json['announceId']??'0').toString());
    description = json['description'] as String?;
    docPath = json['docPath'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AnnounceId'] = BigInt.parse((announceId??'0').toString());
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
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
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
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
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
    announceId = BigInt.parse((json['announceId']??'0').toString());
    sectionId = json['sectionId'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AnnounceId'] = BigInt.parse((announceId??'0').toString());
    data['SectionId'] = sectionId;
    return data;
  }
}

class TblAssignmentClassMap {
  BigInt id =BigInt.parse('0');
  BigInt? asgnId ;
  BigInt? classId ;

  TblAssignmentClassMap({
    required  this.id,
    this.asgnId,
    this.classId,
  });

  TblAssignmentClassMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    asgnId = BigInt.parse((json['asgnId']??'0').toString());
    classId = BigInt.parse((json['classId']??'0').toString());
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AsgnId'] = BigInt.parse((asgnId??'0').toString());
    data['ClassId'] = BigInt.parse((classId??'0').toString());
    return data;
  }
}

class TblAssignmentComponent {
  BigInt id =BigInt.parse('0');
  BigInt? asgnId ;
  int? orderNo ;
  int? compType ;
  BigInt? courseId ;
  BigInt? quizId ;
  BigInt? currId ;
  BigInt? homeworkId ;

  TblAssignmentComponent({
    required  this.id,
    this.asgnId,
    this.orderNo,
    this.compType,
    this.courseId,
    this.quizId,
    this.currId,
    this.homeworkId,
  });

  TblAssignmentComponent.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    asgnId = BigInt.parse((json['asgnId']??'0').toString());
    orderNo = json['orderNo'] as int?;
    compType = json['compType'] as int?;
    courseId = BigInt.parse((json['courseId']??'0').toString());
    quizId = BigInt.parse((json['quizId']??'0').toString());
    currId = BigInt.parse((json['currId']??'0').toString());
    homeworkId = BigInt.parse((json['homeworkId']??'0').toString());
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AsgnId'] = BigInt.parse((asgnId??'0').toString());
    data['OrderNo'] = orderNo;
    data['CompType'] = compType;
    data['CourseId'] = BigInt.parse((courseId??'0').toString());
    data['QuizId'] = BigInt.parse((quizId??'0').toString());
    data['CurrId'] = BigInt.parse((currId??'0').toString());
    data['HomeworkId'] = BigInt.parse((homeworkId??'0').toString());
    return data;
  }
}

class TblAssignmentCompType {
  int id =0;
  String? compType ;

  TblAssignmentCompType({
    required  this.id,
    this.compType,
  });

  TblAssignmentCompType.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    compType = json['compType'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['CompType'] = compType;
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
    assignId = BigInt.parse((json['assignId']??'0').toString());
    docPath = json['docPath'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AssignId'] = BigInt.parse((assignId??'0').toString());
    data['DocPath'] = docPath;
    return data;
  }
}

class TblAssignmentHomework {
  BigInt id =BigInt.parse('0');
  BigInt? asgnCompId ;
  String? hwNote ;

  TblAssignmentHomework({
    required  this.id,
    this.asgnCompId,
    this.hwNote,
  });

  TblAssignmentHomework.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    asgnCompId = BigInt.parse((json['asgnCompId']??'0').toString());
    hwNote = json['hwNote'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AsgnCompId'] = BigInt.parse((asgnCompId??'0').toString());
    data['HwNote'] = hwNote;
    return data;
  }
}

class TblAssignmentHomeworkDoc {
  BigInt id =BigInt.parse('0');
  BigInt? asgnHwId ;
  String? docPath ;

  TblAssignmentHomeworkDoc({
    required  this.id,
    this.asgnHwId,
    this.docPath,
  });

  TblAssignmentHomeworkDoc.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    asgnHwId = BigInt.parse((json['asgnHwId']??'0').toString());
    docPath = json['docPath'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AsgnHwId'] = BigInt.parse((asgnHwId??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    title = json['title'] as String?;
    assignNote = json['assignNote'] as String?;
    questionId = BigInt.parse((json['questionId']??'0').toString());
    quizId = BigInt.parse((json['quizId']??'0').toString());
    lectureId = BigInt.parse((json['lectureId']??'0').toString());
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
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['Title'] = title;
    data['AssignNote'] = assignNote;
    data['QuestionId'] = BigInt.parse((questionId??'0').toString());
    data['QuizId'] = BigInt.parse((quizId??'0').toString());
    data['LectureId'] = BigInt.parse((lectureId??'0').toString());
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
    assignId = BigInt.parse((json['assignId']??'0').toString());
    sectionId = json['sectionId'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AssignId'] = BigInt.parse((assignId??'0').toString());
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
    assignId = BigInt.parse((json['assignId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AssignId'] = BigInt.parse((assignId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
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

class TblClassAdmin {
  BigInt id =BigInt.parse('0');
  BigInt? classId ;
  BigInt? userId ;
  int? isActive ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblClassAdmin({
    required  this.id,
    this.classId,
    this.userId,
    this.isActive,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblClassAdmin.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    classId = BigInt.parse((json['classId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    isActive = json['isActive'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['ClassId'] = BigInt.parse((classId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['IsActive'] = isActive;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblClassGrade {
  int id =0;
  int? schoolType ;
  int? gradeNum ;
  String? gradeName ;
  int? countryId ;
  int? isActive ;

  TblClassGrade({
    required  this.id,
    this.schoolType,
    this.gradeNum,
    this.gradeName,
    this.countryId,
    this.isActive,
  });

  TblClassGrade.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    schoolType = json['schoolType'] as int?;
    gradeNum = json['gradeNum'] as int?;
    gradeName = json['gradeName'] as String?;
    countryId = json['countryId'] as int?;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['SchoolType'] = schoolType;
    data['GradeNum'] = gradeNum;
    data['GradeName'] = gradeName;
    data['CountryId'] = countryId;
    data['IsActive'] = isActive;
    return data;
  }
}

class TblClassMain {
  BigInt id =BigInt.parse('0');
  int? gradeId ;
  String? className ;
  int? isActive ;
  int? isPublic ;
  int? academicYear ;
  String? description ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblClassMain({
    required  this.id,
    this.gradeId,
    this.className,
    this.isActive,
    this.isPublic,
    this.academicYear,
    this.description,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblClassMain.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    gradeId = json['gradeId'] as int?;
    className = json['className'] as String?;
    isActive = json['isActive'] as int?;
    isPublic = json['isPublic'] as int?;
    academicYear = json['academicYear'] as int?;
    description = json['description'] as String?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['GradeId'] = gradeId;
    data['ClassName'] = className;
    data['IsActive'] = isActive;
    data['IsPublic'] = isPublic;
    data['AcademicYear'] = academicYear;
    data['Description'] = description;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblClassStuMap {
  BigInt id =BigInt.parse('0');
  BigInt? classId ;
  BigInt? userId ;
  int? academicYear ;
  BigInt? invitedBy ;
  DateTime? invitedOn ;
  BigInt? acceptedBy ;
  DateTime? acceptedOn ;
  int? stuStatus ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;
  int? isActive ;

  TblClassStuMap({
    required  this.id,
    this.classId,
    this.userId,
    this.academicYear,
    this.invitedBy,
    this.invitedOn,
    this.acceptedBy,
    this.acceptedOn,
    this.stuStatus,
    this.updatedBy,
    this.updatedOn,
    this.isActive,
  });

  TblClassStuMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    classId = BigInt.parse((json['classId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    academicYear = json['academicYear'] as int?;
    invitedBy = BigInt.parse((json['invitedBy']??'0').toString());
    invitedOn = json['invitedOn'] != null ? DateTime.tryParse(json['invitedOn']) : null;
    acceptedBy = BigInt.parse((json['acceptedBy']??'0').toString());
    acceptedOn = json['acceptedOn'] != null ? DateTime.tryParse(json['acceptedOn']) : null;
    stuStatus = json['stuStatus'] as int?;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['ClassId'] = BigInt.parse((classId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['AcademicYear'] = academicYear;
    data['InvitedBy'] = BigInt.parse((invitedBy??'0').toString());
    data['InvitedOn'] = invitedOn != null ? invitedOn!.toIso8601String() : null;
    data['AcceptedBy'] = BigInt.parse((acceptedBy??'0').toString());
    data['AcceptedOn'] = acceptedOn != null ? acceptedOn!.toIso8601String() : null;
    data['StuStatus'] = stuStatus;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    data['IsActive'] = isActive;
    return data;
  }
}

class TblClassStuStatus {
  int id =0;
  String? status ;
  int? isActive ;

  TblClassStuStatus({
    required  this.id,
    this.status,
    this.isActive,
  });

  TblClassStuStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    status = json['status'] as String?;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Status'] = status;
    data['IsActive'] = isActive;
    return data;
  }
}

class TblClassTeacMap {
  BigInt id =BigInt.parse('0');
  BigInt? classId ;
  BigInt? userId ;
  int? branchId ;
  int? academicYear ;
  int? isActive ;
  int? stuStatus ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblClassTeacMap({
    required  this.id,
    this.classId,
    this.userId,
    this.branchId,
    this.academicYear,
    this.isActive,
    this.stuStatus,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblClassTeacMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    classId = BigInt.parse((json['classId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    branchId = json['branchId'] as int?;
    academicYear = json['academicYear'] as int?;
    isActive = json['isActive'] as int?;
    stuStatus = json['stuStatus'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['ClassId'] = BigInt.parse((classId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['BranchId'] = branchId;
    data['AcademicYear'] = academicYear;
    data['IsActive'] = isActive;
    data['StuStatus'] = stuStatus;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblCrsCourseDoc {
  BigInt id =BigInt.parse('0');
  BigInt? courseId ;
  String? description ;
  String? documentPath ;
  double? aggRating ;
  int? isActive ;
  BigInt? createdBy ;
  DateTime? createdOn ;

  TblCrsCourseDoc({
    required  this.id,
    this.courseId,
    this.description,
    this.documentPath,
    this.aggRating,
    this.isActive,
    this.createdBy,
    this.createdOn,
  });

  TblCrsCourseDoc.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    courseId = BigInt.parse((json['courseId']??'0').toString());
    description = json['description'] as String?;
    documentPath = json['documentPath'] as String?;
    aggRating = json['aggRating'] as double?;
    isActive = json['isActive'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['CourseId'] = BigInt.parse((courseId??'0').toString());
    data['Description'] = description;
    data['DocumentPath'] = documentPath;
    data['AggRating'] = aggRating;
    data['IsActive'] = isActive;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    return data;
  }
}

class TblCrsCourseFlow {
  BigInt id =BigInt.parse('0');
  BigInt? courseId ;
  int? orderNo ;
  BigInt? videoId ;
  BigInt? quizId ;
  BigInt? docId ;
  BigInt? questionId ;
  int? isActive ;

  TblCrsCourseFlow({
    required  this.id,
    this.courseId,
    this.orderNo,
    this.videoId,
    this.quizId,
    this.docId,
    this.questionId,
    this.isActive,
  });

  TblCrsCourseFlow.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    courseId = BigInt.parse((json['courseId']??'0').toString());
    orderNo = json['orderNo'] as int?;
    videoId = BigInt.parse((json['videoId']??'0').toString());
    quizId = BigInt.parse((json['quizId']??'0').toString());
    docId = BigInt.parse((json['docId']??'0').toString());
    questionId = BigInt.parse((json['questionId']??'0').toString());
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['CourseId'] = BigInt.parse((courseId??'0').toString());
    data['OrderNo'] = orderNo;
    data['VideoId'] = BigInt.parse((videoId??'0').toString());
    data['QuizId'] = BigInt.parse((quizId??'0').toString());
    data['DocId'] = BigInt.parse((docId??'0').toString());
    data['QuestionId'] = BigInt.parse((questionId??'0').toString());
    data['IsActive'] = isActive;
    return data;
  }
}

class TblCrsCourseFlowStu {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  BigInt? crsItemId ;
  int? flowStatus ;
  DateTime? startedOn ;
  DateTime? finishedOn ;

  TblCrsCourseFlowStu({
    required  this.id,
    this.userId,
    this.crsItemId,
    this.flowStatus,
    this.startedOn,
    this.finishedOn,
  });

  TblCrsCourseFlowStu.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    crsItemId = BigInt.parse((json['crsItemId']??'0').toString());
    flowStatus = json['flowStatus'] as int?;
    startedOn = json['startedOn'] != null ? DateTime.tryParse(json['startedOn']) : null;
    finishedOn = json['finishedOn'] != null ? DateTime.tryParse(json['finishedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['CrsItemId'] = BigInt.parse((crsItemId??'0').toString());
    data['FlowStatus'] = flowStatus;
    data['StartedOn'] = startedOn != null ? startedOn!.toIso8601String() : null;
    data['FinishedOn'] = finishedOn != null ? finishedOn!.toIso8601String() : null;
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
    courseId = BigInt.parse((json['courseId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    likeType = json['likeType'] as int?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['CourseId'] = BigInt.parse((courseId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    branchId = json['branchId'] as int?;
    gradeId = json['gradeId'] as int?;
    sectionId = BigInt.parse((json['sectionId']??'0').toString());
    title = json['title'] as String?;
    description = json['description'] as String?;
    isPublic = json['isPublic'] as int?;
    status = json['status'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['LocationId'] = locationId;
    data['AcademicYear'] = academicYear;
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['BranchId'] = branchId;
    data['GradeId'] = gradeId;
    data['SectionId'] = BigInt.parse((sectionId??'0').toString());
    data['Title'] = title;
    data['Description'] = description;
    data['IsPublic'] = isPublic;
    data['Status'] = status;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblCrsCourseRate {
  BigInt id =BigInt.parse('0');
  BigInt? courseId ;
  BigInt? userId ;
  int? rating ;
  String? userComment ;
  DateTime? createdOn ;
  int? isActive ;

  TblCrsCourseRate({
    required  this.id,
    this.courseId,
    this.userId,
    this.rating,
    this.userComment,
    this.createdOn,
    this.isActive,
  });

  TblCrsCourseRate.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    courseId = BigInt.parse((json['courseId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    rating = json['rating'] as int?;
    userComment = json['userComment'] as String?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['CourseId'] = BigInt.parse((courseId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['Rating'] = rating;
    data['UserComment'] = userComment;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['IsActive'] = isActive;
    return data;
  }
}

class TblCrsCourseStudent {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  BigInt? courseId ;
  int? crsStatus ;
  DateTime? startedOn ;
  DateTime? finishedOn ;

  TblCrsCourseStudent({
    required  this.id,
    this.userId,
    this.courseId,
    this.crsStatus,
    this.startedOn,
    this.finishedOn,
  });

  TblCrsCourseStudent.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    courseId = BigInt.parse((json['courseId']??'0').toString());
    crsStatus = json['crsStatus'] as int?;
    startedOn = json['startedOn'] != null ? DateTime.tryParse(json['startedOn']) : null;
    finishedOn = json['finishedOn'] != null ? DateTime.tryParse(json['finishedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['CourseId'] = BigInt.parse((courseId??'0').toString());
    data['CrsStatus'] = crsStatus;
    data['StartedOn'] = startedOn != null ? startedOn!.toIso8601String() : null;
    data['FinishedOn'] = finishedOn != null ? finishedOn!.toIso8601String() : null;
    return data;
  }
}

class TblCrsCourseSubdomMap {
  BigInt id =BigInt.parse('0');
  BigInt? courseId ;
  int? learnId ;
  int? isActive ;

  TblCrsCourseSubdomMap({
    required  this.id,
    this.courseId,
    this.learnId,
    this.isActive,
  });

  TblCrsCourseSubdomMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    courseId = BigInt.parse((json['courseId']??'0').toString());
    learnId = json['learnId'] as int?;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['CourseId'] = BigInt.parse((courseId??'0').toString());
    data['LearnId'] = learnId;
    data['IsActive'] = isActive;
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
    courseId = BigInt.parse((json['courseId']??'0').toString());
    userType = json['userType'] as int?;
    userId = BigInt.parse((json['userId']??'0').toString());
    isAdmin = json['isAdmin'] as int?;
    status = json['status'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AcademicYear'] = academicYear;
    data['CourseId'] = BigInt.parse((courseId??'0').toString());
    data['UserType'] = userType;
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['IsAdmin'] = isAdmin;
    data['Status'] = status;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblCrsCurrCourseMap {
  BigInt id =BigInt.parse('0');
  BigInt? currId ;
  BigInt? courseId ;
  int? orderNo ;
  int? isActive ;

  TblCrsCurrCourseMap({
    required  this.id,
    this.currId,
    this.courseId,
    this.orderNo,
    this.isActive,
  });

  TblCrsCurrCourseMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    currId = BigInt.parse((json['currId']??'0').toString());
    courseId = BigInt.parse((json['courseId']??'0').toString());
    orderNo = json['orderNo'] as int?;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['CurrId'] = BigInt.parse((currId??'0').toString());
    data['CourseId'] = BigInt.parse((courseId??'0').toString());
    data['OrderNo'] = orderNo;
    data['IsActive'] = isActive;
    return data;
  }
}

class TblCrsCurriculum {
  BigInt id =BigInt.parse('0');
  int? country ;
  int? academicYear ;
  BigInt? userId ;
  String? title ;
  int? domainId ;
  int? gradeId ;
  String? description ;
  String? welcomeMsg ;
  String? goodbyeMsg ;
  int? isPublic ;
  int? isActive ;
  double? aggRating ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblCrsCurriculum({
    required  this.id,
    this.country,
    this.academicYear,
    this.userId,
    this.title,
    this.domainId,
    this.gradeId,
    this.description,
    this.welcomeMsg,
    this.goodbyeMsg,
    this.isPublic,
    this.isActive,
    this.aggRating,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblCrsCurriculum.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    country = json['country'] as int?;
    academicYear = json['academicYear'] as int?;
    userId = BigInt.parse((json['userId']??'0').toString());
    title = json['title'] as String?;
    domainId = json['domainId'] as int?;
    gradeId = json['gradeId'] as int?;
    description = json['description'] as String?;
    welcomeMsg = json['welcomeMsg'] as String?;
    goodbyeMsg = json['goodbyeMsg'] as String?;
    isPublic = json['isPublic'] as int?;
    isActive = json['isActive'] as int?;
    aggRating = json['aggRating'] as double?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['Country'] = country;
    data['AcademicYear'] = academicYear;
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['Title'] = title;
    data['DomainId'] = domainId;
    data['GradeId'] = gradeId;
    data['Description'] = description;
    data['WelcomeMsg'] = welcomeMsg;
    data['GoodbyeMsg'] = goodbyeMsg;
    data['IsPublic'] = isPublic;
    data['IsActive'] = isActive;
    data['AggRating'] = aggRating;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblCrsCurriculumRate {
  BigInt id =BigInt.parse('0');
  BigInt? currId ;
  BigInt? userId ;
  int? rating ;
  String? userComment ;
  DateTime? createdOn ;
  int? isActive ;

  TblCrsCurriculumRate({
    required  this.id,
    this.currId,
    this.userId,
    this.rating,
    this.userComment,
    this.createdOn,
    this.isActive,
  });

  TblCrsCurriculumRate.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    currId = BigInt.parse((json['currId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    rating = json['rating'] as int?;
    userComment = json['userComment'] as String?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['CurrId'] = BigInt.parse((currId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['Rating'] = rating;
    data['UserComment'] = userComment;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['IsActive'] = isActive;
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
    moduleId = BigInt.parse((json['moduleId']??'0').toString());
    lectureId = BigInt.parse((json['lectureId']??'0').toString());
    orderNo = json['orderNo'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['ModuleId'] = BigInt.parse((moduleId??'0').toString());
    data['LectureId'] = BigInt.parse((lectureId??'0').toString());
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
    courseId = BigInt.parse((json['courseId']??'0').toString());
    moduleType = json['moduleType'] as int?;
    moduleName = json['moduleName'] as String?;
    orderNo = json['orderNo'] as int?;
    startDate = json['startDate'] != null ? DateTime.tryParse(json['startDate']) : null;
    endDate = json['endDate'] != null ? DateTime.tryParse(json['endDate']) : null;
    status = json['status'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['CourseId'] = BigInt.parse((courseId??'0').toString());
    data['ModuleType'] = moduleType;
    data['ModuleName'] = moduleName;
    data['OrderNo'] = orderNo;
    data['StartDate'] = startDate != null ? startDate!.toIso8601String() : null;
    data['EndDate'] = endDate != null ? endDate!.toIso8601String() : null;
    data['Status'] = status;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
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

class TblCrsStuAchGapQuest {
  BigInt id =BigInt.parse('0');
  BigInt? achGapId ;
  BigInt? stuQuestionId ;
  DateTime? createdOn ;

  TblCrsStuAchGapQuest({
    required  this.id,
    this.achGapId,
    this.stuQuestionId,
    this.createdOn,
  });

  TblCrsStuAchGapQuest.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    achGapId = BigInt.parse((json['achGapId']??'0').toString());
    stuQuestionId = BigInt.parse((json['stuQuestionId']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AchGapId'] = BigInt.parse((achGapId??'0').toString());
    data['StuQuestionId'] = BigInt.parse((stuQuestionId??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    return data;
  }
}

class TblCrsStuAchGapVideo {
  BigInt id =BigInt.parse('0');
  BigInt? achGapId ;
  BigInt? stuVidId ;
  DateTime? createdOn ;

  TblCrsStuAchGapVideo({
    required  this.id,
    this.achGapId,
    this.stuVidId,
    this.createdOn,
  });

  TblCrsStuAchGapVideo.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    achGapId = BigInt.parse((json['achGapId']??'0').toString());
    stuVidId = BigInt.parse((json['stuVidId']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AchGapId'] = BigInt.parse((achGapId??'0').toString());
    data['StuVidId'] = BigInt.parse((stuVidId??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    return data;
  }
}

class TblCrsStudentQuest {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  BigInt? crsQuizId ;
  BigInt? questionId ;
  BigInt? selectedOpt ;
  int? isCorrect ;
  int? lookAgain ;
  DateTime? createdOn ;
  DateTime? updatedOn ;

  TblCrsStudentQuest({
    required  this.id,
    this.userId,
    this.crsQuizId,
    this.questionId,
    this.selectedOpt,
    this.isCorrect,
    this.lookAgain,
    this.createdOn,
    this.updatedOn,
  });

  TblCrsStudentQuest.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    crsQuizId = BigInt.parse((json['crsQuizId']??'0').toString());
    questionId = BigInt.parse((json['questionId']??'0').toString());
    selectedOpt = BigInt.parse((json['selectedOpt']??'0').toString());
    isCorrect = json['isCorrect'] as int?;
    lookAgain = json['lookAgain'] as int?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['CrsQuizId'] = BigInt.parse((crsQuizId??'0').toString());
    data['QuestionId'] = BigInt.parse((questionId??'0').toString());
    data['SelectedOpt'] = BigInt.parse((selectedOpt??'0').toString());
    data['IsCorrect'] = isCorrect;
    data['LookAgain'] = lookAgain;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblCrsStudentQuestText {
  BigInt id =BigInt.parse('0');
  BigInt? stuQuestionId ;
  String? respText ;

  TblCrsStudentQuestText({
    required  this.id,
    this.stuQuestionId,
    this.respText,
  });

  TblCrsStudentQuestText.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    stuQuestionId = BigInt.parse((json['stuQuestionId']??'0').toString());
    respText = json['respText'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['StuQuestionId'] = BigInt.parse((stuQuestionId??'0').toString());
    data['RespText'] = respText;
    return data;
  }
}

class TblCrsStudentQuiz {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  BigInt? crsFlowId ;
  BigInt? quizId ;
  int? quizStatus ;
  int? iterationNo ;
  DateTime? startedOn ;
  DateTime? finishedOn ;

  TblCrsStudentQuiz({
    required  this.id,
    this.userId,
    this.crsFlowId,
    this.quizId,
    this.quizStatus,
    this.iterationNo,
    this.startedOn,
    this.finishedOn,
  });

  TblCrsStudentQuiz.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    crsFlowId = BigInt.parse((json['crsFlowId']??'0').toString());
    quizId = BigInt.parse((json['quizId']??'0').toString());
    quizStatus = json['quizStatus'] as int?;
    iterationNo = json['iterationNo'] as int?;
    startedOn = json['startedOn'] != null ? DateTime.tryParse(json['startedOn']) : null;
    finishedOn = json['finishedOn'] != null ? DateTime.tryParse(json['finishedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['CrsFlowId'] = BigInt.parse((crsFlowId??'0').toString());
    data['QuizId'] = BigInt.parse((quizId??'0').toString());
    data['QuizStatus'] = quizStatus;
    data['IterationNo'] = iterationNo;
    data['StartedOn'] = startedOn != null ? startedOn!.toIso8601String() : null;
    data['FinishedOn'] = finishedOn != null ? finishedOn!.toIso8601String() : null;
    return data;
  }
}

class TblCrsStudentVideo {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  BigInt? crsFlowId ;
  BigInt? videoId ;
  DateTime? startedOn ;
  DateTime? finishedOn ;

  TblCrsStudentVideo({
    required  this.id,
    this.userId,
    this.crsFlowId,
    this.videoId,
    this.startedOn,
    this.finishedOn,
  });

  TblCrsStudentVideo.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    crsFlowId = BigInt.parse((json['crsFlowId']??'0').toString());
    videoId = BigInt.parse((json['videoId']??'0').toString());
    startedOn = json['startedOn'] != null ? DateTime.tryParse(json['startedOn']) : null;
    finishedOn = json['finishedOn'] != null ? DateTime.tryParse(json['finishedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['CrsFlowId'] = BigInt.parse((crsFlowId??'0').toString());
    data['VideoId'] = BigInt.parse((videoId??'0').toString());
    data['StartedOn'] = startedOn != null ? startedOn!.toIso8601String() : null;
    data['FinishedOn'] = finishedOn != null ? finishedOn!.toIso8601String() : null;
    return data;
  }
}

class TblFavCourse {
  int id =0;
  BigInt? userId ;
  BigInt? courseId ;
  DateTime? createdOn ;

  TblFavCourse({
    required  this.id,
    this.userId,
    this.courseId,
    this.createdOn,
  });

  TblFavCourse.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    userId = BigInt.parse((json['userId']??'0').toString());
    courseId = BigInt.parse((json['courseId']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['CourseId'] = BigInt.parse((courseId??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    return data;
  }
}

class TblFavGroupCourse {
  int id =0;
  BigInt? userId ;
  String? groupName ;

  TblFavGroupCourse({
    required  this.id,
    this.userId,
    this.groupName,
  });

  TblFavGroupCourse.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    userId = BigInt.parse((json['userId']??'0').toString());
    groupName = json['groupName'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['GroupName'] = groupName;
    return data;
  }
}

class TblFavGroupCourseMap {
  int id =0;
  int? groupId ;
  int? favCourseId ;

  TblFavGroupCourseMap({
    required  this.id,
    this.groupId,
    this.favCourseId,
  });

  TblFavGroupCourseMap.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    groupId = json['groupId'] as int?;
    favCourseId = json['favCourseId'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['GroupId'] = groupId;
    data['FavCourseId'] = favCourseId;
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
    userId = BigInt.parse((json['userId']??'0').toString());
    groupName = json['groupName'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
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
    groupId = BigInt.parse((json['groupId']??'0').toString());
    favLectureId = BigInt.parse((json['favLectureId']??'0').toString());
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['GroupId'] = BigInt.parse((groupId??'0').toString());
    data['FavLectureId'] = BigInt.parse((favLectureId??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    groupName = json['groupName'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
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
    groupId = BigInt.parse((json['groupId']??'0').toString());
    favQuestionId = BigInt.parse((json['favQuestionId']??'0').toString());
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['GroupId'] = BigInt.parse((groupId??'0').toString());
    data['FavQuestionId'] = BigInt.parse((favQuestionId??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    groupName = json['groupName'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
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
    groupId = BigInt.parse((json['groupId']??'0').toString());
    favQuizId = BigInt.parse((json['favQuizId']??'0').toString());
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['GroupId'] = BigInt.parse((groupId??'0').toString());
    data['FavQuizId'] = BigInt.parse((favQuizId??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    groupName = json['groupName'] as String?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
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
    groupId = BigInt.parse((json['groupId']??'0').toString());
    favVideoId = BigInt.parse((json['favVideoId']??'0').toString());
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['GroupId'] = BigInt.parse((groupId??'0').toString());
    data['FavVideoId'] = BigInt.parse((favVideoId??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    lectureId = BigInt.parse((json['lectureId']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['LectureId'] = BigInt.parse((lectureId??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    questionId = BigInt.parse((json['questionId']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['QuestionId'] = BigInt.parse((questionId??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    quizId = BigInt.parse((json['quizId']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['QuizId'] = BigInt.parse((quizId??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    videoId = BigInt.parse((json['videoId']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['VideoId'] = BigInt.parse((videoId??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    return data;
  }
}

class TblLearnAchivement {
  int id =0;
  String? achCode ;
  int? countryId ;
  String? achivementText ;
  int? isActive ;
  String? achivementDesc ;
  int? gradeId ;

  TblLearnAchivement({
    required  this.id,
    this.achCode,
    this.countryId,
    this.achivementText,
    this.isActive,
    this.achivementDesc,
    this.gradeId,
  });

  TblLearnAchivement.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    achCode = json['achCode'] as String?;
    countryId = json['countryId'] as int?;
    achivementText = json['achivementText'] as String?;
    isActive = json['isActive'] as int?;
    achivementDesc = json['achivementDesc'] as String?;
    gradeId = json['gradeId'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['AchCode'] = achCode;
    data['CountryId'] = countryId;
    data['AchivementText'] = achivementText;
    data['IsActive'] = isActive;
    data['AchivementDesc'] = achivementDesc;
    data['GradeId'] = gradeId;
    return data;
  }
}

class TblLearnBranch {
  int id =0;
  String? branchName ;
  String? shortForm ;
  int? countryId ;
  int? isActive ;

  TblLearnBranch({
    required  this.id,
    this.branchName,
    this.shortForm,
    this.countryId,
    this.isActive,
  });

  TblLearnBranch.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    branchName = json['branchName'] as String?;
    shortForm = json['shortForm'] as String?;
    countryId = json['countryId'] as int?;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['BranchName'] = branchName;
    data['ShortForm'] = shortForm;
    data['CountryId'] = countryId;
    data['IsActive'] = isActive;
    return data;
  }
}

class TblLearnDomain {
  int id =0;
  int? branchId ;
  int? orderNo ;
  String? domainName ;
  int? countryId ;
  int? isActive ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblLearnDomain({
    required  this.id,
    this.branchId,
    this.orderNo,
    this.domainName,
    this.countryId,
    this.isActive,
    this.updatedBy,
    this.updatedOn,
  });

  TblLearnDomain.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    branchId = json['branchId'] as int?;
    orderNo = json['orderNo'] as int?;
    domainName = json['domainName'] as String?;
    countryId = json['countryId'] as int?;
    isActive = json['isActive'] as int?;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['BranchId'] = branchId;
    data['OrderNo'] = orderNo;
    data['DomainName'] = domainName;
    data['CountryId'] = countryId;
    data['IsActive'] = isActive;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
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

class TblLearnSubdomAchMap {
  int id =0;
  int? achvId ;
  int? subdomId ;
  int? isActive ;

  TblLearnSubdomAchMap({
    required  this.id,
    this.achvId,
    this.subdomId,
    this.isActive,
  });

  TblLearnSubdomAchMap.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    achvId = json['achvId'] as int?;
    subdomId = json['subdomId'] as int?;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['AchvId'] = achvId;
    data['SubdomId'] = subdomId;
    data['IsActive'] = isActive;
    return data;
  }
}

class TblLearnSubdomain {
  int id =0;
  int? domainId ;
  int? orderNo ;
  String? subdomName ;
  String? description ;
  int? isActive ;

  TblLearnSubdomain({
    required  this.id,
    this.domainId,
    this.orderNo,
    this.subdomName,
    this.description,
    this.isActive,
  });

  TblLearnSubdomain.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    domainId = json['domainId'] as int?;
    orderNo = json['orderNo'] as int?;
    subdomName = json['subdomName'] as String?;
    description = json['description'] as String?;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['DomainId'] = domainId;
    data['OrderNo'] = orderNo;
    data['SubdomName'] = subdomName;
    data['Description'] = description;
    data['IsActive'] = isActive;
    return data;
  }
}

class TblLearnSubdomGradeMap {
  int id =0;
  int? subdomId ;
  int? gradeId ;
  int? isActive ;

  TblLearnSubdomGradeMap({
    required  this.id,
    this.subdomId,
    this.gradeId,
    this.isActive,
  });

  TblLearnSubdomGradeMap.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    subdomId = json['subdomId'] as int?;
    gradeId = json['gradeId'] as int?;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['SubdomId'] = subdomId;
    data['GradeId'] = gradeId;
    data['IsActive'] = isActive;
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
    userId = BigInt.parse((json['userId']??'0').toString());
    lecFlowItem = BigInt.parse((json['lecFlowItem']??'0').toString());
    flowItemStatus = json['flowItemStatus'] as int?;
    startedOn = json['startedOn'] != null ? DateTime.tryParse(json['startedOn']) : null;
    finishedOn = json['finishedOn'] != null ? DateTime.tryParse(json['finishedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['LecFlowItem'] = BigInt.parse((lecFlowItem??'0').toString());
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
    lectureId = BigInt.parse((json['lectureId']??'0').toString());
    description = json['description'] as String?;
    docPath = json['docPath'] as String?;
    status = json['status'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['LectureId'] = BigInt.parse((lectureId??'0').toString());
    data['Description'] = description;
    data['DocPath'] = docPath;
    data['Status'] = status;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
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
    lectureId = BigInt.parse((json['lectureId']??'0').toString());
    orderNo = json['orderNo'] as int?;
    videoId = BigInt.parse((json['videoId']??'0').toString());
    quizId = BigInt.parse((json['quizId']??'0').toString());
    docId = BigInt.parse((json['docId']??'0').toString());
    questionId = BigInt.parse((json['questionId']??'0').toString());
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['LectureId'] = BigInt.parse((lectureId??'0').toString());
    data['OrderNo'] = orderNo;
    data['VideoId'] = BigInt.parse((videoId??'0').toString());
    data['QuizId'] = BigInt.parse((quizId??'0').toString());
    data['DocId'] = BigInt.parse((docId??'0').toString());
    data['QuestionId'] = BigInt.parse((questionId??'0').toString());
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
    lectureId = BigInt.parse((json['lectureId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    likeType = json['likeType'] as int?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['LectureId'] = BigInt.parse((lectureId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    branchId = json['branchId'] as int?;
    learnId = json['learnId'] as int?;
    gradeId = json['gradeId'] as int?;
    title = json['title'] as String?;
    description = json['description'] as String?;
    achievemeter = json['achievemeter'] as double?;
    isPublic = json['isPublic'] as int?;
    status = json['status'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['LocationId'] = locationId;
    data['AcademicYear'] = academicYear;
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['BranchId'] = branchId;
    data['LearnId'] = learnId;
    data['GradeId'] = gradeId;
    data['Title'] = title;
    data['Description'] = description;
    data['Achievemeter'] = achievemeter;
    data['IsPublic'] = isPublic;
    data['Status'] = status;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    lectureId = BigInt.parse((json['lectureId']??'0').toString());
    lectureStatus = json['lectureStatus'] as int?;
    startedOn = json['startedOn'] != null ? DateTime.tryParse(json['startedOn']) : null;
    finishedOn = json['finishedOn'] != null ? DateTime.tryParse(json['finishedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['LectureId'] = BigInt.parse((lectureId??'0').toString());
    data['LectureStatus'] = lectureStatus;
    data['StartedOn'] = startedOn != null ? startedOn!.toIso8601String() : null;
    data['FinishedOn'] = finishedOn != null ? finishedOn!.toIso8601String() : null;
    return data;
  }
}

class TblLocL1Country {
  int id =0;
  String? countrycode ;
  String? countryNameTr ;
  int? lang ;
  int? isActive ;

  TblLocL1Country({
    required  this.id,
    this.countrycode,
    this.countryNameTr,
    this.lang,
    this.isActive,
  });

  TblLocL1Country.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    countrycode = json['countrycode'] as String?;
    countryNameTr = json['countryNameTr'] as String?;
    lang = json['lang'] as int?;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Countrycode'] = countrycode;
    data['CountryNameTr'] = countryNameTr;
    data['Lang'] = lang;
    data['IsActive'] = isActive;
    return data;
  }
}

class TblLocL1CountryTran {
  int id =0;
  int? countyId ;
  int? langId ;
  int? isDefault ;
  String? countryName ;
  int? isActive ;

  TblLocL1CountryTran({
    required  this.id,
    this.countyId,
    this.langId,
    this.isDefault,
    this.countryName,
    this.isActive,
  });

  TblLocL1CountryTran.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    countyId = json['countyId'] as int?;
    langId = json['langId'] as int?;
    isDefault = json['isDefault'] as int?;
    countryName = json['countryName'] as String?;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['CountyId'] = countyId;
    data['LangId'] = langId;
    data['IsDefault'] = isDefault;
    data['CountryName'] = countryName;
    data['IsActive'] = isActive;
    return data;
  }
}

class TblLocL2State {
  int id =0;
  int? countyId ;
  String? statecode ;
  String? stateNameTr ;
  int? isActive ;

  TblLocL2State({
    required  this.id,
    this.countyId,
    this.statecode,
    this.stateNameTr,
    this.isActive,
  });

  TblLocL2State.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    countyId = json['countyId'] as int?;
    statecode = json['statecode'] as String?;
    stateNameTr = json['stateNameTr'] as String?;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['CountyId'] = countyId;
    data['Statecode'] = statecode;
    data['StateNameTr'] = stateNameTr;
    data['IsActive'] = isActive;
    return data;
  }
}

class TblLocL2StateTran {
  int id =0;
  int? stateId ;
  int? langId ;
  int? isDefault ;
  String? stateName ;
  int? isActive ;

  TblLocL2StateTran({
    required  this.id,
    this.stateId,
    this.langId,
    this.isDefault,
    this.stateName,
    this.isActive,
  });

  TblLocL2StateTran.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    stateId = json['stateId'] as int?;
    langId = json['langId'] as int?;
    isDefault = json['isDefault'] as int?;
    stateName = json['stateName'] as String?;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['StateId'] = stateId;
    data['LangId'] = langId;
    data['IsDefault'] = isDefault;
    data['StateName'] = stateName;
    data['IsActive'] = isActive;
    return data;
  }
}

class TblLocL3City {
  int id =0;
  int? countryId ;
  int? stateId ;
  String? cityCode ;
  String? cityNameTr ;
  int? isActive ;

  TblLocL3City({
    required  this.id,
    this.countryId,
    this.stateId,
    this.cityCode,
    this.cityNameTr,
    this.isActive,
  });

  TblLocL3City.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    countryId = json['countryId'] as int?;
    stateId = json['stateId'] as int?;
    cityCode = json['cityCode'] as String?;
    cityNameTr = json['cityNameTr'] as String?;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['CountryId'] = countryId;
    data['StateId'] = stateId;
    data['CityCode'] = cityCode;
    data['CityNameTr'] = cityNameTr;
    data['IsActive'] = isActive;
    return data;
  }
}

class TblLocL3CityTran {
  int id =0;
  int? cityId ;
  int? langId ;
  int? isDefault ;
  String? cityName ;
  int? isActive ;

  TblLocL3CityTran({
    required  this.id,
    this.cityId,
    this.langId,
    this.isDefault,
    this.cityName,
    this.isActive,
  });

  TblLocL3CityTran.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    cityId = json['cityId'] as int?;
    langId = json['langId'] as int?;
    isDefault = json['isDefault'] as int?;
    cityName = json['cityName'] as String?;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['CityId'] = cityId;
    data['LangId'] = langId;
    data['IsDefault'] = isDefault;
    data['CityName'] = cityName;
    data['IsActive'] = isActive;
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
    userId = BigInt.parse((json['userId']??'0').toString());
    roleId = json['roleId'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = BigInt.parse((userId??'0').toString());
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
    postId = BigInt.parse((json['postId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    parentCommentId = BigInt.parse((json['parentCommentId']??'0').toString());
    commentText = json['commentText'] as String?;
    mediaPath = json['mediaPath'] as String?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['PostId'] = BigInt.parse((postId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['ParentCommentId'] = BigInt.parse((parentCommentId??'0').toString());
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
    postId = BigInt.parse((json['postId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    likeType = json['likeType'] as int?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['PostId'] = BigInt.parse((postId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
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
    data['UserId'] = BigInt.parse((userId??'0').toString());
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
    questionId = BigInt.parse((json['questionId']??'0').toString());
    achvId = json['achvId'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['QuestionId'] = BigInt.parse((questionId??'0').toString());
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
    questionId = BigInt.parse((json['questionId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    likeType = json['likeType'] as int?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['QuestionId'] = BigInt.parse((questionId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    gradeId = json['gradeId'] as int?;
    learnId = json['learnId'] as int?;
    relationId = json['relationId'] as String?;
    questionToken = json['questionToken'] as String?;
    questionText = json['questionText'] as String?;
    resolution = json['resolution'] as String?;
    isPublic = json['isPublic'] as int?;
    status = json['status'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
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
    data['RelationId'] = relationId;
    data['QuestionToken'] = questionToken;
    data['QuestionText'] = questionText;
    data['Resolution'] = resolution;
    data['IsPublic'] = isPublic;
    data['Status'] = status;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
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
    questionId = BigInt.parse((json['questionId']??'0').toString());
    optIdentifier = json['optIdentifier'] as String?;
    optText = json['optText'] as String?;
    isCorrect = json['isCorrect'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['QuestionId'] = BigInt.parse((questionId??'0').toString());
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
    quizId = BigInt.parse((json['quizId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    likeType = json['likeType'] as int?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['QuizId'] = BigInt.parse((quizId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    gradeId = json['gradeId'] as int?;
    title = json['title'] as String?;
    description = json['description'] as String?;
    duration = json['duration'] as int?;
    headerText = json['headerText'] as String?;
    footerText = json['footerText'] as String?;
    isPublic = json['isPublic'] as int?;
    status = json['status'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['LocationId'] = locationId;
    data['AcademicYear'] = academicYear;
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['GradeId'] = gradeId;
    data['Title'] = title;
    data['Description'] = description;
    data['Duration'] = duration;
    data['HeaderText'] = headerText;
    data['FooterText'] = footerText;
    data['IsPublic'] = isPublic;
    data['Status'] = status;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblQuizRate {
  BigInt id =BigInt.parse('0');
  BigInt? quizId ;
  BigInt? userId ;
  int? rating ;
  String? userComment ;
  DateTime? createdOn ;
  int? isActive ;

  TblQuizRate({
    required  this.id,
    this.quizId,
    this.userId,
    this.rating,
    this.userComment,
    this.createdOn,
    this.isActive,
  });

  TblQuizRate.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    quizId = BigInt.parse((json['quizId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    rating = json['rating'] as int?;
    userComment = json['userComment'] as String?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['QuizId'] = BigInt.parse((quizId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['Rating'] = rating;
    data['UserComment'] = userComment;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['IsActive'] = isActive;
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
    quizId = BigInt.parse((json['quizId']??'0').toString());
    branchId = json['branchId'] as int?;
    orderNo = json['orderNo'] as int?;
    sectionDesc = json['sectionDesc'] as String?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['QuizId'] = BigInt.parse((quizId??'0').toString());
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
    sectionId = BigInt.parse((json['sectionId']??'0').toString());
    questionId = BigInt.parse((json['questionId']??'0').toString());
    orderNo = json['orderNo'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['SectionId'] = BigInt.parse((sectionId??'0').toString());
    data['QuestionId'] = BigInt.parse((questionId??'0').toString());
    data['OrderNo'] = orderNo;
    data['Status'] = status;
    return data;
  }
}

class TblSchAdmin {
  BigInt id =BigInt.parse('0');
  BigInt? schoolId ;
  BigInt? userId ;
  int? isActive ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblSchAdmin({
    required  this.id,
    this.schoolId,
    this.userId,
    this.isActive,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblSchAdmin.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    schoolId = BigInt.parse((json['schoolId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    isActive = json['isActive'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['SchoolId'] = BigInt.parse((schoolId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['IsActive'] = isActive;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblSchClassMap {
  BigInt id =BigInt.parse('0');
  BigInt? classId ;
  BigInt? schoolId ;
  int? isActive ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblSchClassMap({
    required  this.id,
    this.classId,
    this.schoolId,
    this.isActive,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblSchClassMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    classId = BigInt.parse((json['classId']??'0').toString());
    schoolId = BigInt.parse((json['schoolId']??'0').toString());
    isActive = json['isActive'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['ClassId'] = BigInt.parse((classId??'0').toString());
    data['SchoolId'] = BigInt.parse((schoolId??'0').toString());
    data['IsActive'] = isActive;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
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
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
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
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
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
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
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
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    status = json['status'] as int?;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AcademicYear'] = academicYear;
    data['SectionId'] = sectionId;
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['Status'] = status;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblSchSubschool {
  BigInt id =BigInt.parse('0');
  BigInt? mainId ;
  BigInt? subId ;
  int? isActive ;

  TblSchSubschool({
    required  this.id,
    this.mainId,
    this.subId,
    this.isActive,
  });

  TblSchSubschool.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    mainId = BigInt.parse((json['mainId']??'0').toString());
    subId = BigInt.parse((json['subId']??'0').toString());
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['MainId'] = BigInt.parse((mainId??'0').toString());
    data['SubId'] = BigInt.parse((subId??'0').toString());
    data['IsActive'] = isActive;
    return data;
  }
}

class TblSchTeacMap {
  BigInt id =BigInt.parse('0');
  BigInt? schoolId ;
  BigInt? userId ;
  int? academicYear ;
  int? isActive ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblSchTeacMap({
    required  this.id,
    this.schoolId,
    this.userId,
    this.academicYear,
    this.isActive,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblSchTeacMap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    schoolId = BigInt.parse((json['schoolId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    academicYear = json['academicYear'] as int?;
    isActive = json['isActive'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['SchoolId'] = BigInt.parse((schoolId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['AcademicYear'] = academicYear;
    data['IsActive'] = isActive;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
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
    schoolId = BigInt.parse((json['schoolId']??'0').toString());
    userType = json['userType'] as int?;
    userId = BigInt.parse((json['userId']??'0').toString());
    isAdmin = json['isAdmin'] as int?;
    status = json['status'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AcademicYear'] = academicYear;
    data['SchoolId'] = BigInt.parse((schoolId??'0').toString());
    data['UserType'] = userType;
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['IsAdmin'] = isAdmin;
    data['Status'] = status;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    questionId = BigInt.parse((json['questionId']??'0').toString());
    selectedOpt = BigInt.parse((json['selectedOpt']??'0').toString());
    isCorrect = json['isCorrect'] as int?;
    lookAgain = json['lookAgain'] as int?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['QuestionId'] = BigInt.parse((questionId??'0').toString());
    data['SelectedOpt'] = BigInt.parse((selectedOpt??'0').toString());
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
    questionId = BigInt.parse((json['questionId']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AchvId'] = achvId;
    data['QuestionId'] = BigInt.parse((questionId??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    quizId = BigInt.parse((json['quizId']??'0').toString());
    quizStatus = json['quizStatus'] as int?;
    iterationNo = json['iterationNo'] as int?;
    startedOn = json['startedOn'] != null ? DateTime.tryParse(json['startedOn']) : null;
    finishedOn = json['finishedOn'] != null ? DateTime.tryParse(json['finishedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['QuizId'] = BigInt.parse((quizId??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    achvId = json['achvId'] as int?;
    videoId = BigInt.parse((json['videoId']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['AchvId'] = achvId;
    data['VideoId'] = BigInt.parse((videoId??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    videoId = BigInt.parse((json['videoId']??'0').toString());
    startedOn = json['startedOn'] != null ? DateTime.tryParse(json['startedOn']) : null;
    finishedOn = json['finishedOn'] != null ? DateTime.tryParse(json['finishedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['VideoId'] = BigInt.parse((videoId??'0').toString());
    data['StartedOn'] = startedOn != null ? startedOn!.toIso8601String() : null;
    data['FinishedOn'] = finishedOn != null ? finishedOn!.toIso8601String() : null;
    return data;
  }
}

class TblTheaBranMap {
  int id =0;
  BigInt? userId ;
  int? branchId ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;
  int? isActive ;

  TblTheaBranMap({
    required  this.id,
    this.userId,
    this.branchId,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
    this.isActive,
  });

  TblTheaBranMap.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    userId = BigInt.parse((json['userId']??'0').toString());
    branchId = json['branchId'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['BranchId'] = branchId;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    data['IsActive'] = isActive;
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
    userId = BigInt.parse((json['userId']??'0').toString());
    accessUrl = json['accessUrl'] as String?;
    accessTimestamp = json['accessTimestamp'] != null ? DateTime.tryParse(json['accessTimestamp']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['AccessUrl'] = accessUrl;
    data['AccessTimestamp'] = accessTimestamp != null ? accessTimestamp!.toIso8601String() : null;
    return data;
  }
}

class TblUserChild {
  BigInt id =BigInt.parse('0');
  BigInt? parentUserId ;
  BigInt? userId ;
  int? isActive ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;

  TblUserChild({
    required  this.id,
    this.parentUserId,
    this.userId,
    this.isActive,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblUserChild.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    parentUserId = BigInt.parse((json['parentUserId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    isActive = json['isActive'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['ParentUserId'] = BigInt.parse((parentUserId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['IsActive'] = isActive;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
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
    userId = BigInt.parse((json['userId']??'0').toString());
    gdprVer = json['gdprVer'] as String?;
    contractVer = json['contractVer'] as String?;
    gdprAppDate = json['gdprAppDate'] != null ? DateTime.tryParse(json['gdprAppDate']) : null;
    contractAppDate = json['contractAppDate'] != null ? DateTime.tryParse(json['contractAppDate']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
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
    follower = BigInt.parse((json['follower']??'0').toString());
    following = BigInt.parse((json['following']??'0').toString());
    followStatus = json['followStatus'] as int?;
    reqestedOn = json['reqestedOn'] != null ? DateTime.tryParse(json['reqestedOn']) : null;
    acceptedOn = json['acceptedOn'] != null ? DateTime.tryParse(json['acceptedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Follower'] = BigInt.parse((follower??'0').toString());
    data['Following'] = BigInt.parse((following??'0').toString());
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
    refUser = BigInt.parse((json['refUser']??'0').toString());
    parentName = json['parentName'] as String?;
    parentSurname = json['parentSurname'] as String?;
    headlineText = json['headlineText'] as String?;
    isPublic = json['isPublic'] as int?;
    status = json['status'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
    approvedBy = BigInt.parse((json['approvedBy']??'0').toString());
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
    data['RefUser'] = BigInt.parse((refUser??'0').toString());
    data['ParentName'] = parentName;
    data['ParentSurname'] = parentSurname;
    data['HeadlineText'] = headlineText;
    data['IsPublic'] = isPublic;
    data['Status'] = status;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    data['ApprovedBy'] = BigInt.parse((approvedBy??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    loginDatetime = json['loginDatetime'] != null ? DateTime.tryParse(json['loginDatetime']) : null;
    loginIp = json['loginIp'] as String?;
    loginPort = json['loginPort'] as String?;
    logoffDatetime = json['logoffDatetime'] != null ? DateTime.tryParse(json['logoffDatetime']) : null;
    isSuccesfull = json['isSuccesfull'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['LoginDatetime'] = loginDatetime != null ? loginDatetime!.toIso8601String() : null;
    data['LoginIp'] = loginIp;
    data['LoginPort'] = loginPort;
    data['LogoffDatetime'] = logoffDatetime != null ? logoffDatetime!.toIso8601String() : null;
    data['IsSuccesfull'] = isSuccesfull;
    return data;
  }
}

class TblUserSubuser {
  BigInt id =BigInt.parse('0');
  BigInt? mainUserId ;
  BigInt? subUserId ;
  int? isActive ;
  int? isApproved ;
  BigInt? createdBy ;
  DateTime? createdOn ;
  BigInt? updatedBy ;
  DateTime? updatedOn ;
  BigInt? approvedBy ;
  DateTime? approvedOn ;

  TblUserSubuser({
    required  this.id,
    this.mainUserId,
    this.subUserId,
    this.isActive,
    this.isApproved,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
    this.approvedBy,
    this.approvedOn,
  });

  TblUserSubuser.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    mainUserId = BigInt.parse((json['mainUserId']??'0').toString());
    subUserId = BigInt.parse((json['subUserId']??'0').toString());
    isActive = json['isActive'] as int?;
    isApproved = json['isApproved'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
    approvedBy = BigInt.parse((json['approvedBy']??'0').toString());
    approvedOn = json['approvedOn'] != null ? DateTime.tryParse(json['approvedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['MainUserId'] = BigInt.parse((mainUserId??'0').toString());
    data['SubUserId'] = BigInt.parse((subUserId??'0').toString());
    data['IsActive'] = isActive;
    data['IsApproved'] = isApproved;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    data['ApprovedBy'] = BigInt.parse((approvedBy??'0').toString());
    data['ApprovedOn'] = approvedOn != null ? approvedOn!.toIso8601String() : null;
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
    videoId = BigInt.parse((json['videoId']??'0').toString());
    achvId = json['achvId'] as int?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['VideoId'] = BigInt.parse((videoId??'0').toString());
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
    videoId = BigInt.parse((json['videoId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    likeType = json['likeType'] as int?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['VideoId'] = BigInt.parse((videoId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
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
    userId = BigInt.parse((json['userId']??'0').toString());
    gradeId = json['gradeId'] as int?;
    learnId = json['learnId'] as int?;
    relationId = json['relationId'] as String?;
    title = json['title'] as String?;
    description = json['description'] as String?;
    videoPath = json['videoPath'] as String?;
    videoData = json['videoData'] as List<int>?;
    isPublic = json['isPublic'] as int?;
    status = json['status'] as int?;
    createdBy = BigInt.parse((json['createdBy']??'0').toString());
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    updatedBy = BigInt.parse((json['updatedBy']??'0').toString());
    updatedOn = json['updatedOn'] != null ? DateTime.tryParse(json['updatedOn']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['AcademicYear'] = academicYear;
    data['LocationId'] = locationId;
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['GradeId'] = gradeId;
    data['LearnId'] = learnId;
    data['RelationId'] = relationId;
    data['Title'] = title;
    data['Description'] = description;
    data['VideoPath'] = videoPath;
    data['VideoData'] = videoData;
    data['IsPublic'] = isPublic;
    data['Status'] = status;
    data['CreatedBy'] = BigInt.parse((createdBy??'0').toString());
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['UpdatedBy'] = BigInt.parse((updatedBy??'0').toString());
    data['UpdatedOn'] = updatedOn != null ? updatedOn!.toIso8601String() : null;
    return data;
  }
}

class TblVidVideoRate {
  BigInt id =BigInt.parse('0');
  BigInt? videoId ;
  BigInt? userId ;
  int? rating ;
  String? userComment ;
  DateTime? createdOn ;
  int? isActive ;

  TblVidVideoRate({
    required  this.id,
    this.videoId,
    this.userId,
    this.rating,
    this.userComment,
    this.createdOn,
    this.isActive,
  });

  TblVidVideoRate.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    videoId = BigInt.parse((json['videoId']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    rating = json['rating'] as int?;
    userComment = json['userComment'] as String?;
    createdOn = json['createdOn'] != null ? DateTime.tryParse(json['createdOn']) : null;
    isActive = json['isActive'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['VideoId'] = BigInt.parse((videoId??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['Rating'] = rating;
    data['UserComment'] = userComment;
    data['CreatedOn'] = createdOn != null ? createdOn!.toIso8601String() : null;
    data['IsActive'] = isActive;
    return data;
  }
}

class ViewCrsStuAchGap {
  BigInt id =BigInt.parse('0');
  BigInt? userId ;
  int? achvId ;

  ViewCrsStuAchGap({
    required  this.id,
    this.userId,
    this.achvId,
  });

  ViewCrsStuAchGap.fromJson(Map<String, dynamic> json) {
    id = BigInt.parse((json['id']??'0').toString());
    userId = BigInt.parse((json['userId']??'0').toString());
    achvId = json['achvId'] as int?;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = BigInt.parse((id??'0').toString());
    data['UserId'] = BigInt.parse((userId??'0').toString());
    data['AchvId'] = achvId;
    return data;
  }
}

