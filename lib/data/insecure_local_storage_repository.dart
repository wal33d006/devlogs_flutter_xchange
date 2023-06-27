import 'package:dartz/dartz.dart';
import 'package:devlogs_flutter_xchange/domain/failures/get_local_storage_failure.dart';
import 'package:devlogs_flutter_xchange/domain/failures/set_local_storage_failure.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO: Refactor repeated code
class InsecureLocalStorageRepository implements LocalStorageRepository {
  @override
  Future<Either<GetLocalStorageFailure, String>> getString(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return right(prefs.getString(key) ?? '');
    } catch (ex) {
      return left(GetLocalStorageFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<SetLocalStorageFailure, bool>> setString(String key, String value) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
      return right(true);
    } catch (ex) {
      return left(SetLocalStorageFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<GetLocalStorageFailure, bool>> getBool(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return right(prefs.getBool(key) ?? false);
    } catch (ex) {
      return left(GetLocalStorageFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<SetLocalStorageFailure, bool>> setBool(String key, bool value) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(key, value);
      return right(true);
    } catch (ex) {
      return left(SetLocalStorageFailure(error: ex.toString()));
    }
  }
}
