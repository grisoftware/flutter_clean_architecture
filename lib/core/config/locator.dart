import 'package:clean_architecture/presentation/home/bloc/home_bloc.dart';
import 'package:clean_architecture/presentation/login/bloc/login_bloc.dart';

import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.I;

Future<void> init() async {
  getIt.registerLazySingleton<LoginBloc>(() => LoginBloc());
  getIt.registerLazySingleton<HomeBloc>(() => HomeBloc());
}
