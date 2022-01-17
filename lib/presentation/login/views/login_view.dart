import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:clean_architecture/presentation/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(),
      child: Builder(builder: (context) {
        context.read<LoginBloc>().add(AppStarted());
        return Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: Column(
            children: [
              TextField(
                controller: emailController,
              ),
              TextField(
                controller: passwordController,
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // context.read<LoginBloc>().add(LoginSubmitted(
              //       email: emailController.text,
              //       password: passwordController.text,
              //     ));
              context.router.pushNamed('/home-view');
              Future.delayed(const Duration(seconds: 1), () {
                context.router.navigateBack();
              });
            },
          ),
        );
      }),
    );
  }
}
