import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_counter/provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}



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
              child: const Text("press to Increment"))
        ],
      ),
    );
  }
}
