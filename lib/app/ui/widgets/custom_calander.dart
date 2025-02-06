import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zynabaiexpoders/config/constant/color_constant.dart';
import 'package:zynabaiexpoders/config/constant/font_constant.dart';

class CustomCalendar extends StatefulWidget {
  final Function(DateTime)? onDateSelected;
  CustomCalendar({super.key, this.onDateSelected});

  @override
  CustomCalendarState createState() => CustomCalendarState();
}

class CustomCalendarState extends State<CustomCalendar> {
  DateTime selectedDate = DateTime.now();
  List<DateTime> highlightedDates = [
    DateTime(2025, 2, 5),
    DateTime(2025, 2, 10),
    DateTime(2025, 2, 16),
    DateTime(2025, 2, 26),
    DateTime(2025, 3, 5),
    DateTime(2025, 3, 10),
    DateTime(2025, 3, 16),
    DateTime(2025, 3, 26),
    DateTime(2025, 4, 5),
    DateTime(2025, 4, 10),
    DateTime(2025, 4, 16),
    DateTime(2025, 4, 26),
    DateTime(2025, 5, 5),
    DateTime(2025, 5, 10),
    DateTime(2025, 5, 16),
    DateTime(2025, 5, 26),
    DateTime(2025, 6, 5),
    DateTime(2025, 6, 10),
    DateTime(2025, 6, 16),
    DateTime(2025, 6, 26),
    DateTime(2025, 7, 5),
    DateTime(2025, 7, 10),
    DateTime(2025, 7, 16),
    DateTime(2025, 7, 26),
  ];
  PageController _pageController = PageController();
  int currentMonth = 0;
  @override
  void initState() {
    currentMonth = DateTime.now().month;
    _pageController = PageController(initialPage: currentMonth - 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 395,
        width: Get.width,
        child: PageView.builder(
          controller: _pageController,
          // itemCount: 12,
          // itemBuilder: (context, index) {
          //   return buildMonthView(index + 1);
          // },
          itemCount: 12 - (currentMonth - 1),
          itemBuilder: (context, index) {
            return buildMonthView(currentMonth + index);
          },
        ),
      ),
    );
  }

  Widget buildMonthView(int month) {
    DateTime firstDayOfMonth = DateTime(DateTime.now().year, month, 1);
    int daysInMonth = DateUtils.getDaysInMonth(DateTime.now().year, month);
    List<Widget> dayWidgets = [];

    // Add empty widgets for days of the week before the first day of the month
    int startWeekday =
        (firstDayOfMonth.weekday + 6) % 7; // Adjusting to start week on Monday
    for (int i = 0; i < startWeekday; i++) {
      dayWidgets.add(Container());
    }

    for (int i = 0; i < daysInMonth; i++) {
      DateTime date = firstDayOfMonth.add(Duration(days: i));
      bool isHighlighted = highlightedDates.any((highlightedDate) =>
          highlightedDate.year == date.year &&
          highlightedDate.month == date.month &&
          highlightedDate.day == date.day);

      dayWidgets.add(
        GestureDetector(
          onTap: () {
            if (isHighlighted) {
            } else {
              DateTime now = DateTime.now();
              DateTime today = DateTime(now.year, now.month, now.day);
              DateTime selectedDay = DateTime(date.year, date.month, date.day);

              if (selectedDay.isBefore(today)) {
                return; // Prevent selecting past dates
              }

              setState(() {
                selectedDate = date;
              });
              print(widget.onDateSelected);
              if (widget.onDateSelected != null) {
                widget.onDateSelected!(date); // Pass selected date to parent
              }
            }
          },
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isHighlighted
                  ? Colors.yellow
                  : selectedDate == date
                      ? Colors.black
                      : Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${date.day}',
                style: TextStyle(
                  color: isHighlighted
                      ? Colors.black
                      : selectedDate == date
                          ? Colors.white
                          : Colors.black,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              DateFormat('MMMM yyyy').format(firstDayOfMonth),
              style: const TextStyle(
                  fontSize: 20,
                  color: kPrimaryColor,
                  fontFamily: kCircularStdMedium),
            ),
            const SizedBox(height: 5),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('M'),
                Text('T'),
                Text('W'),
                Text('T'),
                Text('F'),
                Text('S'),
                Text('S'),
              ],
            ),
            const SizedBox(height: 5),
            Expanded(
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 7,
                children: dayWidgets,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
