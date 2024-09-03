import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/controllers.dart';
import 'widgets/body_calendar_view.dart';
import 'widgets/head_calendar_view.dart';
import '../../shared/shared.dart';
import 'page/add_new_event.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key, required this.user});

  final UserDataController user;

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  bool isEmpty = true;
  ScrollController scrollController = ScrollController();
  bool _isAtTop = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels == 0) {
        setState(() {
          _isAtTop = true;
        });
      } else {
        setState(() {
          _isAtTop = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarController>(
      builder: (context, calendar, child) {
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const HeadCalendarView(),
                BodyCalendarView(
                  calendar: calendar,
                  scrollController: scrollController,
                ),
              ],
            ),
          ),
          floatingActionButton: _isAtTop || isEmpty
              ? CustomFAB(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddNewEventPage(
                          user: widget.user,
                          calendar: calendar,
                        ),
                      ),
                    );
                  },
                  icon: AppIcons.addEvent,
                )
              : CustomFABMini(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddNewEventPage(
                          user: widget.user,
                          calendar: calendar,
                        ),
                      ),
                    );
                  },
                  icon: AppIcons.addEvent,
                ),
        );
      },
    );
  }
}
