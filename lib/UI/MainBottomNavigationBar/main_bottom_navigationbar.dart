import 'package:findly/Core/Constant/colors.dart';
import 'package:findly/Core/Constant/text_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/Constant/assets_constant.dart';
import 'Views/BookMarks/bookmark_screen.dart';
import 'Views/Home/home_screen.dart';
import 'Views/Messages/messages_screen.dart';
import 'Views/Profile/profile_screen.dart';

class MainBottomNavigationbar extends StatefulWidget {
  const MainBottomNavigationbar({super.key});

  @override
  State<MainBottomNavigationbar> createState() =>
      _MainBottomNavigationbarState();
}

class _MainBottomNavigationbarState extends State<MainBottomNavigationbar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    const MessagesScreen(),
    const BookMarkScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.12),
              spreadRadius: 0,
              blurRadius: 48,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: Image.asset(
                    home,
                    width: 22,
                    height: 22,
                    color: _selectedIndex == 0 ? primaryColor : blackColor,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: Image.asset(
                    message,
                    width: 22.w,
                    height: 22.h,
                    color: _selectedIndex == 1 ? primaryColor : null,
                  ),
                ),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 7.h),
                  child: Image.asset(
                    blackheart,
                    width: 19.35.w,
                    height: 17.h,
                    color: _selectedIndex == 2 ? primaryColor : null,
                  ),
                ),
                label: 'Bookmarks',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: Image.asset(
                    bperson,
                    width: 16.w,
                    height: 16.75.h,
                    color: _selectedIndex == 3 ? primaryColor : null,
                  ),
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            backgroundColor: whiteColor,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            useLegacyColorScheme: false,
            selectedLabelStyle: workSansTextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: primaryColor,
            ),
            unselectedLabelStyle: workSansTextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: blackColor.withOpacity(0.5),
            ),
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}







//  BottomNavigationBarItem(
//                 icon: InkWell(
//                   splashColor: Colors.transparent,
//                   highlightColor: Colors.transparent,
//                   onTap: () => _onItemTapped(0),
//                   child: Padding(
//                     padding: EdgeInsets.only(bottom: 5.h),
//                     child: Image.asset(
//                       home,
//                       width: 24,
//                       height: 24,
//                       color: _selectedIndex == 0 ? primaryColor : blackColor,
//                     ),
//                   ),
//                 ),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: InkWell(
//                   splashColor: Colors.transparent,
//                   highlightColor: Colors.transparent,
//                   onTap: () => _onItemTapped(1),
//                   child: Padding(
//                     padding: EdgeInsets.only(bottom: 5.h),
//                     child: Image.asset(
//                       message,
//                       width: 24,
//                       height: 24,
//                       color: _selectedIndex == 1 ? primaryColor : blackColor,
//                     ),
//                   ),
//                 ),
//                 label: 'Message',
//               ),
//               BottomNavigationBarItem(
//                 icon: InkWell(
//                   splashColor: Colors.transparent,
//                   highlightColor: Colors.transparent,
//                   onTap: () => _onItemTapped(2),
//                   child: Padding(
//                     padding: EdgeInsets.only(bottom: 5.h),
//                     child: Image.asset(
//                       heart,
//                       width: 24,
//                       height: 24,
//                       color: _selectedIndex == 2 ? primaryColor : blackColor,
//                     ),
//                   ),
//                 ),
//                 label: 'Bookmarks',
//               ),
//               BottomNavigationBarItem(
//                 icon: InkWell(
//                   splashColor: Colors.transparent,
//                   highlightColor: Colors.transparent,
//                   onTap: () => _onItemTapped(3),
//                   child: Padding(
//                     padding: EdgeInsets.only(bottom: 5.h),
//                     child: Image.asset(
//                       person,
//                       width: 24,
//                       height: 24,
//                       color: _selectedIndex == 3 ? primaryColor : blackColor,
//                     ),
//                   ),
//                 ),
//                 label: 'Profile',
//               ),