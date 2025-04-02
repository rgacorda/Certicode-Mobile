import 'package:flutter/material.dart';
import 'package:certicode_mobile/utils/app_colors.dart';

class Voucherbanner extends StatelessWidget {
const Voucherbanner({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      height: 20,
      width: 180,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.local_offer_outlined,
            color: Colors.white,
            size: 12,
          ),
          SizedBox(width: 4),
          Text(
            'Get 20% off on your first order',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
