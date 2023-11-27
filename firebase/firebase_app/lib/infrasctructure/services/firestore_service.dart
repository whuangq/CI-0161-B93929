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
        'email': email,
        'message': message,
        'timestamp': Timestamp.now(),
        'likes': [],
      }
    );
  }

  void likePost(String collectionPath, String id, String email, bool isLiked) {
    DocumentReference postRef = FirebaseFirestore.instance
    .collection(collectionPath).doc(id);
    if (isLiked){
      postRef.update({
        'likes': FieldValue.arrayUnion([email]),
      });
    } else {
      postRef.update({
        'likes': FieldValue.arrayRemove([email]),
      });
    }
  }

  Future<void> clear() async {
    await FirebaseFirestore.instance.terminate();
    await FirebaseFirestore.instance.clearPersistence();
  }
}