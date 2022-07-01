import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef void CounterChangeCallback(num value);

class Counter extends StatelessWidget {
  final CounterChangeCallback onChanged;

  Counter({
    Key? key,
    required num initialValue,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
    required this.decimalPlaces,
    required this.color,
    required this.textStyle,
    this.step = 1,
    this.buttonSize = 25,
  })  : assert(initialValue != null),
        assert(minValue != null),
        assert(maxValue != null),
        assert(maxValue > minValue),
        assert(initialValue >= minValue && initialValue <= maxValue),
        assert(step > 0),
        selectedValue = initialValue,
        super(key: key);

  ///min value user can pick
  final num minValue;

  ///max value user can pick
  final num maxValue;

  /// decimal places required by the counter
  final int decimalPlaces;

  ///Currently selected integer value
  num selectedValue;

  /// if min=0, max=5, step=3, then items will be 0 and 3.
  final num step;

  /// indicates the color of fab used for increment and decrement
  Color color;

  /// text style
  TextStyle textStyle;

  final double buttonSize;

  void _incrementCounter() {
    if (selectedValue + step <= maxValue) {
      onChanged((selectedValue + step));
    }
  }

  void _decrementCounter() {
    if (selectedValue - step >= minValue) {
      onChanged((selectedValue - step));
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    const IconData remove_circle_outline =
        IconData(0xe518, fontFamily: 'MaterialIcons');
    const IconData add_circle_outline =
        IconData(0xe050, fontFamily: 'MaterialIcons');
    color = color;
    textStyle = textStyle;

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      width: double.infinity,
      height: 50,
      color: Color(0xE61B1D1C),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: buttonSize,
            height: buttonSize,
            child: FloatingActionButton(
              onPressed: _decrementCounter,
              elevation: 2,
              tooltip: 'Decrement',
              child: Icon(remove_circle_outline,
                  color: Colors.grey.shade400, size: buttonSize),
              backgroundColor: color,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60),
            child: Text(
                '${num.parse((selectedValue).toStringAsFixed(decimalPlaces))}',
                style: textStyle),
          ),
          SizedBox(
            width: buttonSize,
            height: buttonSize,
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              elevation: 2,
              tooltip: 'Increment',
              child: Icon(add_circle_outline,
                  color: Colors.grey.shade400, size: buttonSize),
              backgroundColor: color,
            ),
          ),
        ],
      ),
    );
  }
}
