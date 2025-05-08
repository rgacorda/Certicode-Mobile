import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/card/cardBusiness.dart';
import '../../../components/search/searchbar.dart';
import '../../../utils/app_colors.dart';
import '../bloc/favorites/favorites_state.dart';
import '../bloc/favorites/favoritess_bloc.dart';

class Favorites extends StatelessWidget {
  Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar
          SliverAppBar(
            backgroundColor: AppColors.primary,
            expandedHeight: 120.0,
            floating: true,
            pinned: true,
            title: Row(children: [
              Expanded(
                child: Text(
                  'My Favorites',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                child: Icon(
                  CupertinoIcons.person_crop_circle_fill,
                  color: Colors.white,
                  size: 34,
                ),
              )
            ]),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(65),
              child: Container(
                color: AppColors.primary,
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Searchbar(),
              ),
            ),
          ),

          // Section Title
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                'Liked Seminars',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // BLoC Builder to display favorite seminars
          BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              final favoriteSeminars = state.favorites;

              if (favoriteSeminars.isEmpty) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('No favorite seminars found.'),
                    ),
                  ),
                );
              }

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return CardBusiness(seminar: favoriteSeminars[index]);
                  },
                  childCount: favoriteSeminars.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
