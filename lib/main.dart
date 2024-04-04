import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_bloc/counter_bloc/counter_bloc.dart';

import 'package:jkb_bloc/counter_page.dart';
import 'package:jkb_bloc/products/bloc/product_bloc.dart';
import 'package:jkb_bloc/products/bloc/product_event.dart';
import 'package:jkb_bloc/products/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProductScreen(),
      ),
    );
  }
}
