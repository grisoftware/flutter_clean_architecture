import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture/presentation/home/views/home_view.dart';
import 'package:clean_architecture/presentation/login/presenter/login_view.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: LoginView, initial: true),
    AutoRoute(page: HomeView),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
