import 'package:flutter/material.dart';
import 'package:certicode_mobile/components/bottomNav/bottom_nav.dart';


class HomePage extends StatefulWidget {
  final Widget child;

  const HomePage({ Key? key, required this.child }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  // void initState() {
  //   super.initState();
  //   PermissionHandlerService.requestPermissions();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: widget.child,
          )
        ],
      ),
      bottomNavigationBar: GoogleBottomNav(),
    );
  }
}