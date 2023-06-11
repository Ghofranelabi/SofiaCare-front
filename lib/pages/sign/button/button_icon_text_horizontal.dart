import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonIconTextHorizontal extends StatelessWidget {
  const ButtonIconTextHorizontal({
    Key? key,
    required this.color,
    required this.onTap,
    this.icon,
  }) : super(key: key);

  final String? icon;

  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            icon != null ? SvgPicture.asset(icon!, height: 20) : Container(),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
