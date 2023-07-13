class TblUserMainWithAccessRights {
  TblUserMain? tblUserMain;
  List<TblPermPermissionMain>? tblPermPermissionMains;
  List<TblPermRolePermMap>? tblPermRolePermMaps;
  List<TblPermUserRole>? tblPermUserRoles;
  List<TblPermUserRoleMap>? tblPermUserRoleMaps;

  TblUserMainWithAccessRights({
    this.tblUserMain,
    this.tblPermPermissionMains,
    this.tblPermRolePermMaps,
    this.tblPermUserRoles,
    this.tblPermUserRoleMaps,
  });

  TblUserMainWithAccessRights.fromJson(Map<String, dynamic> json) {
    tblUserMain = json['TblUserMain'] != null
        ? TblUserMain.fromJson(json['TblUserMain'])
        : null;
    if (json['TblPermPermissionMains'] != null) {
      tblPermPermissionMains = <TblPermPermissionMain>[];
      json['TblPermPermissionMains'].forEach((v) {
        tblPermPermissionMains!.add(TblPermPermissionMain.fromJson(v));
      });
    }
    if (json['TblPermRolePermMaps'] != null) {
      tblPermRolePermMaps = <TblPermRolePermMap>[];
      json['TblPermRolePermMaps'].forEach((v) {
        tblPermRolePermMaps!.add(TblPermRolePermMap.fromJson(v));
      });
    }
    if (json['TblPermUserRoles'] != null) {
      tblPermUserRoles = <TblPermUserRole>[];
      json['TblPermUserRoles'].forEach((v) {
        tblPermUserRoles!.add(TblPermUserRole.fromJson(v));
      });
    }
    if (json['TblPermUserRoleMaps'] != null) {
      tblPermUserRoleMaps = <TblPermUserRoleMap>[];
      json['TblPermUserRoleMaps'].forEach((v) {
        tblPermUserRoleMaps!.add(TblPermUserRoleMap.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tblUserMain != null) {
      data['TblUserMain'] = tblUserMain!.toMap();
    }
    if (tblPermPermissionMains != null) {
      data['TblPermPermissionMains'] =
          tblPermPermissionMains!.map((v) => v.toMap()).toList();
    }
    if (tblPermRolePermMaps != null) {
      data['TblPermRolePermMaps'] =
          tblPermRolePermMaps!.map((v) => v.toMap()).toList();
    }
    if (tblPermUserRoles != null) {
      data['TblPermUserRoles'] = tblPermUserRoles!.map((v) => v.toMap()).toList();
    }
    if (tblPermUserRoleMaps != null) {
      data['TblPermUserRoleMaps'] =
          tblPermUserRoleMaps!.map((v) => v.toMap()).toList();
    }
    return data;
  }
}
class TblUserMain {
  late int id;
  int? userType;
  String? userName;
  String? userPassword;
  String? tcId;
  int? schId;
  int? gradeId;
  String? name;
  String? surname;
  String? email;
  String? mobile;
  String? profilePhotoPath;
  String? fbuserid;
  int? countryId;
  int? stateId;
  int? cityId;
  String? sloganText;
  int? isActive;
  int? isPublic;
  int? createdBy;
  DateTime? createdOn;
  int? updatedBy;
  DateTime? updatedOn;

  TblUserMain({
    required this.id,
    this.userType,
    this.userName,
    this.userPassword,
    this.tcId,
    this.schId,
    this.gradeId,
    this.name,
    this.surname,
    this.email,
    this.mobile,
    this.profilePhotoPath,
    this.fbuserid,
    this.countryId,
    this.stateId,
    this.cityId,
    this.sloganText,
    this.isActive,
    this.isPublic,
    this.createdBy,
    this.createdOn,
    this.updatedBy,
    this.updatedOn,
  });

  TblUserMain.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userType = json['UserType'];
    userName = json['UserName'];
    userPassword = json['UserPassword'];
    tcId = json['TcId'];
    schId = json['SchId'];
    gradeId = json['GradeId'];
    name = json['Name'];
    surname = json['Surname'];
    email = json['Email'];
    mobile = json['Mobile'];
    profilePhotoPath = json['ProfilePhotoPath'];
    fbuserid = json['Fbuserid'];
    countryId = json['CountryId'];
    stateId = json['StateId'];
    cityId = json['CityId'];
    sloganText = json['SloganText'];
    isActive = json['IsActive'];
    isPublic = json['IsPublic'];
    createdBy = json['CreatedBy'];
    createdOn = DateTime.tryParse(json['CreatedOn']);
    updatedBy = json['UpdatedBy'];
    updatedOn = DateTime.tryParse(json['UpdatedOn']);
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserType'] = userType;
    data['UserName'] = userName;
    data['UserPassword'] = userPassword;
    data['TcId'] = tcId;
    data['SchId'] = schId;
    data['GradeId'] = gradeId;
    data['Name'] = name;
    data['Surname'] = surname;
    data['Email'] = email;
    data['Mobile'] = mobile;
    data['ProfilePhotoPath'] = profilePhotoPath;
    data['Fbuserid'] = fbuserid;
    data['CountryId'] = countryId;
    data['StateId'] = stateId;
    data['CityId'] = cityId;
    data['SloganText'] = sloganText;
    data['IsActive'] = isActive;
    data['IsPublic'] = isPublic;
    data['CreatedBy'] = createdBy;
    data['CreatedOn'] = createdOn?.toIso8601String();
    data['UpdatedBy'] = updatedBy;
    data['UpdatedOn'] = updatedOn?.toIso8601String();
    return data;
  }
}
class TblPermUserRole {
  late int id;
  String? roleName;
  int? isActive;

  TblPermUserRole({
    required this.id,
    this.roleName,
    this.isActive,
  });

  TblPermUserRole.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    roleName = json['RoleName'];
    isActive = json['IsActive'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['RoleName'] = roleName;
    data['IsActive'] = isActive;
    return data;
  }
}
class TblPermUserRoleMap {
  late int id;
  int? userId;
  int? roleId;
  int? isActive;

  TblPermUserRoleMap({
    required this.id,
    this.userId,
    this.roleId,
    this.isActive,
  });

  TblPermUserRoleMap.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['UserId'];
    roleId = json['RoleId'];
    isActive = json['IsActive'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['UserId'] = userId;
    data['RoleId'] = roleId;
    data['IsActive'] = isActive;
    return data;
  }
}
class TblPermPermissionMain {
  late int id;
  String? permissionName;
  int? isActive;

  TblPermPermissionMain({
    required this.id,
    this.permissionName,
    this.isActive,
  });

  TblPermPermissionMain.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    permissionName = json['PermissionName'];
    isActive = json['IsActive'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['PermissionName'] = permissionName;
    data['IsActive'] = isActive;
    return data;
  }
}
class TblPermRolePermMap {
  late int id;
  int? roleId;
  int? permissionId;
  int? isActive;

  TblPermRolePermMap({
    required this.id,
    this.roleId,
    this.permissionId,
    this.isActive,
  });

  TblPermRolePermMap.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    roleId = json['RoleId'];
    permissionId = json['PermissionId'];
    isActive = json['IsActive'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['RoleId'] = roleId;
    data['PermissionId'] = permissionId;
    data['IsActive'] = isActive;
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