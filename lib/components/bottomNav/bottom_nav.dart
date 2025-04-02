import 'package:certicode_mobile/features/home/bloc/navigation_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:certicode_mobile/utils/app_colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GoogleBottomNav extends StatefulWidget {
  const GoogleBottomNav({ Key? key }) : super(key: key);

  @override
  _GoogleBottomNavState createState() => _GoogleBottomNavState();
}

class _GoogleBottomNavState extends State<GoogleBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0,0,0,32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(),
            GNav(
                hoverColor: Colors.orangeAccent, // tab button hover color
                haptic: true, // haptic feedback
                curve: Curves.easeOutExpo, // tab animation curves
                duration: Duration(milliseconds: 400), // tab animation duration
                gap: 8, // the tab button gap between icon and text
                color: Colors.grey, // unselected icon color
                activeColor: AppColors.primary, // selected icon and text color
                iconSize: 32, // tab button icon size/ selected tab background color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
                onTabChange: (index) {
                  context.read<NavigationCubit>().setTab(index, context);
                },
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: CupertinoIcons.heart,
                    text: 'Likes',
                  ),
                  GButton(
                    icon: CupertinoIcons.search,
                    text: 'Search',
                  ),
                  GButton(
                    icon: Icons.account_circle_outlined,
                    text: 'Profile',
                  )
                ]
            ),
          ],
        ),
      );
  }
}