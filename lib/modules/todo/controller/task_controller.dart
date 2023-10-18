import 'dart:convert';

import 'package:app_todo/core/constants/api.dart';
import 'package:app_todo/core/constants/routes.dart';
import 'package:app_todo/modules/todo/model/task.dart';
import 'package:http/http.dart' as http;

class TaskController {
  Future<List<Task>> fetchTask() async {
    // Url que faz referência a api
    Uri url = Uri.parse(Api.baseUrl + AppRoutes.todo);

    final response = await http.get(url);

    // Valido se ela deu certo
    if (response.statusCode == 200) {
      final List<dynamic> tasks = jsonDecode(response.body);
      return tasks.map((task) => Task.fromJson(task)).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }
}
