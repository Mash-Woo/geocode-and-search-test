import 'package:flutter/material.dart';
import 'package:newwave_solution/provider/search_provider.dart';
import 'package:newwave_solution/presenters/pages/search_page.dart';
import 'package:provider/provider.dart';

void main() {
 runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SearchProvider()),

  ], child: const MyApp()));}

 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SearchPage(),
    );
  }
}




