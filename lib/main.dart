// lib/main.dart
import 'package:datapage_bloc/api/cart_api.dart';
import 'package:datapage_bloc/api/productapi.dart';
import 'package:datapage_bloc/cart_bloc/cart_bloc.dart';
import 'package:datapage_bloc/product_bloc/product_bloc.dart';

import 'package:datapage_bloc/view/splash_screen.dart/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductBloc(apiService: ApiService())..add(FetchProducts()),
        ),
        // BlocProvider(
        //   create: (context) => CartBloc(apiService: C
        // artApiService()),
        // ),
        BlocProvider(
          create: (context) => CartBloc(),
        )
      ],
      child: const MaterialApp(
        title: 'Flutter BLoC API',
        home: SplashScreen(),
      ),
    );
  }
}
