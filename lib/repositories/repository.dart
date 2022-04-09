import "package:flutter/foundation.dart";

abstract class Repository {
  Model create();

// making it nullable
  Model? get(int id);
  List<Model> getAll();

  void update(Model item);

  void delete(Model item);

  void clear();
}

class Model {
  final int id;
  final Map data;

  const Model({
    required this.id,
    // default value of an optional parameter has to be a constant - so we mark it as a const {} - wow
    this.data = const {},
  });
}
