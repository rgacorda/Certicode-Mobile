// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:certicode_mobile/components/search/searchbar.dart';

// class Home extends StatefulWidget {
//   const Home({ Key? key }) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: Colors.deepOrange,
//             expandedHeight: 140.0,
//             floating: false,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               background: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: kToolbarHeight-10), 
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.location_on_outlined,
//                           color: Colors.white,
//                           size: 34,
//                         ),
//                         SizedBox(width: 16),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Home',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 'Teodora Alonzo, Baguio, Benguet 2600',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         GestureDetector(
//                           child: Icon(
//                             CupertinoIcons.bag,
//                             color: Colors.white,
//                             size: 34,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             bottom: PreferredSize(
//               preferredSize: Size.fromHeight(10),
//               child: Container(
//                 color: Colors.deepOrange,
//                 padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//                 child: Searchbar(),
//               ),
//             ),
//           ),
//           SliverGrid(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 1,
//               childAspectRatio: 3,
//             ),
//             delegate: SliverChildListDelegate(
//               [
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       Card(
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Text('This is the last part of the screen'),
//                         ),
//                       ),
//                       Card(
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Text('This is the next to last part of the screen'),
//                         ),
//                       ),
//                       Card(
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Text('This is the third to last part of the screen'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Text('This is the third last part of the screen'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
