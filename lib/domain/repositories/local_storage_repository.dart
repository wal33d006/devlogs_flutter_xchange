import 'package:devlogs_flutter_xchange/domain/failures/get_local_storage_failure.dart';
import 'package:devlogs_flutter_xchange/domain/failures/remove_local_storage_failure%20copy.dart';
import 'package:devlogs_flutter_xchange/domain/failures/set_local_storage_failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class LocalStorageRepository {
  Future<Either<SetLocalStorageFailure, bool>> setString(
      String key, String value);

  Future<Either<GetLocalStorageFailure, String>> getString(String key);

  Future<Either<SetLocalStorageFailure, bool>> setBool(String key, bool value);

  Future<Either<GetLocalStorageFailure, bool>> getBool(String key);

  Future<Either<RemoveLocalStorageFailure, bool>> remove(String key);
}
