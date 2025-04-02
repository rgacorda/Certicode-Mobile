import 'package:flutter/material.dart';
import 'package:certicode_mobile/utils/app_colors.dart';

class CardCategory extends StatelessWidget {
  final IconData? icon;
  final String? title;
const CardCategory({ Key? key, this.icon, this.title }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 100,
        child: Card(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, 
              children: [
                Icon(
                  icon,
                  color: AppColors.primary,
                  size: 32,
                ),
                SizedBox(height: 16,),
                Text(
                  title!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
