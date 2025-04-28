import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../components/card/cardBusiness.dart';
import '../../../components/search/searchbar.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/responsive.dart';

class Favorites extends StatelessWidget {
  const Favorites({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar stays the same
          SliverAppBar(
            backgroundColor: AppColors.primary,
            expandedHeight: 120.0,
            floating: true,
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
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(65),
              child: Container(
                color: AppColors.primary,
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Searchbar(),
              ),
            ),
          ),

          // Liked Seminars title
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

          // Seminar Grid
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio:
              ResponsiveDesign.screenHeight(context) / 650,
              mainAxisSpacing: 20,
              crossAxisSpacing: 40,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return CardBusiness(
                  title: 'Leadership in Tech',
                  image: 'assets/images/sample.jpg',
                  location: 'location',
                  category: 'Leadership',
                );
              },
              childCount: 10,
            ),
          )
        ],
      ),
    );
  }
}