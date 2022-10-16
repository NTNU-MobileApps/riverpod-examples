import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_page.dart';

void main() {
  // Notes:
  // 1) here we wrap the whole app with ProviderScope to make sure our
  // Riverpod providers are available to all widgets
  // 2) It is a better style to wrap the whole MyApp, to avoid having
  // the ProviderScope inside the widgets themselves. This makes testing
  // easier - in the tests you will wrap the App inside a separate
  // ProviderScope for each test.
  runApp(const ProviderScope(child: MyApp()));
}

// The main entrypoint for the app
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
