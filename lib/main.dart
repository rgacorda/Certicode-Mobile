import 'package:certicode_mobile/features/auth/view/auth_page.dart';
import 'package:certicode_mobile/features/auth/widgets/login.dart';
import 'package:certicode_mobile/features/auth/widgets/get_started.dart';
import 'package:certicode_mobile/features/auth/widgets/email_options.dart';
import 'package:certicode_mobile/features/auth/widgets/register_details.dart';
import 'package:certicode_mobile/features/home/bloc/navigation_cubit.dart';
import 'package:certicode_mobile/features/home/view/home_page.dart';
import 'package:certicode_mobile/features/home/widgets/account.dart';
import 'package:certicode_mobile/features/home/widgets/favorites.dart';
import 'package:certicode_mobile/features/home/widgets/home.dart';
import 'package:certicode_mobile/features/home/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import "package:certicode_mobile/features/auth/view/splash_Screen.dart";


void main(){
  runApp(
    BlocProvider(
      create: (_) => NavigationCubit(),
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _router,
          );
        },
      ),
    )
  );
}



final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    ShellRoute(
      builder: (context, state, child){
        return HomePage(child: child,);
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const Home(),
        ),
        GoRoute(
          path: '/favourites',
          builder: (context, state) => const Favorites(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const Search(),
        ),
        GoRoute(
          path: '/account',
          builder: (context, state) => const Account(),
        ),
      ]
    ),
    ShellRoute(
      builder: (context, state, child){
        return AuthPage(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const GetStarted(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const Login(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => const EmailOptions(),
        ),
        GoRoute(
          path: '/register_details',
          builder: (context, state) => const RegisterDetails(),
        )
      ]
    )
  ],
);