import 'package:flutter/material.dart';
import 'package:certicode_mobile/utils/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:certicode_mobile/features/home/models/seminar_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/bloc/favorites/favorites_event.dart';
import '../../features/home/bloc/favorites/favorites_state.dart';
import '../../features/home/bloc/favorites/favoritess_bloc.dart';

class CardBusiness extends StatelessWidget {
  final Seminar seminar;
  //final String title;
  //final String image;
  //final String location;
  //final String category;

const CardBusiness({ Key? key, required this.seminar }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Card(
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
                    child: CachedNetworkImage(
                      imageUrl: seminar.seminarImage,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.broken_image),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {context.read<FavoritesBloc>().add(ToggleFavoriteEvent(seminar));},
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.defaultBG(context),
                        ),
                        child: BlocBuilder<FavoritesBloc, FavoritesState>(
                          builder: (context, state) {
                            // Check if the seminar is in the favorite list
                            final isFavorite = state.favorites.any((s) => s.id == seminar.id);
                            return Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.black,
                              size: 16,
                            );
                          },
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
                              //'$title - $location',
                                '${seminar.nameOfSeminar} - ${seminar.location}',
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
                          //category,
                          seminar.topics,
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
        );
      },
    );
  }
}

