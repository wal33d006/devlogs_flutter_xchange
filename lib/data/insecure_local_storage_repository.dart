import 'package:dartz/dartz.dart';
import 'package:devlogs_flutter_xchange/domain/failures/get_local_storage_failure.dart';
import 'package:devlogs_flutter_xchange/domain/failures/set_local_storage_failure.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsecureLocalStorageRepository implements LocalStorageRepository {
  @override
  Future<Either<GetLocalStorageFailure, String>> get(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return right(prefs.getString(key) ?? '');
    } catch (ex) {
      return left(GetLocalStorageFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<SetLocalStorageFailure, bool>> set(String key, String value) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
      return right(true);
    } catch (ex) {
      return left(SetLocalStorageFailure(error: ex.toString()));
    }
  }
}
