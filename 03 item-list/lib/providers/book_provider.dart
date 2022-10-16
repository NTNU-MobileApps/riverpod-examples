import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/book.dart';
import '../providers/book_service_provider.dart';

import 'book_notifier.dart';

final bookProvider = StateNotifierProvider<BookNotifier, List<Book>>((ref) {
  // This is how we can inject BookService into the BookNotifier!
  final bookService = ref.watch(bookServiceProvider);
  return BookNotifier(bookService);
});
