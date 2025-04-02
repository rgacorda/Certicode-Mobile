
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  void setTab(int index, BuildContext context) {
    emit(index); // Update selected tab

    // Navigate based on selected index
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/favourites');
        break;
      case 2:
        context.go('/search');
        break;
      case 3:
        context.go('/account');
        break;
    }
  }

  void updateTabFromRoute(String location) {
    if (location.startsWith('/favourites')) emit(1);
    else if (location.startsWith('/search')) emit(2);
    else if (location.startsWith('/account')) emit(3);
    else emit(0);
  }
}