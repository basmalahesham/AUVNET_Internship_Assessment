import 'package:auvnet_flutter_internship_assessment/core/theming/colors.dart';
import 'package:auvnet_flutter_internship_assessment/features/home/presentation/views/home_view.dart';
import 'package:auvnet_flutter_internship_assessment/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;
  List<Widget> screenWidgets = [
    HomeView(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenWidgets[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.imagesHome,
              width: 24,
              height: 24,
            ),
            activeIcon: Image.asset(
              Assets.imagesHome,
              width: 24,
              height: 24,
            ),            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.imagesCategories)),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.imagesDeliver)),
            label: 'Deliver',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.imagesCart)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.imagesProfile)),
            label: 'Profile',
          ),
        ],
        backgroundColor: Colors.white,
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
        ),
        selectedItemColor: ColorsManager.kPrimaryColor,
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
        ),
        unselectedItemColor: Color(0xFF484C52),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(
          color: ColorsManager.kPrimaryColor,
          size: 24,
        ),
        unselectedIconTheme: const IconThemeData(
          color: Color(0xFF484C52),
          size: 24,
        ),
      ),
    );
  }
}
