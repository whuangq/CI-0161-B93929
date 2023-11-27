import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarea3/domain/schemas.dart';
import 'package:tarea3/presentation/blocs.dart';

class CourseDetailsScreen extends StatelessWidget {
  final int id;

  const CourseDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => CourseCubit()),
      BlocProvider(create: (context) => ProfessorCubit())
    ], child: _CourseDetailsView(id: id));
  }
}

class _CourseDetailsView extends StatefulWidget {
  final int id;

  const _CourseDetailsView({required this.id});

  @override
  State<_CourseDetailsView> createState() => _CourseDetailsViewState();
}

class _CourseDetailsViewState extends State<_CourseDetailsView> {
  @override
  void initState() {
    super.initState();
    context.read<CourseCubit>().getCourse(widget.id);
    context.read<ProfessorCubit>().getProfessors();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final String code = context.watch<CourseCubit>().state.code;
    final String name = context.watch<CourseCubit>().state.name;
    final List<Professor> professors =
        context.watch<ProfessorCubit>().state.professors;
    Professor courseProfessor = Professor();

    for (int index = 0; index < professors.length; index++) {
      final courses = professors[index].courses;
      final searchResults =
          courses.where((course) => course.code == code).toList();
      if (searchResults.isNotEmpty) {
        courseProfessor = professors[index];
      }
    }

    return Scaffold(
        appBar: AppBar(title: Text('$code: $name')),
        body: Column(children: [
          const SizedBox(height: 15),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(children: [
                Text('Detalles del curso',
                    style: TextStyle(fontSize: 22, color: colors.primary))
              ])),
          const SizedBox(height: 15),
          ListTile(
              leading: const Icon(Icons.code_rounded),
              title: const Text('Código'),
              subtitle: Text(code)),
          ListTile(
              leading: const Icon(Icons.calendar_today_rounded),
              title: const Text('Nombre'),
              subtitle: Text(name)),
          ListTile(
              leading: const Icon(Icons.school_rounded),
              title: const Text('Profesor'),
              subtitle: Text(
                  '${courseProfessor.firstName} ${courseProfessor.lastName}'))
        ]));
  }
}
