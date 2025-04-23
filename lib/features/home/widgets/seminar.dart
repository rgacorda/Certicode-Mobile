import 'package:certicode_mobile/components/button/button.dart';
import 'package:certicode_mobile/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewSeminar extends StatelessWidget {
  final String image;


  const ViewSeminar({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 380,
            leading: Container(
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.7),
                shape: BoxShape.circle
              ),
              child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.primary,
                    size: 23,
                  ),
              ),
            ),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                  children: [
                    Image.asset( image ,fit: BoxFit.cover,),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black.withOpacity(0.7)]
                        )
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white10,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Category',
                                      style: TextStyle(color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Text(
                            'Leadership in Tech',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 6,),
                          Row(
                            children: [
                              Icon(CupertinoIcons.calendar, color: Colors.white60, size: 20,),
                              SizedBox(width: 4,),
                              Text('Date', style: TextStyle(color: Colors.white60)),
                              SizedBox(width: 12,),
                              Icon(CupertinoIcons.location_solid, color: Colors.white60, size: 20,),
                              SizedBox(width: 4,),
                              Text('Location', style: TextStyle(color: Colors.white60),),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]
              ),
            ),
            actions: [
              Container(
                margin: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.7),
                  shape: BoxShape.circle
                ),
                child: IconButton(
                    onPressed: (){
                    },
                    icon: Icon(
                      CupertinoIcons.heart,
                      color: AppColors.primary,
                      size: 23,
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: AppColors.secondary.withOpacity(0.7),
                    shape: BoxShape.circle
                ),
                child: IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.more_horiz,
                      color: AppColors.primary,
                      size: 23,
                    )
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 0),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(image),
                      maxRadius: 28,
                    ),
                    title: Text('Lorem Ipsum'),
                    subtitle: Text('Full-stack Developer & Instructor'),
                    trailing: ElevatedButton(onPressed: (){},
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(AppColors.primary),
                      ),
                        child: Text(
                          'Enroll Now',
                          style: TextStyle(
                            color: AppColors.secondary
                          ),
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
