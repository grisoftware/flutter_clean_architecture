import 'dart:developer';
import 'package:clean_architecture/core/config/locator.dart';
import 'package:clean_architecture/data/source/remote/login_repository.dart';
import 'package:clean_architecture/presentation/home/bloc/home_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginService _loginRepository = LoginService();
  LoginBloc() : super(LoginState()) {
    on<LoginSubmitted>(_onLogin);
    on<AppStarted>((event, state) {});
  }
  void _onLogin(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    try {
      getIt<HomeBloc>().email = event.email;
      getIt<HomeBloc>().password = event.password;
      await _loginRepository.login(
          email: event.email, password: event.password);
    } catch (e) {
      log("Error", error: e);
    }
  }

  @override
  void onChange(Change<LoginState> change) {
    super.onChange(change);
  }
}
