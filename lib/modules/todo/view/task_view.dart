import 'package:app_todo/modules/todo/controller/task_controller.dart';
import 'package:app_todo/modules/todo/model/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TaskView extends StatefulWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TaskController controller = TaskController();

  Widget buildLoading = const Center(
    child: CircularProgressIndicator(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de tarefas"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Task>>(
        future: controller.fetchTask(),
        builder: (context, state) {
          if (state.connectionState == ConnectionState.waiting) {
            return buildLoading;
          } else if (state.hasData) {
            return ListView.builder(
              itemCount: state.data!.length,
              itemBuilder: (context, index) {
                final task = state.data![index];

                return Column(
                  children: [
                    ListTile(
                      title: Text(task.title),
                      subtitle: Text(task.description),
                    ),
                  ],
                );
              },
            );
          } else if (state.hasError) {
            return const Center(
              child: Text("Erro ao carregar as tarefas"),
            );
          }
          return buildLoading;
        },
      ),
    );
  }
}
