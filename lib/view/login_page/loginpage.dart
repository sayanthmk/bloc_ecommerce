import 'package:datapage_bloc/controller/api/api/loginapi.dart';
import 'package:datapage_bloc/controller/blocs/loginbloc/login_bloc.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
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
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            heading: 'Password',
                            keyboard: TextInputType.text,
                            controller: _passwordController,
                            labelText: 'Enter Password',
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
