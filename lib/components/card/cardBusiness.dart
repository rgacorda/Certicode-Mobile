import 'package:certicode_mobile/features/home/widgets/seminar.dart';
import 'package:flutter/material.dart';
import 'package:certicode_mobile/utils/app_colors.dart';

class CardBusiness extends StatelessWidget {
  final String title;
  final String image;
  final String location;
  final String category;

const CardBusiness({ Key? key, required this.title, required this.image, required this.location, required this.category }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => ViewSeminar(image: image),
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 14),
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: const Color.fromARGB(120, 158, 158, 158)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      child: Image(
                        image: AssetImage(image),
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.defaultBG(context),
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '$title - $location',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1, 
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 15,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '4.9 (1000+)',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            category,
                            style: TextStyle(
                              fontSize: 11
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Colors.black,
                                size: 15,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '30 - 45 min',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height: 5,),
                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Voucherbanner()
                        // )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

