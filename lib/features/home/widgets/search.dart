import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/card/cardBusiness.dart';
import '../../../components/search/searchbar.dart';
import '../../../components/search/SearchInput.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/responsive.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

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
            pinned: true,
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    'Search',
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
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(65),
              child: Container(
                color: AppColors.primary,
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 9, // Adjust width of search bar
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const SearchInput()),
                          );
                        },
                        child: AbsorbPointer(
                          child: Searchbar(), // Looks normal but is not editable
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        // TODO: Add your sort functionality here
                      },
                      child: Icon(
                        CupertinoIcons.slider_horizontal_3,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ),

          // Add other slivers here, like SliverList or SliverGrid, etc.
          // Liked Seminars title
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                'Explore Seminars',
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
