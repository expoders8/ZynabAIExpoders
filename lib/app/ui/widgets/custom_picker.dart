import 'package:flutter/cupertino.dart';

class CustomPicker extends StatelessWidget {
  final Function(int)? onSelect;
  final int lastNo;
  final int initialItem;

  const CustomPicker({
    super.key,
    this.onSelect,
    required this.lastNo,
    required this.initialItem,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      onSelectedItemChanged: onSelect,
      scrollController: FixedExtentScrollController(
        initialItem: initialItem,
      ),
      diameterRatio: 1.7,
      itemExtent: 60,
      // squeeze: .4,
      looping: true,
      children:
          // [
          //   for (int i = 1; i <= lastNo; i++)
          //     Center(
          //       child: Text(
          //         '$i',
          //         style: CustomTextStyle.kTextStyle20500.copyWith(
          //           color: Colors.black,
          //         ),
          //       ),
          //     )
          // ]

          List.generate(
        lastNo,
        (index) {
          return Center(
            child: Text(
              '$index',
              // style: CustomTextStyle.kTextStyle20500.copyWith(
              //   color: Colors.black,
              // ),
            ),
          );
        },
      ),
    );
  }
}
