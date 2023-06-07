import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';

/*class UserRepository {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');

  Future<void> CreateUser(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await usersCollection
          .add({'name': name, 'email': email, 'password': password});
    } catch (e) {
      print(e);
      return;
    }
    print("User created Successfully");
  }

  Future<List<DocumentSnapshot>> GetUser() async {
    try {
      final Users = await usersCollection.get();
      print(Users);
      return Users.docs;
    } catch (e) {
      print(e);
      return [];
    }
  }
}*/

class UserRepository {
  UserRepository({required this.firestore});

  final FirebaseFirestore firestore;
  CollectionReference get usersCollection => firestore.collection('Users');

  Future<void> createUser(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await usersCollection
          .add({'name': name, 'email': email, 'password': password});
    } catch (e) {
      print(e);
      return;
    }
    print("User created Successfully");
  }

  Future<void> CreateUser({required user, required name}) async {
    try {
      String username = await generateUniqueUsername();
      if (user!.uid != "test_uid") {
        await user!.updateDisplayName(name);
      }

      await usersCollection.doc(user!.uid).set({
        'name': name,
        'username': username,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<String> generateUniqueUsername() async {
    var username = '';
    var usernameExists = true;

    while (usernameExists) {
      username = randomAlphaNumeric(8);
      var snapshot =
          await usersCollection.where('username', isEqualTo: username).get();
      usernameExists = snapshot.docs.isNotEmpty;
    }

    return username;
  }

  Future<DocumentSnapshot> getUserById(String uid) async {
    final userDoc = await usersCollection.doc(uid).get();
    //print(userDoc['username']);
    return userDoc;
  }
}
