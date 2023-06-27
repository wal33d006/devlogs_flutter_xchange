import 'package:dartz/dartz.dart';
import 'package:devlogs_flutter_xchange/domain/failures/get_local_storage_failure.dart';
import 'package:devlogs_flutter_xchange/domain/failures/set_local_storage_failure.dart';

abstract class LocalStorageRepository {
  Future<Either<SetLocalStorageFailure, bool>> setString(String key, String value);

  Future<Either<GetLocalStorageFailure, String>> getString(String key);

  Future<Either<SetLocalStorageFailure, bool>> setBool(String key, bool value);

  Future<Either<GetLocalStorageFailure, bool>> getBool(String key);
}
