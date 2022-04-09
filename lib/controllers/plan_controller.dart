import 'package:master_plan/models/data_layer.dart';
import 'package:master_plan/services/plan_services.dart';

class PlanController {
  // final _plans = <Plan>[];
  final services = PlanServices();

  // this cannot be modified by any other object
  // List<Plan> get plans => List.unmodifiable(_plans);
  List<Plan> get plans => List.unmodifiable(services.getAllPlans());

  void addNewPlan(String name) {
    if (name.isEmpty) {
      return;
    }

    name = _checkForDuplicates(plans.map((plan) => plan.name), name);
    services.createPlan(name);

    // final plan = Plan()..name = name;

    // _plans.add(plan);
  }

  void savePlan(plan) {
    services.savePlan(plan);
  }

  void deletePlan(Plan plan) {
    // _plans.remove(plan);
    services.delete(plan);
  }

// is this [] for positional optional?
  void createNewTask(Plan plan, [String? description]) {
    if (description == null || description.isEmpty) {
      description = "New Task";
    }

    description = _checkForDuplicates(
        plan.tasks.map((task) => task.description), description);

    // final task = Task()..description = description;
    services.addTask(plan, description);

    // plan.tasks.add(task);
  }

  void deleteTask(Plan plan, Task task) {
    // plan.tasks.remove(task);
    services.deleteTask(plan, task);
  }

  String _checkForDuplicates(Iterable<String> items, String text) {
    // note that we check with containes, and not equal
    final duplicateCount = items.where((item) => item.contains(text)).length;

    if (duplicateCount > 0) {
      text += " ${duplicateCount + 1}";
    }

    return text;
  }
}
