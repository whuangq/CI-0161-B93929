import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_app/infrasctructure/services.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(const PostsState());

  void getPosts(String collectionPath) {
    emit(
      state.copyWith(
        isLoading: true
      )
    );
    List<Map<String, dynamic>> posts = [];
    FirestoreService().getPosts(collectionPath).first
    .then((value){
      for(var element in value.docs) {
        posts.add(element.data());
      }
    }).then((value){
      emit(
        state.copyWith(
          isLoading: false,
          posts: posts
        )
      );
    });
  }
  Future<void> addPost(String collectionPath, String email, String message) async {
    await FirestoreService().addPost(collectionPath, email, message);
    getPosts(collectionPath);
  }
}