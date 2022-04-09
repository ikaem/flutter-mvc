import 'package:flutter/cupertino.dart';
import 'package:master_plan/controllers/plan_controller.dart';
import 'package:master_plan/models/data_layer.dart';

class PlanProvider extends InheritedWidget {
  // so inherited widgets are used to propagate data down the tree

  // final _plans = <Plan>[];
  // final _plan = Plan();

  final _controller = PlanController();

  PlanProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static PlanController of(BuildContext context) {
    final PlanProvider? provider =
        context.dependOnInheritedWidgetOfExactType<PlanProvider>();

    return provider!._controller;
  }

// oh, this method is called of
// and it returns Plan type
// and we create provider from from the context
// and then we return plan from the provider
  // static List<Plan> of(BuildContext context) {
  //   // so this method will obtain the nearest widget if inherited widget type
  //   final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
  //   // this is probably not good with !.
  //   return provider!._plans;
  // }
}
