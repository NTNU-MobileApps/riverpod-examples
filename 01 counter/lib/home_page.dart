import 'package:counter/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A page showing a counter and a button to increase the button
/// Note: here we break down the widget in many tiny builder methods simply
/// to have an overview (with debug prints) on what is rebuilt when
///
/// The widget is rebuilt every time when `counterProvider` gets a new value.
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  /// The builder method. Note that we need the `WidgetRef ref` here -
  /// ConsumerWidget provides this reference to the provider scope
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("build the HomePage widget");
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: _buildColumn(context, ref),
      ),
      floatingActionButton: _buildButton(ref),
    );
  }

  /// Increment the counter (inside the `counterProvider` - Riverpod state store)
  void _incrementCounter(WidgetRef ref) {
    // Call a setter function for the counterProvider - change the value
    // of the state variable inside it
    ref.read(counterProvider.notifier).state++;

    print("\nCounter = ${ref.read(counterProvider.notifier).state}");
  }

  FloatingActionButton _buildButton(WidgetRef ref) {
    print("  Build Button");
    return FloatingActionButton(
      // Note - we must pass the WidgetRef to the _incrementCounter method!
      onPressed: () => _incrementCounter(ref),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  AppBar _buildAppBar() {
    print("  Build AppBar");
    return AppBar(
      title: const Text("Counter with Riverpod"),
    );
  }

  Column _buildColumn(BuildContext context, WidgetRef ref) {
    print("  Build Column");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildStaticText(),
        _buildCounterText(context, ref),
      ],
    );
  }

  Widget _buildStaticText() {
    print("    Build static text");
    return const Text('You have pushed the button this many times:');
  }

  Widget _buildCounterText(BuildContext context, WidgetRef ref) {
    // Get the counter value and "watch for value updates"
    final counter = ref.watch(counterProvider);
    print("    Build counter text");
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
