import 'package:flutter/material.dart';

class CheckBoxText extends StatelessWidget {
  const CheckBoxText({
    Key? key,
    required this.value,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  final bool value;
  final String text;
  final Function(bool state) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 24.0,
          width: 24.0,
          child: Checkbox(
            checkColor: Colors.white,
            value: value,
            onChanged: (bool? value) {
              if (value != null) {
                onChanged(value);
              }
            },
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
