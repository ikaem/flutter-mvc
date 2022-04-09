import 'package:master_plan/models/task.dart';
import 'package:master_plan/repositories/repository.dart';

class Plan {
  final int id;
  String name;
  // note that this is final
  // the variable itself , the reference, wont change
  // but we might be adding stuff into it
  // ćwe removed final from here because variables can not be initialized in the cosntructor if they are final and were already intiialized elsewhere
  // so we removed final
  List<Task> tasks = [];

  Plan({required this.id, this.name = ""});

// again, we are initializing things
// so this is in fact a constructor
  Plan.fromModel(Model model)
      : id = model.id,
        name = model.data["name"],
        tasks = model.data["tasks"]
                ?.map<Task>((task) => Task.fromModel(task))
                ?.toList() ??
            <Task>[];

  toModel() => Model(id: id, data: {
        "name": name,
        // this to list will keep confuginsg me
        "tasks": tasks.map((task) => task.toModel()).toList()
      });

// also, htis is a getter
// note the syntact for getter - it is a function kinda
  int get completeCount => tasks.where((task) => task.complete).length;

  String get completenessMessage =>
      "$completeCount out of ${tasks.length} tasks";
}
