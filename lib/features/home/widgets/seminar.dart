import 'package:cached_network_image/cached_network_image.dart';
import 'package:certicode_mobile/components/button/button.dart';
import 'package:certicode_mobile/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/seminar_model.dart';

class ViewSeminar extends StatelessWidget {
  final Seminar seminar;


  const ViewSeminar({super.key, 
    // required this.image, required this.seminarId
    required this.seminar
  });

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
                    CachedNetworkImage(
                      imageUrl: seminar.seminarImage,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          Image.asset('assets/images/sample.jpg', fit: BoxFit.cover,) /*Icon(Icons.error)*/,
                    ),
                    // Image.asset(image, fit: BoxFit.cover,), // dummy image
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
                                      seminar.topics, // Category or topics
                                      style: TextStyle(color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Text(
                            seminar.nameOfSeminar, // name of seminar
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
                              Text(seminar.date, style: TextStyle(color: Colors.white60)),
                              SizedBox(width: 12,),
                              Icon(CupertinoIcons.location_solid, color: Colors.white60, size: 20,),
                              SizedBox(width: 4,),
                              Text(seminar.location, style: TextStyle(color: Colors.white60),),
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
                    // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    seminar.description, // description of seminar
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 0),
                    leading: CachedNetworkImage(
                      imageUrl: seminar.speakerImage,
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                      ),
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => CircleAvatar(
                        backgroundImage: AssetImage('assets/images/logo_notext.png'),
                      ),
                    ),
                    // title: Text('Lorem Ipsum'),
                    title: Text(seminar.speakerName), //speaker
                    subtitle: Text(seminar.organizationName), // org name
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
