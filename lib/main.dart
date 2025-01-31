import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorting_hat/ui/pages/details_page.dart';
import 'package:sorting_hat/ui/pages/home_page.dart';
import 'package:sorting_hat/ui/pages/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
      routes: {
        HomePage.id: (context) => const HomePage(),
        ListPage.id: (context) => const ListPage(),
        DetailsPage.id: (context) => const DetailsPage(),
      },
    ));
  }
}
