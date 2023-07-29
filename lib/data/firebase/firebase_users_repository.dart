import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:devlogs_flutter_xchange/data/firebase/firebase_user_json.dart';
import 'package:devlogs_flutter_xchange/domain/entities/user.dart';
import 'package:devlogs_flutter_xchange/domain/failures/get_user_failure.dart';
import 'package:devlogs_flutter_xchange/domain/failures/update_user_failure.dart';
import 'package:devlogs_flutter_xchange/domain/failures/users_list_failure.dart';
import 'package:devlogs_flutter_xchange/domain/repositories/users_repository.dart';

class FirebaseUsersRepository implements UsersRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<Either<UsersListFailure, List<User>>> getUsers() async => right([
        const User(
          id: '123',
          name: 'name',
          username: 'username',
          email: 'email',
          phone: 'phone',
          website: 'website',
        )
      ]);

  @override
  Future<Either<UpdateUserFailure, bool>> updateUser(User user) async {
    final userJson = FirebaseUserJson(
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email,
      phone: user.phone,
    );

    try {
      await db.collection("users").doc(user.id).set(userJson.toJson(), SetOptions(merge: true));
      return right(true);
    } catch (ex) {
      return left(UpdateUserFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<GetUserFailure, User>> getUserByEmail(String email) async {
    try {
      var snapshots = await db.collection("users").where('email', isEqualTo: email).get();
      return right(FirebaseUserJson.fromJson(snapshots.docs.first.data()).toDomain());
    } catch (ex) {
      return left(GetUserFailure(error: ex.toString()));
    }
  }
}
