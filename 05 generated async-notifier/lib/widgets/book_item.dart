import 'package:flutter/material.dart';

import '../model/book.dart';

/// A widget displaying a book as an item in a list
class BookItem extends StatelessWidget {
  final Book book;

  BookItem(this.book);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(child: Text("${book.author}: ${book.title}")),
      ),
    );
  }
}
