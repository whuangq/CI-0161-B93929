import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tarea3/domain/schemas.dart';
import 'package:tarea3/infrasctructure/database/isar_services.dart';

part 'professor_state.dart';

class ProfessorCubit extends Cubit<ProfessorState> {

  final isarService = IsarService();

  ProfessorCubit() : super(const ProfessorState());
  Future<void> addProfessor(Professor professor) async {
    isarService.addProfessor(professor);
  }
}
