import 'package:datapage_bloc/controller/blocs/splash_bloc/splash_bloc.dart';
import 'package:datapage_bloc/view/central_page/central_page.dart';
import 'package:datapage_bloc/view/login_page/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SplashBloc()..add(AppStarted()),
        child: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) async {
            if (state is SplashLoaded) {
              await Future.delayed(const Duration(seconds: 3));
              if (state.isLoggedIn) {
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MainPage()),
                );
              } else {
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }
            }
          },
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(
                //   'asset/logoh&m.jpg',
                //   height: 200,
                //   width: 200,
                // ),
                // const SizedBox(height: 20),
                CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
