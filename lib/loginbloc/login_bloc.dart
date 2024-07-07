import 'package:bloc/bloc.dart';
import 'package:datapage_bloc/api/loginapi.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      final response = await authRepository.authenticate(
        username: event.username,
        password: event.password,
      );
      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(error: 'Login failed'));
      }
    } catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }
}
