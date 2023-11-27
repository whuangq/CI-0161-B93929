import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  Stream<QuerySnapshot<Map<String, dynamic>>> getPosts(String collectionPath) async* {
    yield* FirebaseFirestore.instance
    .collection(collectionPath)
    .orderBy('timestamp', descending: true)
    .snapshots();
  }

  Future<void> addPost(String collectionPath, String email, String message) async {
    await FirebaseFirestore.instance.collection(collectionPath).add(
      {
        'user_email': email,
        'message': message,
        'timestamp': Timestamp.now(),
      }
    );
  }
}