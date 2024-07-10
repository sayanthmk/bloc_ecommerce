import 'package:datapage_bloc/controller/api/api/productapi.dart';
import 'package:datapage_bloc/controller/blocs/cart_bloc/cart_bloc.dart';
import 'package:datapage_bloc/controller/blocs/product_bloc/product_bloc.dart';
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
        BlocProvider(
          create: (context) => CartBloc(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter BLoC API',
        home: SplashScreen(),
      ),
    );
  }
}
