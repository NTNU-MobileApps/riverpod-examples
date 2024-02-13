import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_list_example/providers/book_service_provider.dart';

import '../model/book.dart';
import '../services/book_service.dart';

/// State storage for books, with modification actions
class BookNotifier extends Notifier<List<Book>> {
  late BookService bookService = ref.watch(bookServiceProvider);
  BookNotifier() {
    print("Creating BookNotifier...");
  }

  @override
  List<Book> build() {
    return [];
  }

  /// Refresh all books "from the database"
  void refreshAll() {
    print("Loading all books from database...");
    state = bookService.fetchAllBooks();
  }

  /// Remove the last book from the list
  void deleteBook() {
    // Note: in real life you would probably send commands to the service...
    state = [
      // Re-insert all but the last book
      for (var i = 0; i < state.length - 1; ++i)
        state[i]
    ];
  }

  /// Add a random book to the list
  void addBook() {
    // Note: in real life you would probably send commands to the service...
    state = [...state, bookService.createRandomBook()];
  }

}
