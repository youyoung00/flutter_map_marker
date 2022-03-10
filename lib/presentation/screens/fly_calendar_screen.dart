import 'package:flutter/material.dart';
import 'package:flutter_map_marker/constants.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class FlyCalendarScreen extends StatefulWidget {
  // static String routeName = '/calendar';

  const FlyCalendarScreen({Key? key}) : super(key: key);

  @override
  State<FlyCalendarScreen> createState() => _FlyCalendarScreenState();
}

class _FlyCalendarScreenState extends State<FlyCalendarScreen> {
  String title = 'Select Date';
  DateTime test = DateTime.now();
  DateTime test2 = DateTime.now();

  late final calendarController;

  void setTitle(DateTime date1, [DateTime? date2]) {
    setState(() {
      if (date2 != null) {
        title = '${date1.month}/${date1.day}  -  ${date2.month}/${date2.day}';
      } else {
        title = '${date1.month}/${date1.day}';
      }
    });
  }

  @override
  void initState() {
    calendarController = CleanCalendarController(
      minDate: DateTime.now(),
      maxDate: DateTime.now().add(const Duration(days: 365)),
      onRangeSelected: (test, test2) => setTitle(test, test2),
      onDayTapped: (date) {},
      onPreviousMinDateTapped: (test) {},
      onAfterMaxDateTapped: (test) {},
      weekdayStart: DateTime.monday,
      initialDateSelected: DateTime.now(),
      endDateSelected: DateTime.now(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrollable Clean Calendar',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: themeColor,
          primaryVariant: Color(0xFF002984),
          secondary: Color(0xFFD32F2F),
          secondaryVariant: Color(0xFF9A0007),
          surface: Color(0xFFDEE2E6),
          background: Color(0xFFF8F9FA),
          error: Color(0xFF96031A),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                calendarController.clearSelectedDates();
              },
              icon: const Icon(Icons.clear),
            )
          ],
        ),
        body: ScrollableCleanCalendar(
          calendarController: calendarController,
          layout: Layout.BEAUTY,
          calendarCrossAxisSpacing: 0,
        ),
      ),
    );
  }
}
