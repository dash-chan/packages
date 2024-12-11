import 'dart:collection';

import 'package:devision/tools/tool.dart';

const int kMaxStore = 1024;

class Database {
  static final _records = <Type, Queue<DevisionData>>{};
  static save<T>(DevisionData<T> record) {
    if (_records.containsKey(T)) {
      final items = _records[T]!;
      items.addFirst(record);
      if (items.length > kMaxStore) {
        items.removeLast();
      }
    } else {
      _records[T] = Queue.of([record]);
    }
  }
}
