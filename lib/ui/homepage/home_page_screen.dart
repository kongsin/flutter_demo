import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/enums/navigation_bar_menu.dart';
import 'package:todolist/ui/banner_widget//home_banner.dart';
import 'package:todolist/ui/categories_widget/home_categories.dart';
import 'package:todolist/ui/homepage/page_booking.dart';
import 'package:todolist/ui/homepage/page_main.dart';
import 'package:todolist/ui/homepage/page_notification.dart';
import 'package:todolist/ui/homepage/page_profile.dart';
import 'package:todolist/ui/homepage/page_schedule.dart';
import 'package:todolist/ui/merchandise_widget/merchandise_item.dart';
import 'package:todolist/ui/recommend_widget/recommend_menu.dart';
import '../../enums/home_page_item_type.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends ConsumerState<HomePageScreen> {

  int _currentPage = 0;

  final pages = [
    PageMain(),
    PageNotification(),
    PageSchedule(),
    PageBooking(),
    PageProfile()
  ];

  void setPageSection(index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        type: BottomNavigationBarType.fixed,
        onTap: _onNavigationBarTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: "Notification"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Schedule"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Booking"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: pages[_currentPage],
    );
  }

  void _onNavigationBarTab(int index) {
    switch(NavigationBarMenu.from(index)) {
      case NavigationBarMenu.HOME: {
        setPageSection(NavigationBarMenu.HOME.position);
      };
      case NavigationBarMenu.NOTIFICATION: {
        setPageSection(NavigationBarMenu.NOTIFICATION.position);
      };
      case NavigationBarMenu.SCHEDULE: {
        setPageSection(NavigationBarMenu.SCHEDULE.position);
      };
      case NavigationBarMenu.BOOKING: {
        setPageSection(NavigationBarMenu.BOOKING.position);
      };
      case NavigationBarMenu.PROFILE: {
        setPageSection(NavigationBarMenu.PROFILE.position);
      };
    }
  }

}
