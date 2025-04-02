import 'package:flutter/material.dart';
import 'package:certicode_mobile/components/bottomSheet/sort_bottomSheet.dart';

class DropdownSort extends StatelessWidget {
  final String? title;
  final IconData? icon;

const DropdownSort({ Key? key, this.title, this.icon }) : super(key: key);

  @override

  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {
        showBottomSheet(context: context, 
        builder: (BuildContext context) {
          return SortBottomSheet();
        }
      );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(width: 1, color: Colors.grey)
        ),
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
          child: Row(
            children: [
              icon != null ? Icon(icon, size: 22,) : Text(title ?? '', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
              if (icon == null) Icon(Icons.keyboard_arrow_down,)
            ],
          ),
        ),
      ),
    );
  }
}
