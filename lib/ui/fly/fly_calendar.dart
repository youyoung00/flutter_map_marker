import 'package:flutter/material.dart';
import 'package:flutter_map_marker/constants.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class Calendar extends StatefulWidget {
  static String routeName = '/calendar';

  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  String initDay = '';
  String endDay = '';

  num startYear = 0;
  int startMonth = 0;
  int startDay = 0;
  DateTime test = DateTime.now();
  DateTime test2 = DateTime.now();
  // DateTime initDays = DateTime(startYear, startMonth, startDay);

  final calendarController = CleanCalendarController(
    minDate: DateTime.now(),
    maxDate: DateTime.now().add(const Duration(days: 365)),
    onRangeSelected: (test, test2) {
      List result = [];
      // print(test);
      // print(test2);
      result.add(test);
      result.add(test2);

      return result;
    },
    onDayTapped: (date) {},
    onPreviousMinDateTapped: (test) {
      print(test);
    },
    onAfterMaxDateTapped: (date) {},
    weekdayStart: DateTime.monday,
    initialDateSelected: DateTime(2022, 2, 2),
    endDateSelected: DateTime(2022, 2, 22),
  );

  @override
  void initState() {
    initDay =
        calendarController.initialDateSelected.toString().substring(0, 10);
    endDay = calendarController.endDateSelected.toString().substring(0, 10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // selectedDates()

    List selDates = calendarController.onRangeSelected?.call(test, test2);
    // calendarController.o

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
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
            ),
          ),
          title: Text("$selDates"),
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
