import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tarea3/presentation/blocs.dart';
import 'package:tarea3/presentation/widgets.dart';

class ProfessorsListView extends StatefulWidget {
  const ProfessorsListView({super.key});

  @override
  State<ProfessorsListView> createState() => _ProfessorsListViewState();
}

class _ProfessorsListViewState extends State<ProfessorsListView> {

  @override
    void initState() {
    super.initState();
    context.read<ProfessorCubit>().getProfessors();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final professors = context.watch<ProfessorCubit>().state.professors;
    return Column(
      children: [
        const SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:15),
          child: Row(children: [
            Text('Lista de profesores',
              style: TextStyle(
                fontSize: 22,
                color: colors.primary
              )
            )
          ],)

        ),
        const SizedBox(height:15),
        Expanded(
          child: ListView.builder(
            itemCount: professors.length,
            itemBuilder: (context, index){
              return CustomCard(
                title: '${professors[index].firstName}'
                  '${professors[index].lastName}',
              );
            },
          ),
        ),
        FilledButton.icon(
          onPressed: (){
            context.push('/add-professor');
          },
          icon: const Icon(Icons.add),
          label: const Text('Agregar profesor')
        ),
        const SizedBox(height:15),
      ],
    );
  }
}