import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_list_example/providers/book_provider.dart';
import 'model/book.dart';
import 'widgets/book_item.dart';

/// An app showing books from a library (imaginary database)
class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Build app");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Demo of using StateNotifierProvider")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildContent(),
        ),
      ),
    );
  }

  /// Build the main content
  Widget _buildContent() {
    print("  Build content");
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [_buildButtons(), _buildBookColumn()],
      ),
    );
  }

  /// Build the column displaying books
  Widget _buildBookColumn() {
    return Consumer(
      builder: (context, ref, child) {
        print("    Build books");
        final List<Book> books = ref.watch(bookProvider);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: books.map((book) => BookItem(book)).toList(),
        );
      },
    );
  }

  /// Build the button row
  Widget _buildButtons() {
    return Consumer(builder: (context, ref, child) {
      print("    Build buttons");
      final List<Book> books = ref.watch(bookProvider);
      final bool canRemove = books.isNotEmpty;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _createButton("Reload", _refreshBooks, ref),
          _createButton("Add", _addBook, ref),
          _createButton("Remove", _deleteBook, ref, enabled: canRemove)
        ],
      );
    });
  }

  /// Create a button with given title and onPress callback
  /// (need to pass the WidgetRef reference also)
  Widget _createButton(
      String title, void Function(WidgetRef) onPressed, WidgetRef ref,
      {bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: enabled ? () => onPressed(ref) : null,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),
      ),
    );
  }

  /// Ask the book notifier to refresh all the books
  void _refreshBooks(WidgetRef ref) {
    final bookNotifier = ref.read(bookProvider.notifier);
    bookNotifier.refreshAll();
  }

  /// Ask the book notifier to delete the last book
  void _deleteBook(WidgetRef ref) {
    print("\nDeleting a book...");
    final bookNotifier = ref.read(bookProvider.notifier);
    bookNotifier.deleteBook();
  }

  /// Ask the book notifier to add a book
  void _addBook(WidgetRef ref) {
    print("\nAdding a book...");
    final bookNotifier = ref.read(bookProvider.notifier);
    bookNotifier.addBook();
  }
}
