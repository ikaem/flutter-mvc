import 'package:master_plan/models/task.dart';

class Plan {
  String name = "";
  // note that this is final
  // the variable itself , the reference, wont change
  // but we might be adding stuff into it
  final List<Task> tasks = [];

// also, htis is a getter
// note the syntact for getter - it is a function kinda
  int get completeCount => tasks.where((task) => task.complete).length;

  String get completenessMessage =>
      "$completeCount out of ${tasks.length} tasks";
}
