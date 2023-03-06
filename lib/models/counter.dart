class Counter {
  int? id;
  String name;
  int goal;
  int counter;

  Counter(
      {required this.id,
      required this.name,
      required this.goal,
      required this.counter});

  Counter.fromMap(Map<String, dynamic>? data)
      : id = data!["id"],
        name = data["name"],
        goal = data["goal"],
        counter = data["counter"];

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'goal': goal, 'counter': counter};
  }

  @override
  String toString() {
    return 'Counter{id: $id, name: $name, goal: $goal, counter: $counter}';
  }
}
