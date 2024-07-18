import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

extension OptionalAddInfixOperator<T extends num> on T? {
  T? operator +(T? other) {
    final shadow = this;
    if (shadow != null) {
      return shadow + (other ?? 0) as T;
    } else {
      return null;
    }
  }
}

class CounterNotifier extends StateNotifier<int?> {
  CounterNotifier() : super(null);
  void increment() => state = state == null ? 0 : state + 1;
}

final counterProvider =
    StateNotifierProvider<CounterNotifier, int?>((ref) => CounterNotifier());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("riverpod counter" , ),centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final count = ref.watch(counterProvider);
              final text =
                  count == null ? "press the button " : count.toString();
              return Text(text , textAlign: TextAlign.center, style:Theme.of(context).textTheme.headlineLarge ,);
            },
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: ref.read(counterProvider.notifier).increment,
              child: Text("press to Increment"))
        ],
      ),
    );
  }
}
