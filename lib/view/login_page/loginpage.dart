import 'package:datapage_bloc/api/loginapi.dart';
import 'package:datapage_bloc/loginbloc/login_bloc.dart';
import 'package:datapage_bloc/view/central_page/central_page.dart';
import 'package:datapage_bloc/view/login_page/customtext_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepository();

    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => LoginBloc(authRepository: authRepository),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            } else if (state is LoginSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              );
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextField(
                            heading: 'UserName',
                            keyboard: TextInputType.text,
                            controller: _usernameController,
                            labelText: 'Enter UserName',
                            // prefixIcon: const Icon(Icons.person_2_rounded),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            heading: 'Password',
                            keyboard: TextInputType.text,
                            controller: _passwordController,
                            labelText: 'Enter Password',
                            // prefixIcon: const Icon(Icons.key),
                            obscureText: true,
                          ),
                          const SizedBox(height: 30),
                          state is LoginLoading
                              ? const CircularProgressIndicator()
                              : InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      final username = _usernameController.text;
                                      final password = _passwordController.text;
                                      BlocProvider.of<LoginBloc>(context).add(
                                        LoginButtonPressed(
                                          username: username,
                                          password: password,
                                        ),
                                      );
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurpleAccent[200],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Center(
                                        child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    )),
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
        // TextFormField(
                      //   controller: _usernameController,
                      //   decoration:
                      //       const InputDecoration(labelText: 'Username'),
                      // ),
                      // TextFormField(
                      //   controller: _passwordController,
                      //   decoration:
                      //       const InputDecoration(labelText: 'Password'),
                      //   obscureText: true,
                      // ),
                               // ElevatedButton(
                          //     onPressed: () {
                          //       if (_formKey.currentState!.validate()) {
                          //         final username = _usernameController.text;
                          //         final password = _passwordController.text;
                          //         BlocProvider.of<LoginBloc>(context).add(
                          //           LoginButtonPressed(
                          //             username: username,
                          //             password: password,
                          //           ),
                          //         );
                          //       }
                          //     },
                          //     child: const Text('Login'),
                          //   ),



                           // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(300.0),
      //   child: AppBar(
      //     flexibleSpace: Stack(
      //       children: [
      //         Positioned.fill(
      //             child: Container(
      //           decoration: const BoxDecoration(color: Colors.deepPurpleAccent),
      //         )),
      //         const Positioned(
      //           bottom: 16.0,
      //           left: 16.0,
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 'Login',
      //                 style: TextStyle(
      //                   fontSize: 30.0,
      //                   color: Colors.white,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //               Text(
      //                 'Please Sign In To continue',
      //                 style: TextStyle(
      //                   fontSize: 15.0,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),