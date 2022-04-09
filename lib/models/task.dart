import 'package:master_plan/repositories/repository.dart';

class Task {
  // note that no finals or lates or consts
  final int id;
  String description;
  bool complete;

  Task({
    required this.id,
    this.complete = false,
    this.description = "",
  });

  // this is now a static methodf
  // and it will result in actually creating an instnace of the task too
  // but we have to iniialize it this way to be able to deserialize and get data from the genertic mode l

  // and we need the initializer list to initialize fields in the new instnace

  Task.fromModel(Model model)
      : id = model.id,
        description = model.data["descripion"],
        complete = model.data["complete"];

// this is not static - we don't need it to be static because we need the data that is already in the instance
  Model toModel() =>
      Model(id: id, data: {"description": description, "complete": complete});
}
