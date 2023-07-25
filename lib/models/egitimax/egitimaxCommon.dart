
import 'package:egitimax/models/egitimax/egitimaxEntities.dart';

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