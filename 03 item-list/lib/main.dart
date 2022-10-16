import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_list_example/book_app.dart';

void main() {
  // Wrap the app in the ProviderScope to make all the providers accessible
  runApp(ProviderScope(child: BookApp()));
}
