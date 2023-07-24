import 'package:egitimax/models/egitimax/egitimaxEntities.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:egitimax/utils/helper/api.dart';
import 'package:flutter/material.dart';

class AppRepository {


  ///USER
  Future<User> getUser(String email,int id) async {
    var jsonDecode=await Api.request('TblUserMain/GetUser?email=$email&id=$id',method: HttpMethod.get);
    User result = User.fromJson(jsonDecode);
    return result;
  }

  Future<List<TblUserMain>> getAllTblUserMain() async {

    var jsonDecode=await Api.request('TblUserMain/GetAll',method: HttpMethod.get);
    List<TblUserMain> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblUserMain.fromJson(jsonItem));
    }
    return result;
  }
  Future<TblUserMain> getTblUserMain(BigInt id) async {
    var jsonDecode=await Api.request('TblUserMain/Get/$id',method: HttpMethod.get);
    TblUserMain result = TblUserMain.fromJson(jsonDecode);
    return result;
  }
  Future<TblUserMain> insertTblUserMain(TblUserMain tblUserMain) async {
    var jsonDecode=await Api.request('TblUserMain/Insert',method: HttpMethod.post,data: tblUserMain.toMap());
    TblUserMain result = TblUserMain.fromJson(jsonDecode);
    return result;
  }
  Future<TblUserMain> updateTblUserMain(TblUserMain tblUserMain) async {
    var jsonDecode=await Api.request('TblUserMain/Update',method: HttpMethod.put,data: tblUserMain.toMap());
    TblUserMain result = TblUserMain.fromJson(jsonDecode);
    return result;
  }
  Future<TblUserMain> deleteTblUserMain(BigInt id) async {
    var jsonDecode=await Api.request('TblUserMain/Delete/$id',method: HttpMethod.delete);
    TblUserMain result = TblUserMain.fromJson(jsonDecode);
    return result;
  }

  Future<List<TblPermPermissionMain>> getAllTblPermPermissionMain() async {

    var jsonDecode=await Api.request('TblPermPermissionMain/GetAll',method: HttpMethod.get);
    List<TblPermPermissionMain> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblPermPermissionMain.fromJson(jsonItem));
    }
    return result;
  }
  Future<TblPermPermissionMain> getTblPermPermissionMain(int id) async {
    var jsonDecode=await Api.request('TblPermPermissionMain/Get/$id',method: HttpMethod.get);
    TblPermPermissionMain result = TblPermPermissionMain.fromJson(jsonDecode);
    return result;
  }
  Future<TblPermPermissionMain> insertTblPermPermissionMain(TblPermPermissionMain tblPermPermissionMain) async {
    var jsonDecode=await Api.request('TblPermPermissionMain/Insert',method: HttpMethod.post,data: tblPermPermissionMain.toMap());
    TblPermPermissionMain result = TblPermPermissionMain.fromJson(jsonDecode);
    return result;
  }
  Future<TblPermPermissionMain> updateTblPermPermissionMain(TblPermPermissionMain tblPermPermissionMain) async {
    var jsonDecode=await Api.request('TblPermPermissionMain/Update',method: HttpMethod.put,data: tblPermPermissionMain.toMap());
    TblPermPermissionMain result = TblPermPermissionMain.fromJson(jsonDecode);
    return result;
  }
  Future<TblPermPermissionMain> deleteTblPermPermissionMain(int id) async {
    var jsonDecode=await Api.request('TblPermPermissionMain/Delete/$id',method: HttpMethod.delete);
    TblPermPermissionMain result = TblPermPermissionMain.fromJson(jsonDecode);
    return result;
  }

  Future<List<TblPermRolePermMap>> getAllTblPermRolePermMap() async {

    var jsonDecode=await Api.request('TblPermRolePermMap/GetAll',method: HttpMethod.get);
    List<TblPermRolePermMap> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblPermRolePermMap.fromJson(jsonItem));
    }
    return result;
  }
  Future<TblPermRolePermMap> getTblPermRolePermMap(int id) async {
    var jsonDecode=await Api.request('TblPermRolePermMap/Get/$id',method: HttpMethod.get);
    TblPermRolePermMap result = TblPermRolePermMap.fromJson(jsonDecode);
    return result;
  }
  Future<TblPermRolePermMap> insertTblPermRolePermMap(TblPermRolePermMap tblPermRolePermMap) async {
    var jsonDecode=await Api.request('TblPermRolePermMap/Insert',method: HttpMethod.post,data: tblPermRolePermMap.toMap());
    TblPermRolePermMap result = TblPermRolePermMap.fromJson(jsonDecode);
    return result;
  }
  Future<TblPermRolePermMap> updateTblPermRolePermMap(TblPermRolePermMap tblPermRolePermMap) async {
    var jsonDecode=await Api.request('TblPermRolePermMap/Update',method: HttpMethod.put,data: tblPermRolePermMap.toMap());
    TblPermRolePermMap result = TblPermRolePermMap.fromJson(jsonDecode);
    return result;
  }
  Future<TblPermRolePermMap> deleteTblPermRolePermMap(int id) async {
    var jsonDecode=await Api.request('TblPermRolePermMap/Delete/$id',method: HttpMethod.delete);
    TblPermRolePermMap result = TblPermRolePermMap.fromJson(jsonDecode);
    return result;
  }

  Future<List<TblPermUserRole>> getAllTblPermUserRole() async {

    var jsonDecode=await Api.request('TblPermUserRole/GetAll',method: HttpMethod.get);
    List<TblPermUserRole> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblPermUserRole.fromJson(jsonItem));
    }
    return result;
  }
  Future<TblPermUserRole> getTblPermUserRole(int id) async {
    var jsonDecode=await Api.request('TblPermUserRole/Get/$id',method: HttpMethod.get);
    TblPermUserRole result = TblPermUserRole.fromJson(jsonDecode);
    return result;
  }
  Future<TblPermUserRole> insertTblPermUserRole(TblPermUserRole tblPermUserRole) async {
    var jsonDecode=await Api.request('TblPermUserRole/Insert',method: HttpMethod.post,data: tblPermUserRole.toMap());
    TblPermUserRole result = TblPermUserRole.fromJson(jsonDecode);
    return result;
  }
  Future<TblPermUserRole> updateTblPermUserRole(TblPermUserRole tblPermUserRole) async {
    var jsonDecode=await Api.request('TblPermUserRole/Update',method: HttpMethod.put,data: tblPermUserRole.toMap());
    TblPermUserRole result = TblPermUserRole.fromJson(jsonDecode);
    return result;
  }
  Future<TblPermUserRole> deleteTblPermUserRole(int id) async {
    var jsonDecode=await Api.request('TblPermUserRole/Delete/$id',method: HttpMethod.delete);
    TblPermUserRole result = TblPermUserRole.fromJson(jsonDecode);
    return result;
  }

  Future<List<TblPermUserRoleMap>> getAllTblPermUserRoleMap() async {

    var jsonDecode=await Api.request('TblPermUserRoleMap/GetAll',method: HttpMethod.get);
    List<TblPermUserRoleMap> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblPermUserRoleMap.fromJson(jsonItem));
    }
    return result;
  }
  Future<TblPermUserRoleMap> getTblPermUserRoleMap(int id) async {
    var jsonDecode=await Api.request('TblPermUserRoleMap/Get/$id',method: HttpMethod.get);
    TblPermUserRoleMap result = TblPermUserRoleMap.fromJson(jsonDecode);
    return result;
  }
  Future<TblPermUserRoleMap> insertTblPermUserRoleMap(TblPermUserRoleMap tblPermUserRoleMap) async {
    var jsonDecode=await Api.request('TblPermUserRoleMap/Insert',method: HttpMethod.post,data: tblPermUserRoleMap.toMap());
    TblPermUserRoleMap result = TblPermUserRoleMap.fromJson(jsonDecode);
    return result;
  }
  Future<TblPermUserRoleMap> updateTblPermUserRoleMap(TblPermUserRoleMap tblPermUserRoleMap) async {
    var jsonDecode=await Api.request('TblPermUserRoleMap/Update',method: HttpMethod.put,data: tblPermUserRoleMap.toMap());
    TblPermUserRoleMap result = TblPermUserRoleMap.fromJson(jsonDecode);
    return result;
  }
  Future<TblPermUserRoleMap> deleteTblPermUserRoleMap(int id) async {
    var jsonDecode=await Api.request('TblPermUserRoleMap/Delete/$id',method: HttpMethod.delete);
    TblPermUserRoleMap result = TblPermUserRoleMap.fromJson(jsonDecode);
    return result;
  }

  ///QESTION
  Future<Question> getQuestion(BigInt id, String connectionId, BigInt userId) async {
    var jsonDecode=await Api.request('TblQueQuestionMain/GetQuestion?id=$id&connectionId=$connectionId&userId=$userId',method: HttpMethod.get);
    Question result = Question.fromJson(jsonDecode);
    return result;
  }
  Future<Question> insertQuestion(Question question) async {
    var jsonDecode=await Api.request('TblQueQuestionMain/InsertQuestion',method: HttpMethod.post,data: question.toMap());
    Question result = Question.fromJson(jsonDecode);
    return result;
  }
  Future<Question> updateQuestion(Question question) async {
    var jsonDecode=await Api.request('TblQueQuestionMain/UpdateQuestion',method: HttpMethod.put,data: question.toMap());
    Question result = Question.fromJson(jsonDecode);
    return result;
  }
  Future<Question> deleteQuestion(BigInt id) async {
    var jsonDecode=await Api.request('TblQueQuestionMain/DeleteQuestion/$id',method: HttpMethod.delete);
    Question result = Question.fromJson(jsonDecode);
    return result;
  }

  Future<List<TblQueQuestionMain>> getAllTblQueQuestionMain() async {

    var jsonDecode=await Api.request('TblQueQuestionMain/GetAll',method: HttpMethod.get);
    List<TblQueQuestionMain> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblQueQuestionMain.fromJson(jsonItem));
    }
    return result;
  }
  Future<TblQueQuestionMain> getTblQueQuestionMain(BigInt id) async {
    var jsonDecode=await Api.request('TblQueQuestionMain/Get/$id',method: HttpMethod.get);
    TblQueQuestionMain result = TblQueQuestionMain.fromJson(jsonDecode);
    return result;
  }
  Future<TblQueQuestionMain> insertTblQueQuestionMain(TblQueQuestionMain tblQueQuestionMain) async {
    var jsonDecode=await Api.request('TblQueQuestionMain/Insert',method: HttpMethod.post,data: tblQueQuestionMain.toMap());
    TblQueQuestionMain result = TblQueQuestionMain.fromJson(jsonDecode);
    return result;
  }
  Future<TblQueQuestionMain> updateTblQueQuestionMain(TblQueQuestionMain tblQueQuestionMain) async {
    var jsonDecode=await Api.request('TblQueQuestionMain/Update',method: HttpMethod.put,data: tblQueQuestionMain.toMap());
    TblQueQuestionMain result = TblQueQuestionMain.fromJson(jsonDecode);
    return result;
  }
  Future<TblQueQuestionMain> deleteTblQueQuestionMain(BigInt id) async {
    var jsonDecode=await Api.request('TblQueQuestionMain/Delete/$id',method: HttpMethod.delete);
    TblQueQuestionMain result = TblQueQuestionMain.fromJson(jsonDecode);
    return result;
  }

  Future<List<TblQueQuestionOption>> getAllTblQueQuestionOption() async {

    var jsonDecode=await Api.request('TblQueQuestionOption/GetAll',method: HttpMethod.get);
    List<TblQueQuestionOption> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblQueQuestionOption.fromJson(jsonItem));
    }
    return result;
  }
  Future<TblQueQuestionOption> getTblQueQuestionOption(BigInt id) async {
    var jsonDecode=await Api.request('TblQueQuestionOption/Get/$id',method: HttpMethod.get);
    TblQueQuestionOption result = TblQueQuestionOption.fromJson(jsonDecode);
    return result;
  }
  Future<TblQueQuestionOption> insertTblQueQuestionOption(TblQueQuestionOption tblQueQuestionOption) async {
    var jsonDecode=await Api.request('TblQueQuestionOption/Insert',method: HttpMethod.post,data: tblQueQuestionOption.toMap());
    TblQueQuestionOption result = TblQueQuestionOption.fromJson(jsonDecode);
    return result;
  }
  Future<TblQueQuestionOption> updateTblQueQuestionOption(TblQueQuestionOption tblQueQuestionOption) async {
    var jsonDecode=await Api.request('TblQueQuestionOption/Update',method: HttpMethod.put,data: tblQueQuestionOption.toMap());
    TblQueQuestionOption result = TblQueQuestionOption.fromJson(jsonDecode);
    return result;
  }
  Future<TblQueQuestionOption> deleteTblQueQuestionOption(BigInt id) async {
    var jsonDecode=await Api.request('TblQueQuestionOption/Delete/$id',method: HttpMethod.delete);
    TblQueQuestionOption result = TblQueQuestionOption.fromJson(jsonDecode);
    return result;
  }

  Future<List<TblFavQuestion>> getAllTblFavQuestion() async {

    var jsonDecode=await Api.request('TblFavQuestion/GetAll',method: HttpMethod.get);
    List<TblFavQuestion> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblFavQuestion.fromJson(jsonItem));
    }
    return result;
  }
  Future<TblFavQuestion> getTblFavQuestion(BigInt id) async {
    var jsonDecode=await Api.request('TblFavQuestion/Get/$id',method: HttpMethod.get);
    TblFavQuestion result = TblFavQuestion.fromJson(jsonDecode);
    return result;
  }
  Future<TblFavQuestion> insertTblFavQuestion(TblFavQuestion tblFavQuestion) async {
    var jsonDecode=await Api.request('TblFavQuestion/Insert',method: HttpMethod.post,data: tblFavQuestion.toMap());
    TblFavQuestion result = TblFavQuestion.fromJson(jsonDecode);
    return result;
  }
  Future<TblFavQuestion> updateTblFavQuestion(TblFavQuestion tblFavQuestion) async {
    var jsonDecode=await Api.request('TblFavQuestion/Update',method: HttpMethod.put,data: tblFavQuestion.toMap());
    TblFavQuestion result = TblFavQuestion.fromJson(jsonDecode);
    return result;
  }
  Future<TblFavQuestion> deleteTblFavQuestion(BigInt id) async {
    var jsonDecode=await Api.request('TblFavQuestion/Delete/$id',method: HttpMethod.delete);
    TblFavQuestion result = TblFavQuestion.fromJson(jsonDecode);
    return result;
  }

  Future<List<TblFavGroupQuestMap>> getAllTblFavGroupQuestMap() async {

    var jsonDecode=await Api.request('TblFavGroupQuestMap/GetAll',method: HttpMethod.get);
    List<TblFavGroupQuestMap> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblFavGroupQuestMap.fromJson(jsonItem));
    }
    return result;
  }
  Future<TblFavGroupQuestMap> getTblFavGroupQuestMap(BigInt id) async {
    var jsonDecode=await Api.request('TblFavGroupQuestMap/Get/$id',method: HttpMethod.get);
    TblFavGroupQuestMap result = TblFavGroupQuestMap.fromJson(jsonDecode);
    return result;
  }
  Future<TblFavGroupQuestMap> insertTblFavGroupQuestMap(TblFavGroupQuestMap tblFavGroupQuestMap) async {
    var jsonDecode=await Api.request('TblFavGroupQuestMap/Insert',method: HttpMethod.post,data: tblFavGroupQuestMap.toMap());
    TblFavGroupQuestMap result = TblFavGroupQuestMap.fromJson(jsonDecode);
    return result;
  }
  Future<TblFavGroupQuestMap> updateTblFavGroupQuestMap(TblFavGroupQuestMap tblFavGroupQuestMap) async {
    var jsonDecode=await Api.request('TblFavGroupQuestMap/Update',method: HttpMethod.put,data: tblFavGroupQuestMap.toMap());
    TblFavGroupQuestMap result = TblFavGroupQuestMap.fromJson(jsonDecode);
    return result;
  }
  Future<TblFavGroupQuestMap> deleteTblFavGroupQuestMap(BigInt id) async {
    var jsonDecode=await Api.request('TblFavGroupQuestMap/Delete/$id',method: HttpMethod.delete);
    TblFavGroupQuestMap result = TblFavGroupQuestMap.fromJson(jsonDecode);
    return result;
  }

  Future<List<TblFavGroupQuest>> getAllTblFavGroupQuest() async {

    var jsonDecode=await Api.request('TblFavGroupQuest/GetAll',method: HttpMethod.get);
    List<TblFavGroupQuest> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblFavGroupQuest.fromJson(jsonItem));
    }
    return result;
  }
  Future<TblFavGroupQuest> getTblFavGroupQuest(BigInt id) async {
    var jsonDecode=await Api.request('TblFavGroupQuest/Get/$id',method: HttpMethod.get);
    TblFavGroupQuest result = TblFavGroupQuest.fromJson(jsonDecode);
    return result;
  }
  Future<TblFavGroupQuest> insertTblFavGroupQuest(TblFavGroupQuest tblFavGroupQuest) async {
    var jsonDecode=await Api.request('TblFavGroupQuest/Insert',method: HttpMethod.post,data: tblFavGroupQuest.toMap());
    TblFavGroupQuest result = TblFavGroupQuest.fromJson(jsonDecode);
    return result;
  }
  Future<TblFavGroupQuest> updateTblFavGroupQuest(TblFavGroupQuest tblFavGroupQuest) async {
    var jsonDecode=await Api.request('TblFavGroupQuest/Update',method: HttpMethod.put,data: tblFavGroupQuest.toMap());
    TblFavGroupQuest result = TblFavGroupQuest.fromJson(jsonDecode);
    return result;
  }
  Future<TblFavGroupQuest> deleteTblFavGroupQuest(BigInt id) async {
    var jsonDecode=await Api.request('TblFavGroupQuest/Delete/$id',method: HttpMethod.delete);
    TblFavGroupQuest result = TblFavGroupQuest.fromJson(jsonDecode);
    return result;
  }



  Future<List<WeatherForecast>> getWeather() async {

    var jsonDecodeResult=await Api.request('WeatherForecast/Get',method: HttpMethod.get);
    List<WeatherForecast> forecasts = [];
    for (var jsonItem in jsonDecodeResult) {
      forecasts.add(WeatherForecast.fromJson(jsonItem));
    }
    //await Future.delayed(const Duration(seconds: 5));
    return forecasts;
  }

}
extension AppRepositoryExtension on AppRepository {

}




