import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:certicode_mobile/components/card/cardBusiness.dart';
import 'package:certicode_mobile/components/card/cardCategory.dart';
import 'package:certicode_mobile/components/dropdown/dropdown_sort.dart';
import 'package:certicode_mobile/components/search/searchbar.dart';
import 'package:certicode_mobile/utils/app_colors.dart';
import 'package:certicode_mobile/utils/responsive.dart';

// Categories to be used in the Card
enum Category {
  hotel,
  restaurant,
  activities,
  experiences,
  packages,
  cars,
  cruises,
}

List<Map<String, dynamic>> categories = [
 {
    'name': 'Technology',
    'icon': Icons.computer,
  },
  {
    'name': 'Business',
    'icon': Icons.business,
  },
  {
    'name': 'Health',
    'icon': Icons.health_and_safety,
  },
  {
    'name': 'Education',
    'icon': Icons.school,
  },
  {
    'name': 'Finance',
    'icon': Icons.attach_money,
  },
  {
    'name': 'Marketing',
    'icon': Icons.campaign,
  },
  {
    'name': 'Personal',
    'icon': Icons.self_improvement,
  },
  {
    'name': 'Research',
    'icon': Icons.science,
  },
  {
    'name': 'Engineering',
    'icon': Icons.build,
  },
  {
    'name': 'Leadership',
    'icon': Icons.leaderboard,
  },
];

List<Map<String, dynamic>> sortList = [
  {
    'name': 'Settings',
    'icon': Icons.settings
  },
  {
    'name': 'Price',
  },
  {
    'name': 'Sort',
  },
  {
    'name': 'Offers',
  },
  {
    'name': 'Ratings',
  },
];


class Home extends StatelessWidget {
const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.primary,
            leading: IconButton(
              onPressed: () {}, 
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 34,
                ),
              ),
            expandedHeight: 120.0,
            floating: true,
            title: Row(
              children: [
              Expanded(
                child: Text(
                  'Certicode',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GestureDetector(
                child: Icon(
                  CupertinoIcons.bag,
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
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
              ),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...categories.map((category) => CardCategory(icon: category['icon'], title: category['name'],)).toList(),
                            ],
                          ),
                        ],
                      )
                    ),
                  ),
                  Divider()
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...sortList.map((sort) => DropdownSort(title: sort['name'], icon: sort['icon'],)).toList(),
                  ],
                )),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Text(
                'Explore Seminars',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: ResponsiveDesign.screenHeight(context)/650,
              mainAxisSpacing: 20,
              crossAxisSpacing: 40,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return CardBusiness(title: 'Leadership in Tech', image: 'assets/images/sample.jpg', location: 'location', category: 'Leadership',);
              },
              childCount: 10,
            ),
          )
        ],
      ),
    );
  }
}