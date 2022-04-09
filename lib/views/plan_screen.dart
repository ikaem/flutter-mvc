import 'package:flutter/material.dart';
import 'package:master_plan/plan_provider.dart';

import '../models/data_layer.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;

  const PlanScreen({Key? key, required this.plan}) : super(key: key);

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  // final plan = Plan();
  // todo SCOLLE CONTAINER IS NOT INITIALIZED HERE IN THE TUTORIAL
  final ScrollController scrollController = ScrollController();
  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    // THIS IS THE ACTUAL ONE IN THE TUTORIAL
    // scrollController = ScrollController()
    scrollController.addListener(() {
      // so focusScope serves as a scope for its descendants
      // i guess to limit their options
      // request focus requests a primary focus for a ndoe
      // FOCUS IS A widget that manages a focus node
      // it allows keyboard focus to be give to a this widget*
      //
      // Focus
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final plan = PlanProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Master Plan")),
      body: Column(
        children: [
          Expanded(child: _buildList()),
          SafeArea(child: Text(plan.completenessMessage))
        ],
      ),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  Widget _buildAddTaskButton() {
    // final plan = PlanProvider.of(context);

    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final controller = PlanProvider.of(context);

          controller.createNewTask(plan);
          setState(() {});
          // setState(() {
          //   plan.tasks.add(Task());
          // });
        });
  }

  Widget _buildList() {
    // this will get the nearest context i guess
    // final plan = PlanProvider.of(context);

    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index]),
    );
  }

  Widget _buildTaskTile(Task task) {
    return Dismissible(
      key: ValueKey(task),
      background: Container(
        color: Colors.red,
        child: Text("Deleted"),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        final controller = PlanProvider.of(context);
        controller.deleteTask(plan, task);
        setState(() {});
      },
      child: ListTile(
        leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            setState(() {
              // because this is by reference, we can simply assign value to it, and not look for it in the list of tasks
              // will need to check if ?? is also if null
              task.complete = selected ?? false;
            });
          },
        ),
        // title: TextField(
        //   onChanged: (text) {
        //     setState(() {
        //       task.description = text;
        //     });
        //   },
        // ),
        title: TextFormField(
          initialValue: task.description,
          onFieldSubmitted: (text) {
            setState(() {
              task.description = text;
            });
          },
        ),
      ),
    );
  }
}
