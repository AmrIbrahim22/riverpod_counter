import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'operator.dart';

class CounterNotifier extends StateNotifier<int?> {
  CounterNotifier() : super(null);
  void increment() => state = state == null ? 0 : state + 1;
}

final counterProvider =
    StateNotifierProvider<CounterNotifier, int?>((ref) => CounterNotifier());
