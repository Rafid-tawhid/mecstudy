import 'package:flutter/material.dart';
import 'package:mecstudygroup/DashboardScreen.dart';
import 'package:mecstudygroup/Utilities/Colors.dart';
import '../Application/StartApplication.dart';
import '../Profile/ProfileScreen.dart';

class BottomMenuScreen extends StatefulWidget {
  const BottomMenuScreen({super.key});

  @override
  _BottomMenuScreenState createState() => _BottomMenuScreenState();
}

class _BottomMenuScreenState extends State<BottomMenuScreen> {
  int _selectedIndex = 0;

  // Define your pages here
  final List<Widget> _pages = [
    HomeScreen(),
    // ChatScreen(),
   // BookASections(),
    StartApplication(title: 'Start Application',),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        backgroundColor: Colors.orange,
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.themeMaincolor,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
          elevation: 1,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.chat_bubble_outline,
            //   ),
            //   label: 'Chat',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.video_camera_back_outlined),
            //   label: 'Meet',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
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
    path.quadraticBezierTo(size.width / 2, size.height, 0, size.height - 20);
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
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This screen will be available soon'),
    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This screen will be available soon'),
    );
  }
}
