import 'package:master_plan/models/data_layer.dart';
import 'package:master_plan/repositories/in_memory_cache.dart';
import 'package:master_plan/repositories/repository.dart';

class PlanServices {
  // this cache will be initialized only for the plans
  final Repository _repository = InMemoryCache();

  Plan createPlan(String name) {
    // this will already create the model inside the repo
    final model = _repository.create();
    // this is so cool - we already prepared everything
    final plan = Plan.fromModel(model)..name = name;

    savePlan(plan);
    return plan;
  }

  void savePlan(Plan plan) {
    // this is actually an update
    // we already have the model inside the repository at this point, otherwise we would not be able to get the plan in the argument
    _repository.update(plan.toModel());
  }

  void delete(Plan plan) {
    _repository.delete(plan.toModel());
  }

  List<Plan> getAllPlans() {
    // so with get all we actually get model
    return _repository
        .getAll()
        // so this generic type is actually what the map will return
        .map<Plan>((model) => Plan.fromModel(model))
        .toList();
  }

  void addTask(Plan plan, String description) {
    // final id = (plan.tasks.last?.id ?? 0) + 1;
    final id = plan.tasks.isEmpty ? 0 : plan.tasks.last.id + 1;

    final task = Task(id: id, description: description);
    plan.tasks.add(task);
    savePlan(plan);
  }

  void deleteTask(Plan plan, Task task) {
    plan.tasks.remove(task);

// this part will go to the repository
    savePlan(plan);
  }
}
