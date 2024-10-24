import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/controllers.dart';
import 'widgets/bottom_appbar_view.dart';
import '../../shared/shared.dart';
import 'drawer/mi_drawer.dart';
import '../views.dart';

class Wrapper extends StatelessWidget {
  final UserDataController user;
  final MainController controller;
  const Wrapper({
    super.key,
    required this.user,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    customSystemChrome(controller);
    final List<IconData> selectedIcons = [
      AppIcons.homeB,
      AppIcons.calendarB,
      AppIcons.chatB,
    ];
    final List<IconData> unselectedIcons = [
      AppIcons.home,
      AppIcons.calendar,
      AppIcons.chat,
    ];
    final List<String> labels = ["Home", "Calendrier", "Chat"];
    final List<int> indexes = [0, 1, 2];
    final List<String> badgeContents = ["", "", ""];
    final List<double> bottomHeight = [95, 50, 50];
    final List<Widget> screens = [
      const HomePage(),
      CalendarPage(user: user),
      ChatList(user: user, controller: controller),
    ];
    // int chatNotifLength = 0;
    // for (var chatData in chatListData.where((chatData) => !chatData.isRead)) {
    //   chatNotifLength += chatData.lastMsgTotal!;
    // }

    final bckGroundColor = Theme.of(context).unselectedWidgetColor.withOpacity(
          0.2,
        );
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: bckGroundColor,
        actions: [
          GestureDetector(
            // onTap: () async {
            //   await UserAPI.userDeleted(user.userID);
            // },
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationPage(),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              color: Colors.transparent,
              padding: const EdgeInsets.only(left: 15, right: 15),
              margin: const EdgeInsets.only(right: 10),
              child: CustomBadge(
                content: badgeContents[controller.index],
                icon: AppIcons.notification,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.maxFinite, bottomHeight[controller.index]),
          child: BottomAppBarView(user: user, controller: controller),
        ),
      ),
      drawer: MiDrawer(user: user, controller: controller),
      body: SafeArea(child: screens[controller.index]),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: 70,
          elevation: 0,
          indicatorColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          labelTextStyle: WidgetStatePropertyAll(
            GoogleFonts.raleway(
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              fontSize: 12,
            ),
          ),
          iconTheme: WidgetStatePropertyAll(IconThemeData(
            color: Theme.of(context).unselectedWidgetColor,
          )),
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        ),
        child: NavigationBar(
          animationDuration: const Duration(microseconds: 500),
          onDestinationSelected: (i) => controller.navigationController(i),
          selectedIndex: controller.index,
          backgroundColor: bckGroundColor,
          destinations: indexes.map((index) {
            return NavigationDestination(
              icon: index == 2
                  ? CustomBadge(
                      icon: unselectedIcons[index],
                      content: '',
                    )
                  : Icon(unselectedIcons[index]),
              selectedIcon: Icon(
                selectedIcons[index],
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              label: labels[index],
              tooltip: labels[index],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Wrapper2 extends StatelessWidget {
  final UserDataController user;
  final MainController controller;
  const Wrapper2({
    super.key,
    required this.user,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    customSystemChrome(controller);
    final List<IconData> selectedIcons = [
      AppIcons.homeB,
      AppIcons.calendarB,
      AppIcons.chatB,
    ];
    final List<IconData> unselectedIcons = [
      AppIcons.home,
      AppIcons.calendar,
      AppIcons.chat,
    ];
    final List<String> labels = ["Home", "Calendrier", "Chat"];
    final List<int> indexes = [0, 1, 2];
    final List<String> badgeContents = ["", "", ""];
    final List<double> bottomHeight = [95, 50, 50];
    final List<Widget> screens = [
      const HomePage(),
      CalendarPage(user: user),
      ChatView(user: user, controller: controller),
    ];
    // int chatNotifLength = 0;
    // for (var chatData in chatListData.where((chatData) => !chatData.isRead)) {
    //   chatNotifLength += chatData.lastMsgTotal!;
    // }

    final bckGroundColor = Theme.of(context).unselectedWidgetColor.withOpacity(
          0.2,
        );

    return Scaffold(
      extendBody: true,
      appBar: controller.index == 2 && user.owner != null
          ? null
          : AppBar(
              backgroundColor: bckGroundColor,
              actions: [
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationPage(),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    margin: const EdgeInsets.only(right: 10),
                    child: CustomBadge(
                      content: badgeContents[controller.index],
                      icon: AppIcons.notification,
                    ),
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize:
                    Size(double.maxFinite, bottomHeight[controller.index]),
                child: BottomAppBarView(user: user, controller: controller),
              ),
            ),
      drawer: controller.index == 2
          ? null
          : MiDrawer(user: user, controller: controller),
      body: SafeArea(child: screens[controller.index]),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: 70,
          elevation: 0,
          indicatorColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          labelTextStyle: WidgetStatePropertyAll(
            GoogleFonts.raleway(
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              fontSize: 12,
            ),
          ),
          iconTheme: WidgetStatePropertyAll(IconThemeData(
            color: Theme.of(context).unselectedWidgetColor,
          )),
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        ),
        child: NavigationBar(
          animationDuration: const Duration(microseconds: 500),
          onDestinationSelected: (i) => controller.navigationController(i),
          backgroundColor: bckGroundColor,
          selectedIndex: controller.index,
          destinations: indexes.map((index) {
            return NavigationDestination(
              icon: index == 2
                  ? CustomBadge(
                      icon: unselectedIcons[index],
                      content: '',
                    )
                  : Icon(unselectedIcons[index]),
              selectedIcon: Icon(
                selectedIcons[index],
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              label: labels[index],
              tooltip: labels[index],
            );
          }).toList(),
        ),
      ),
    );
  }
}
