import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_plan/plan_provider.dart';
import 'package:master_plan/views/plan-creator_screen.dart';
import 'package:master_plan/views/plan_screen.dart';

void main() => runApp(PlanProvider(child: MasterPlanApp()));

class MasterPlanApp extends StatelessWidget {
  MasterPlanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      // home: PlanProvider(child: PlanScreen()),
      // home: PlanScreen(),
      home: PlanCreatorScreen(),
    );
  }
}
