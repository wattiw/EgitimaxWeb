import 'package:egitimax/models/egitimax/egitimaxCommon.dart';
import 'package:egitimax/models/egitimax/egitimaxEntities.dart';
import 'package:egitimax/utils/helper/api.dart';

class AppRepository {
  ///TblFavGroupQuest

  Future<List<TblFavGroupQuest>> getAllTblFavGroupQuest() async {
    var jsonDecode =
        await Api.request('TblFavGroupQuest/GetAll', method: HttpMethod.get);
    List<TblFavGroupQuest> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblFavGroupQuest.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblFavGroupQuest> getTblFavGroupQuest(BigInt id) async {
    var jsonDecode =
        await Api.request('TblFavGroupQuest/Get/$id', method: HttpMethod.get);
    TblFavGroupQuest result = TblFavGroupQuest.fromJson(jsonDecode);
    return result;
  }

  Future<TblFavGroupQuest> insertTblFavGroupQuest(
      TblFavGroupQuest tblFavGroupQuest) async {
    var jsonDecode = await Api.request('TblFavGroupQuest/Insert',
        method: HttpMethod.post, data: tblFavGroupQuest.toMap());
    TblFavGroupQuest result = TblFavGroupQuest.fromJson(jsonDecode);
    return result;
  }

  Future<TblFavGroupQuest> updateTblFavGroupQuest(
      TblFavGroupQuest tblFavGroupQuest) async {
    var jsonDecode = await Api.request('TblFavGroupQuest/Update',
        method: HttpMethod.put, data: tblFavGroupQuest.toMap());
    TblFavGroupQuest result = TblFavGroupQuest.fromJson(jsonDecode);
    return result;
  }

  Future<TblFavGroupQuest> deleteTblFavGroupQuest(BigInt id) async {
    var jsonDecode = await Api.request('TblFavGroupQuest/Delete/$id',
        method: HttpMethod.delete);
    TblFavGroupQuest result = TblFavGroupQuest.fromJson(jsonDecode);
    return result;
  }

  ///TblFavGroupQuestMap

  Future<List<TblFavGroupQuestMap>> getAllTblFavGroupQuestMap() async {
    var jsonDecode =
        await Api.request('TblFavGroupQuestMap/GetAll', method: HttpMethod.get);
    List<TblFavGroupQuestMap> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblFavGroupQuestMap.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblFavGroupQuestMap> getTblFavGroupQuestMap(BigInt id) async {
    var jsonDecode = await Api.request('TblFavGroupQuestMap/Get/$id',
        method: HttpMethod.get);
    TblFavGroupQuestMap result = TblFavGroupQuestMap.fromJson(jsonDecode);
    return result;
  }

  Future<TblFavGroupQuestMap> insertTblFavGroupQuestMap(
      TblFavGroupQuestMap tblFavGroupQuestMap) async {
    var jsonDecode = await Api.request('TblFavGroupQuestMap/Insert',
        method: HttpMethod.post, data: tblFavGroupQuestMap.toMap());
    TblFavGroupQuestMap result = TblFavGroupQuestMap.fromJson(jsonDecode);
    return result;
  }

  Future<TblFavGroupQuestMap> updateTblFavGroupQuestMap(
      TblFavGroupQuestMap tblFavGroupQuestMap) async {
    var jsonDecode = await Api.request('TblFavGroupQuestMap/Update',
        method: HttpMethod.put, data: tblFavGroupQuestMap.toMap());
    TblFavGroupQuestMap result = TblFavGroupQuestMap.fromJson(jsonDecode);
    return result;
  }

  Future<TblFavGroupQuestMap> deleteTblFavGroupQuestMap(BigInt id) async {
    var jsonDecode = await Api.request('TblFavGroupQuestMap/Delete/$id',
        method: HttpMethod.delete);
    TblFavGroupQuestMap result = TblFavGroupQuestMap.fromJson(jsonDecode);
    return result;
  }

  ///TblFavQuestion

  Future<List<TblFavQuestion>> getAllTblFavQuestion() async {
    var jsonDecode =
        await Api.request('TblFavQuestion/GetAll', method: HttpMethod.get);
    List<TblFavQuestion> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblFavQuestion.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblFavQuestion> getTblFavQuestion(BigInt id) async {
    var jsonDecode =
        await Api.request('TblFavQuestion/Get/$id', method: HttpMethod.get);
    TblFavQuestion result = TblFavQuestion.fromJson(jsonDecode);
    return result;
  }

  Future<TblFavQuestion> insertTblFavQuestion(
      TblFavQuestion tblFavQuestion) async {
    var jsonDecode = await Api.request('TblFavQuestion/Insert',
        method: HttpMethod.post, data: tblFavQuestion.toMap());
    TblFavQuestion result = TblFavQuestion.fromJson(jsonDecode);
    return result;
  }

  Future<TblFavQuestion> updateTblFavQuestion(
      TblFavQuestion tblFavQuestion) async {
    var jsonDecode = await Api.request('TblFavQuestion/Update',
        method: HttpMethod.put, data: tblFavQuestion.toMap());
    TblFavQuestion result = TblFavQuestion.fromJson(jsonDecode);
    return result;
  }

  Future<TblFavQuestion> deleteTblFavQuestion(BigInt id) async {
    var jsonDecode = await Api.request('TblFavQuestion/Delete/$id',
        method: HttpMethod.delete);
    TblFavQuestion result = TblFavQuestion.fromJson(jsonDecode);
    return result;
  }

  ///TblLearnMain

  Future<List<TblLearnMain>> getAllTblLearnMain() async {
    var jsonDecode =
        await Api.request('TblLearnMain/GetAll', method: HttpMethod.get);
    List<TblLearnMain> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblLearnMain.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblLearnMain> getTblLearnMain(int id) async {
    var jsonDecode =
        await Api.request('TblLearnMain/Get/$id', method: HttpMethod.get);
    TblLearnMain result = TblLearnMain.fromJson(jsonDecode);
    return result;
  }

  Future<TblLearnMain> insertTblLearnMain(TblLearnMain tblLearnMain) async {
    var jsonDecode = await Api.request('TblLearnMain/Insert',
        method: HttpMethod.post, data: tblLearnMain.toMap());
    TblLearnMain result = TblLearnMain.fromJson(jsonDecode);
    return result;
  }

  Future<TblLearnMain> updateTblLearnMain(TblLearnMain tblLearnMain) async {
    var jsonDecode = await Api.request('TblLearnMain/Update',
        method: HttpMethod.put, data: tblLearnMain.toMap());
    TblLearnMain result = TblLearnMain.fromJson(jsonDecode);
    return result;
  }

  Future<TblLearnMain> deleteTblLearnMain(int id) async {
    var jsonDecode =
        await Api.request('TblLearnMain/Delete/$id', method: HttpMethod.delete);
    TblLearnMain result = TblLearnMain.fromJson(jsonDecode);
    return result;
  }

  ///TblPermPermissionMain

  Future<List<TblPermPermissionMain>> getAllTblPermPermissionMain() async {
    var jsonDecode = await Api.request('TblPermPermissionMain/GetAll',
        method: HttpMethod.get);
    List<TblPermPermissionMain> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblPermPermissionMain.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblPermPermissionMain> getTblPermPermissionMain(int id) async {
    var jsonDecode = await Api.request('TblPermPermissionMain/Get/$id',
        method: HttpMethod.get);
    TblPermPermissionMain result = TblPermPermissionMain.fromJson(jsonDecode);
    return result;
  }

  Future<TblPermPermissionMain> insertTblPermPermissionMain(
      TblPermPermissionMain tblPermPermissionMain) async {
    var jsonDecode = await Api.request('TblPermPermissionMain/Insert',
        method: HttpMethod.post, data: tblPermPermissionMain.toMap());
    TblPermPermissionMain result = TblPermPermissionMain.fromJson(jsonDecode);
    return result;
  }

  Future<TblPermPermissionMain> updateTblPermPermissionMain(
      TblPermPermissionMain tblPermPermissionMain) async {
    var jsonDecode = await Api.request('TblPermPermissionMain/Update',
        method: HttpMethod.put, data: tblPermPermissionMain.toMap());
    TblPermPermissionMain result = TblPermPermissionMain.fromJson(jsonDecode);
    return result;
  }

  Future<TblPermPermissionMain> deleteTblPermPermissionMain(int id) async {
    var jsonDecode = await Api.request('TblPermPermissionMain/Delete/$id',
        method: HttpMethod.delete);
    TblPermPermissionMain result = TblPermPermissionMain.fromJson(jsonDecode);
    return result;
  }

  ///TblPermRolePermMap

  Future<List<TblPermRolePermMap>> getAllTblPermRolePermMap() async {
    var jsonDecode =
        await Api.request('TblPermRolePermMap/GetAll', method: HttpMethod.get);
    List<TblPermRolePermMap> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblPermRolePermMap.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblPermRolePermMap> getTblPermRolePermMap(int id) async {
    var jsonDecode =
        await Api.request('TblPermRolePermMap/Get/$id', method: HttpMethod.get);
    TblPermRolePermMap result = TblPermRolePermMap.fromJson(jsonDecode);
    return result;
  }

  Future<TblPermRolePermMap> insertTblPermRolePermMap(
      TblPermRolePermMap tblPermRolePermMap) async {
    var jsonDecode = await Api.request('TblPermRolePermMap/Insert',
        method: HttpMethod.post, data: tblPermRolePermMap.toMap());
    TblPermRolePermMap result = TblPermRolePermMap.fromJson(jsonDecode);
    return result;
  }

  Future<TblPermRolePermMap> updateTblPermRolePermMap(
      TblPermRolePermMap tblPermRolePermMap) async {
    var jsonDecode = await Api.request('TblPermRolePermMap/Update',
        method: HttpMethod.put, data: tblPermRolePermMap.toMap());
    TblPermRolePermMap result = TblPermRolePermMap.fromJson(jsonDecode);
    return result;
  }

  Future<TblPermRolePermMap> deleteTblPermRolePermMap(int id) async {
    var jsonDecode = await Api.request('TblPermRolePermMap/Delete/$id',
        method: HttpMethod.delete);
    TblPermRolePermMap result = TblPermRolePermMap.fromJson(jsonDecode);
    return result;
  }

  ///TblPermUserRole

  Future<List<TblPermUserRole>> getAllTblPermUserRole() async {
    var jsonDecode =
        await Api.request('TblPermUserRole/GetAll', method: HttpMethod.get);
    List<TblPermUserRole> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblPermUserRole.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblPermUserRole> getTblPermUserRole(int id) async {
    var jsonDecode =
        await Api.request('TblPermUserRole/Get/$id', method: HttpMethod.get);
    TblPermUserRole result = TblPermUserRole.fromJson(jsonDecode);
    return result;
  }

  Future<TblPermUserRole> insertTblPermUserRole(
      TblPermUserRole tblPermUserRole) async {
    var jsonDecode = await Api.request('TblPermUserRole/Insert',
        method: HttpMethod.post, data: tblPermUserRole.toMap());
    TblPermUserRole result = TblPermUserRole.fromJson(jsonDecode);
    return result;
  }

  Future<TblPermUserRole> updateTblPermUserRole(
      TblPermUserRole tblPermUserRole) async {
    var jsonDecode = await Api.request('TblPermUserRole/Update',
        method: HttpMethod.put, data: tblPermUserRole.toMap());
    TblPermUserRole result = TblPermUserRole.fromJson(jsonDecode);
    return result;
  }

  Future<TblPermUserRole> deleteTblPermUserRole(int id) async {
    var jsonDecode = await Api.request('TblPermUserRole/Delete/$id',
        method: HttpMethod.delete);
    TblPermUserRole result = TblPermUserRole.fromJson(jsonDecode);
    return result;
  }

  ///TblPermUserRoleMap

  Future<List<TblPermUserRoleMap>> getAllTblPermUserRoleMap() async {
    var jsonDecode =
        await Api.request('TblPermUserRoleMap/GetAll', method: HttpMethod.get);
    List<TblPermUserRoleMap> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblPermUserRoleMap.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblPermUserRoleMap> getTblPermUserRoleMap(int id) async {
    var jsonDecode =
        await Api.request('TblPermUserRoleMap/Get/$id', method: HttpMethod.get);
    TblPermUserRoleMap result = TblPermUserRoleMap.fromJson(jsonDecode);
    return result;
  }

  Future<TblPermUserRoleMap> insertTblPermUserRoleMap(
      TblPermUserRoleMap tblPermUserRoleMap) async {
    var jsonDecode = await Api.request('TblPermUserRoleMap/Insert',
        method: HttpMethod.post, data: tblPermUserRoleMap.toMap());
    TblPermUserRoleMap result = TblPermUserRoleMap.fromJson(jsonDecode);
    return result;
  }

  Future<TblPermUserRoleMap> updateTblPermUserRoleMap(
      TblPermUserRoleMap tblPermUserRoleMap) async {
    var jsonDecode = await Api.request('TblPermUserRoleMap/Update',
        method: HttpMethod.put, data: tblPermUserRoleMap.toMap());
    TblPermUserRoleMap result = TblPermUserRoleMap.fromJson(jsonDecode);
    return result;
  }

  Future<TblPermUserRoleMap> deleteTblPermUserRoleMap(int id) async {
    var jsonDecode = await Api.request('TblPermUserRoleMap/Delete/$id',
        method: HttpMethod.delete);
    TblPermUserRoleMap result = TblPermUserRoleMap.fromJson(jsonDecode);
    return result;
  }

  ///TblQueQuestionAchvMap

  Future<List<TblQueQuestionAchvMap>> getAllTblQueQuestionAchvMap() async {
    var jsonDecode = await Api.request('TblQueQuestionAchvMap/GetAll',
        method: HttpMethod.get);
    List<TblQueQuestionAchvMap> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblQueQuestionAchvMap.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblQueQuestionAchvMap> getTblQueQuestionAchvMap(BigInt id) async {
    var jsonDecode = await Api.request('TblQueQuestionAchvMap/Get/$id',
        method: HttpMethod.get);
    TblQueQuestionAchvMap result = TblQueQuestionAchvMap.fromJson(jsonDecode);
    return result;
  }

  Future<TblQueQuestionAchvMap> insertTblQueQuestionAchvMap(
      TblQueQuestionAchvMap tblQueQuestionAchvMap) async {
    var jsonDecode = await Api.request('TblQueQuestionAchvMap/Insert',
        method: HttpMethod.post, data: tblQueQuestionAchvMap.toMap());
    TblQueQuestionAchvMap result = TblQueQuestionAchvMap.fromJson(jsonDecode);
    return result;
  }

  Future<TblQueQuestionAchvMap> updateTblQueQuestionAchvMap(
      TblQueQuestionAchvMap tblQueQuestionAchvMap) async {
    var jsonDecode = await Api.request('TblQueQuestionAchvMap/Update',
        method: HttpMethod.put, data: tblQueQuestionAchvMap.toMap());
    TblQueQuestionAchvMap result = TblQueQuestionAchvMap.fromJson(jsonDecode);
    return result;
  }

  Future<TblQueQuestionAchvMap> deleteTblQueQuestionAchvMap(BigInt id) async {
    var jsonDecode = await Api.request('TblQueQuestionAchvMap/Delete/$id',
        method: HttpMethod.delete);
    TblQueQuestionAchvMap result = TblQueQuestionAchvMap.fromJson(jsonDecode);
    return result;
  }

  ///TblQueQuestionLike

  Future<List<TblQueQuestionLike>> getAllTblQueQuestionLike() async {
    var jsonDecode =
        await Api.request('TblQueQuestionLike/GetAll', method: HttpMethod.get);
    List<TblQueQuestionLike> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblQueQuestionLike.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblQueQuestionLike> getTblQueQuestionLike(BigInt id) async {
    var jsonDecode =
        await Api.request('TblQueQuestionLike/Get/$id', method: HttpMethod.get);
    TblQueQuestionLike result = TblQueQuestionLike.fromJson(jsonDecode);
    return result;
  }

  Future<TblQueQuestionLike> insertTblQueQuestionLike(
      TblQueQuestionLike tblQueQuestionLike) async {
    var jsonDecode = await Api.request('TblQueQuestionLike/Insert',
        method: HttpMethod.post, data: tblQueQuestionLike.toMap());
    TblQueQuestionLike result = TblQueQuestionLike.fromJson(jsonDecode);
    return result;
  }

  Future<TblQueQuestionLike> updateTblQueQuestionLike(
      TblQueQuestionLike tblQueQuestionLike) async {
    var jsonDecode = await Api.request('TblQueQuestionLike/Update',
        method: HttpMethod.put, data: tblQueQuestionLike.toMap());
    TblQueQuestionLike result = TblQueQuestionLike.fromJson(jsonDecode);
    return result;
  }

  Future<TblQueQuestionLike> deleteTblQueQuestionLike(BigInt id) async {
    var jsonDecode = await Api.request('TblQueQuestionLike/Delete/$id',
        method: HttpMethod.delete);
    TblQueQuestionLike result = TblQueQuestionLike.fromJson(jsonDecode);
    return result;
  }

  ///TblQueQuestionMain

  Future<List<TblQueQuestionMain>> getAllTblQueQuestionMain() async {
    var jsonDecode =
        await Api.request('TblQueQuestionMain/GetAll', method: HttpMethod.get);
    List<TblQueQuestionMain> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblQueQuestionMain.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblQueQuestionMain> getTblQueQuestionMain(BigInt id) async {
    var jsonDecode =
        await Api.request('TblQueQuestionMain/Get/$id', method: HttpMethod.get);
    TblQueQuestionMain result = TblQueQuestionMain.fromJson(jsonDecode);
    return result;
  }

  Future<TblQueQuestionMain> insertTblQueQuestionMain(
      TblQueQuestionMain tblQueQuestionMain) async {
    var jsonDecode = await Api.request('TblQueQuestionMain/Insert',
        method: HttpMethod.post, data: tblQueQuestionMain.toMap());
    TblQueQuestionMain result = TblQueQuestionMain.fromJson(jsonDecode);
    return result;
  }

  Future<TblQueQuestionMain> updateTblQueQuestionMain(
      TblQueQuestionMain tblQueQuestionMain) async {
    var jsonDecode = await Api.request('TblQueQuestionMain/Update',
        method: HttpMethod.put, data: tblQueQuestionMain.toMap());
    TblQueQuestionMain result = TblQueQuestionMain.fromJson(jsonDecode);
    return result;
  }

  Future<TblQueQuestionMain> deleteTblQueQuestionMain(BigInt id) async {
    var jsonDecode = await Api.request('TblQueQuestionMain/Delete/$id',
        method: HttpMethod.delete);
    TblQueQuestionMain result = TblQueQuestionMain.fromJson(jsonDecode);
    return result;
  }

  ///TblQueQuestionOption

  Future<List<TblQueQuestionOption>> getAllTblQueQuestionOption() async {
    var jsonDecode = await Api.request('TblQueQuestionOption/GetAll',
        method: HttpMethod.get);
    List<TblQueQuestionOption> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblQueQuestionOption.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblQueQuestionOption> getTblQueQuestionOption(BigInt id) async {
    var jsonDecode = await Api.request('TblQueQuestionOption/Get/$id',
        method: HttpMethod.get);
    TblQueQuestionOption result = TblQueQuestionOption.fromJson(jsonDecode);
    return result;
  }

  Future<TblQueQuestionOption> insertTblQueQuestionOption(
      TblQueQuestionOption tblQueQuestionOption) async {
    var jsonDecode = await Api.request('TblQueQuestionOption/Insert',
        method: HttpMethod.post, data: tblQueQuestionOption.toMap());
    TblQueQuestionOption result = TblQueQuestionOption.fromJson(jsonDecode);
    return result;
  }

  Future<TblQueQuestionOption> updateTblQueQuestionOption(
      TblQueQuestionOption tblQueQuestionOption) async {
    var jsonDecode = await Api.request('TblQueQuestionOption/Update',
        method: HttpMethod.put, data: tblQueQuestionOption.toMap());
    TblQueQuestionOption result = TblQueQuestionOption.fromJson(jsonDecode);
    return result;
  }

  Future<TblQueQuestionOption> deleteTblQueQuestionOption(BigInt id) async {
    var jsonDecode = await Api.request('TblQueQuestionOption/Delete/$id',
        method: HttpMethod.delete);
    TblQueQuestionOption result = TblQueQuestionOption.fromJson(jsonDecode);
    return result;
  }

  ///TblUserMain

  Future<List<TblUserMain>> getAllTblUserMain() async {
    var jsonDecode =
        await Api.request('TblUserMain/GetAll', method: HttpMethod.get);
    List<TblUserMain> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblUserMain.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblUserMain> getTblUserMain(BigInt id) async {
    var jsonDecode =
        await Api.request('TblUserMain/Get/$id', method: HttpMethod.get);
    TblUserMain result = TblUserMain.fromJson(jsonDecode);
    return result;
  }

  Future<TblUserMain> insertTblUserMain(TblUserMain tblUserMain) async {
    var jsonDecode = await Api.request('TblUserMain/Insert',
        method: HttpMethod.post, data: tblUserMain.toMap());
    TblUserMain result = TblUserMain.fromJson(jsonDecode);
    return result;
  }

  Future<TblUserMain> updateTblUserMain(TblUserMain tblUserMain) async {
    var jsonDecode = await Api.request('TblUserMain/Update',
        method: HttpMethod.put, data: tblUserMain.toMap());
    TblUserMain result = TblUserMain.fromJson(jsonDecode);
    return result;
  }

  Future<TblUserMain> deleteTblUserMain(BigInt id) async {
    var jsonDecode =
        await Api.request('TblUserMain/Delete/$id', method: HttpMethod.delete);
    TblUserMain result = TblUserMain.fromJson(jsonDecode);
    return result;
  }

  ///TblUserType

  Future<List<TblUserType>> getAllTblUserType() async {
    var jsonDecode =
        await Api.request('TblUserType/GetAll', method: HttpMethod.get);
    List<TblUserType> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblUserType.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblUserType> getTblUserType(int id) async {
    var jsonDecode =
        await Api.request('TblUserType/Get/$id', method: HttpMethod.get);
    TblUserType result = TblUserType.fromJson(jsonDecode);
    return result;
  }

  Future<TblUserType> insertTblUserType(TblUserType tblUserType) async {
    var jsonDecode = await Api.request('TblUserType/Insert',
        method: HttpMethod.post, data: tblUserType.toMap());
    TblUserType result = TblUserType.fromJson(jsonDecode);
    return result;
  }

  Future<TblUserType> updateTblUserType(TblUserType tblUserType) async {
    var jsonDecode = await Api.request('TblUserType/Update',
        method: HttpMethod.put, data: tblUserType.toMap());
    TblUserType result = TblUserType.fromJson(jsonDecode);
    return result;
  }

  Future<TblUserType> deleteTblUserType(int id) async {
    var jsonDecode =
        await Api.request('TblUserType/Delete/$id', method: HttpMethod.delete);
    TblUserType result = TblUserType.fromJson(jsonDecode);
    return result;
  }

  ///TblUtilAcademicYear

  Future<List<TblUtilAcademicYear>> getAllTblUtilAcademicYear() async {
    var jsonDecode =
        await Api.request('TblUtilAcademicYear/GetAll', method: HttpMethod.get);
    List<TblUtilAcademicYear> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblUtilAcademicYear.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblUtilAcademicYear> getTblUtilAcademicYear(int id) async {
    var jsonDecode = await Api.request('TblUtilAcademicYear/Get/$id',
        method: HttpMethod.get);
    TblUtilAcademicYear result = TblUtilAcademicYear.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilAcademicYear> insertTblUtilAcademicYear(
      TblUtilAcademicYear tblUtilAcademicYear) async {
    var jsonDecode = await Api.request('TblUtilAcademicYear/Insert',
        method: HttpMethod.post, data: tblUtilAcademicYear.toMap());
    TblUtilAcademicYear result = TblUtilAcademicYear.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilAcademicYear> updateTblUtilAcademicYear(
      TblUtilAcademicYear tblUtilAcademicYear) async {
    var jsonDecode = await Api.request('TblUtilAcademicYear/Update',
        method: HttpMethod.put, data: tblUtilAcademicYear.toMap());
    TblUtilAcademicYear result = TblUtilAcademicYear.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilAcademicYear> deleteTblUtilAcademicYear(int id) async {
    var jsonDecode = await Api.request('TblUtilAcademicYear/Delete/$id',
        method: HttpMethod.delete);
    TblUtilAcademicYear result = TblUtilAcademicYear.fromJson(jsonDecode);
    return result;
  }

  ///TblUtilBranch

  Future<List<TblUtilBranch>> getAllTblUtilBranch() async {
    var jsonDecode =
        await Api.request('TblUtilBranch/GetAll', method: HttpMethod.get);
    List<TblUtilBranch> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblUtilBranch.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblUtilBranch> getTblUtilBranch(int id) async {
    var jsonDecode =
        await Api.request('TblUtilBranch/Get/$id', method: HttpMethod.get);
    TblUtilBranch result = TblUtilBranch.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilBranch> insertTblUtilBranch(TblUtilBranch tblUtilBranch) async {
    var jsonDecode = await Api.request('TblUtilBranch/Insert',
        method: HttpMethod.post, data: tblUtilBranch.toMap());
    TblUtilBranch result = TblUtilBranch.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilBranch> updateTblUtilBranch(TblUtilBranch tblUtilBranch) async {
    var jsonDecode = await Api.request('TblUtilBranch/Update',
        method: HttpMethod.put, data: tblUtilBranch.toMap());
    TblUtilBranch result = TblUtilBranch.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilBranch> deleteTblUtilBranch(int id) async {
    var jsonDecode = await Api.request('TblUtilBranch/Delete/$id',
        method: HttpMethod.delete);
    TblUtilBranch result = TblUtilBranch.fromJson(jsonDecode);
    return result;
  }

  Future<List<TblUtilBranch>> getByLocationIdTblUtilBranch(int locationId) async {
    var jsonDecode =
    await Api.request('TblUtilBranch/GetByLocationId/$locationId', method: HttpMethod.get);
    List<TblUtilBranch> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblUtilBranch.fromJson(jsonItem));
    }
    return result;
  }

  ///TblUtilDifficulty

  Future<List<TblUtilDifficulty>> getAllTblUtilDifficulty() async {
    var jsonDecode =
        await Api.request('TblUtilDifficulty/GetAll', method: HttpMethod.get);
    List<TblUtilDifficulty> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblUtilDifficulty.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblUtilDifficulty> getTblUtilDifficulty(int id) async {
    var jsonDecode =
        await Api.request('TblUtilDifficulty/Get/$id', method: HttpMethod.get);
    TblUtilDifficulty result = TblUtilDifficulty.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilDifficulty> insertTblUtilDifficulty(
      TblUtilDifficulty tblUtilDifficulty) async {
    var jsonDecode = await Api.request('TblUtilDifficulty/Insert',
        method: HttpMethod.post, data: tblUtilDifficulty.toMap());
    TblUtilDifficulty result = TblUtilDifficulty.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilDifficulty> updateTblUtilDifficulty(
      TblUtilDifficulty tblUtilDifficulty) async {
    var jsonDecode = await Api.request('TblUtilDifficulty/Update',
        method: HttpMethod.put, data: tblUtilDifficulty.toMap());
    TblUtilDifficulty result = TblUtilDifficulty.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilDifficulty> deleteTblUtilDifficulty(int id) async {
    var jsonDecode = await Api.request('TblUtilDifficulty/Delete/$id',
        method: HttpMethod.delete);
    TblUtilDifficulty result = TblUtilDifficulty.fromJson(jsonDecode);
    return result;
  }

  ///TblUtilGrade

  Future<List<TblUtilGrade>> getAllTblUtilGrade() async {
    var jsonDecode =
        await Api.request('TblUtilGrade/GetAll', method: HttpMethod.get);
    List<TblUtilGrade> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblUtilGrade.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblUtilGrade> getTblUtilGrade(int id) async {
    var jsonDecode =
        await Api.request('TblUtilGrade/Get/$id', method: HttpMethod.get);
    TblUtilGrade result = TblUtilGrade.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilGrade> insertTblUtilGrade(TblUtilGrade tblUtilGrade) async {
    var jsonDecode = await Api.request('TblUtilGrade/Insert',
        method: HttpMethod.post, data: tblUtilGrade.toMap());
    TblUtilGrade result = TblUtilGrade.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilGrade> updateTblUtilGrade(TblUtilGrade tblUtilGrade) async {
    var jsonDecode = await Api.request('TblUtilGrade/Update',
        method: HttpMethod.put, data: tblUtilGrade.toMap());
    TblUtilGrade result = TblUtilGrade.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilGrade> deleteTblUtilGrade(int id) async {
    var jsonDecode =
        await Api.request('TblUtilGrade/Delete/$id', method: HttpMethod.delete);
    TblUtilGrade result = TblUtilGrade.fromJson(jsonDecode);
    return result;
  }

  Future<List<TblUtilGrade>> getByLocationIdTblUtilGrade(int locationId) async {
    var jsonDecode =
    await Api.request('TblUtilGrade/GetByLocationId/$locationId', method: HttpMethod.get);
    List<TblUtilGrade> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblUtilGrade.fromJson(jsonItem));
    }
    return result;
  }

  ///TblUtilLocation

  Future<List<TblUtilLocation>> getAllTblUtilLocation() async {
    var jsonDecode =
        await Api.request('TblUtilLocation/GetAll', method: HttpMethod.get);
    List<TblUtilLocation> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblUtilLocation.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblUtilLocation> getTblUtilLocation(int id) async {
    var jsonDecode =
        await Api.request('TblUtilLocation/Get/$id', method: HttpMethod.get);
    TblUtilLocation result = TblUtilLocation.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilLocation> insertTblUtilLocation(
      TblUtilLocation tblUtilLocation) async {
    var jsonDecode = await Api.request('TblUtilLocation/Insert',
        method: HttpMethod.post, data: tblUtilLocation.toMap());
    TblUtilLocation result = TblUtilLocation.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilLocation> updateTblUtilLocation(
      TblUtilLocation tblUtilLocation) async {
    var jsonDecode = await Api.request('TblUtilLocation/Update',
        method: HttpMethod.put, data: tblUtilLocation.toMap());
    TblUtilLocation result = TblUtilLocation.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilLocation> deleteTblUtilLocation(int id) async {
    var jsonDecode = await Api.request('TblUtilLocation/Delete/$id',
        method: HttpMethod.delete);
    TblUtilLocation result = TblUtilLocation.fromJson(jsonDecode);
    return result;
  }

  ///TblUtilLocationType

  Future<List<TblUtilLocationType>> getAllTblUtilLocationType() async {
    var jsonDecode =
        await Api.request('TblUtilLocationType/GetAll', method: HttpMethod.get);
    List<TblUtilLocationType> result = [];
    for (var jsonItem in jsonDecode) {
      result.add(TblUtilLocationType.fromJson(jsonItem));
    }
    return result;
  }

  Future<TblUtilLocationType> getTblUtilLocationType(int id) async {
    var jsonDecode = await Api.request('TblUtilLocationType/Get/$id',
        method: HttpMethod.get);
    TblUtilLocationType result = TblUtilLocationType.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilLocationType> insertTblUtilLocationType(
      TblUtilLocationType tblUtilLocationType) async {
    var jsonDecode = await Api.request('TblUtilLocationType/Insert',
        method: HttpMethod.post, data: tblUtilLocationType.toMap());
    TblUtilLocationType result = TblUtilLocationType.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilLocationType> updateTblUtilLocationType(
      TblUtilLocationType tblUtilLocationType) async {
    var jsonDecode = await Api.request('TblUtilLocationType/Update',
        method: HttpMethod.put, data: tblUtilLocationType.toMap());
    TblUtilLocationType result = TblUtilLocationType.fromJson(jsonDecode);
    return result;
  }

  Future<TblUtilLocationType> deleteTblUtilLocationType(int id) async {
    var jsonDecode = await Api.request('TblUtilLocationType/Delete/$id',
        method: HttpMethod.delete);
    TblUtilLocationType result = TblUtilLocationType.fromJson(jsonDecode);
    return result;
  }

}

extension AppRepositoryExtension on AppRepository {

  ///USER
  Future<User> getUser(String email, BigInt id) async {
    var jsonDecode = await Api.request(
        'TblUserMain/GetUser?email=$email&id=${id.toString()}',
        method: HttpMethod.get);
    User result = User.fromJson(jsonDecode);
    return result;
  }

  ///QESTION
  Future<Question> getQuestion(
      BigInt id, String connectionId, BigInt userId) async {
    var jsonDecode = await Api.request(
        'TblQueQuestionMain/GetQuestion?id=$id&connectionId=$connectionId&userId=$userId',
        method: HttpMethod.get);
    Question result = Question.fromJson(jsonDecode);
    return result;
  }

  Future<Question> insertQuestion(Question question) async {
    var jsonDecode = await Api.request('TblQueQuestionMain/InsertQuestion',
        method: HttpMethod.post, data: question.toMap());
    Question result = Question.fromJson(jsonDecode);
    return result;
  }

  Future<Question> updateQuestion(Question question) async {
    var jsonDecode = await Api.request('TblQueQuestionMain/UpdateQuestion',
        method: HttpMethod.put, data: question.toMap());
    Question result = Question.fromJson(jsonDecode);
    return result;
  }

  Future<Question> deleteQuestion(BigInt id) async {
    var jsonDecode = await Api.request('TblQueQuestionMain/DeleteQuestion/$id',
        method: HttpMethod.delete);
    Question result = Question.fromJson(jsonDecode);
    return result;
  }

  Future<List<WeatherForecast>> getWeather() async {
    var jsonDecodeResult =
    await Api.request('WeatherForecast/Get', method: HttpMethod.get);
    List<WeatherForecast> forecasts = [];
    for (var jsonItem in jsonDecodeResult) {
      forecasts.add(WeatherForecast.fromJson(jsonItem));
    }
    //await Future.delayed(const Duration(seconds: 5));
    return forecasts;
  }
}
