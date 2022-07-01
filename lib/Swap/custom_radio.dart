import 'package:flutter/material.dart';
import 'package:acy_ipay/widget/CustomText.dart';
class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String leading;
  final bool needInput;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.needInput,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    Widget _customRadioButton = Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xE61B1D1C) : null,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected ? Color(0xFFFFC000) : Color(0xF26A6E6D),
          width: 1.5,
        ),
      ),
      child: Center(
        child: CustomText(
          leading,
            textColor: Color(0xFFF4F4F4),
            fontWeight: FontWeight.w600,
            fontSize: 18,
        ),
      ),
    );

    final controller = TextEditingController();
    return InkWell(
      onTap: () {
        onChanged(value);
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: needInput
          ? ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 80, height: 45),
              child: TextField(
                  onTap: () {
                    onChanged(value);
                  },
                  controller: controller,
                  textAlign: TextAlign.center,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: "Input",
                    hintStyle: TextStyle(
                        color: Color(0xFFF4F4F4),
                        fontWeight: FontWeight.w600),
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.only(top: 8),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xF26A6E6D), width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder: isSelected
                        ? OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFFFC000), width: 1.5))
                        : InputBorder.none,
                  )),
            )
          : Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              height: 45,
              width: 60,
              child: _customRadioButton,
            ),
    );
  }
}
