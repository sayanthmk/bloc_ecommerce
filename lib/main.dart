import 'package:datapage_bloc/bloc/product_bloc.dart';
import 'package:datapage_bloc/view/product/productapi.dart';
import 'package:datapage_bloc/view/product/productpage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductBloc(apiService: ApiService())..add(FetchProducts()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter BLoC API',
        home: ProductPage(),
      ),
    );
  }
}
