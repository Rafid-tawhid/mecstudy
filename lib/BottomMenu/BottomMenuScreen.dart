import 'package:flutter/material.dart';
import 'package:mecstudygroup/DashboardScreen.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';

import '../Application/StartApplication.dart';
import '../BookSession/BookSections.dart';
import '../Chat/ChatScreen.dart';
import '../Profile/ProfileScreen.dart';
import '../Utilities/Constant.dart';
import '../main.dart';


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BottomMenuScreen(),
//     );
//   }
// }

class BottomMenuScreen extends StatefulWidget {
  @override
  _BottomMenuScreenState createState() => _BottomMenuScreenState();
}

class _BottomMenuScreenState extends State<BottomMenuScreen> {
  int _selectedIndex = 0;

  // Define your pages here
  final List<Widget> _pages = [
     ExploreScreen(),
   // ChatScreen(),
    BookASections(),
    StartApplication(title: 'Start Application',),
    //PageTwo(),
    //PageThree(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(100.0), // Set your desired height
      //   child: AppBar(
      //     backgroundColor: AppColors.themeMaincolor,
      //     title: Column(
      //       children: [
      //         SizedBox(height: 40,),
      //       Container(
      //         height: Responsive.height(8, context),
      //         width: Responsive.width(19, context),
      //         ///height: Responsivei,
      //         decoration: BoxDecoration(
      //           image: DecorationImage(
      //             image: AssetImage('Images/Logo.png'),
      //             fit: BoxFit.fill,
      //           ),
      //         ),),
      //       ],
      //     ),
      //   ),
      // ),

      body: _pages[_selectedIndex],
        extendBody: true, // Important: to remove background of bottom navigation (making the bar transparent doesn't help)

        //backgroundColor: Colors.black,
      bottomNavigationBar:Container(
        decoration: BoxDecoration(

          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        //add ClipRRect widget for Round Corner
        child: ClipRRect(
        borderRadius:  BorderRadius.only(
        topRight: Radius.circular(24),
    topLeft: Radius.circular(24),
    ),
    child:
      Container(

        //   decoration: BoxDecoration(
        // //    color: Colors.blue, // Background color of the BottomNavigationBar
        // //     borderRadius: BorderRadius.only(
        // //       topLeft: Radius.circular(24.0),
        // //       topRight: Radius.circular(24.0),
        // //     ),
        //   ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
           // backgroundColor: Colors.green,

            selectedItemColor: AppColors.themeMaincolor,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: _onItemTapped,
            elevation: 1,
            items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search,),
            label: 'Explore',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.question_answer),
          //   label: 'Chat',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call_rounded),
            label: 'Meet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Applications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
        ),))

    );
  //}
   // );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class BottomNavigationBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 20); // 20 is the curve height
    path.quadraticBezierTo(
        size.width / 2, size.height, 0, size.height - 20);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
// class PageOne extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Page One Content'),
//     );
//   }
//}


class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This screen will be available soon'),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This screen will be available soon'),
    );
  }
}
