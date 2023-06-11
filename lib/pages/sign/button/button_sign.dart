import 'package:flutter/material.dart';

class ButtonSign extends StatelessWidget {
  const ButtonSign({
    Key? key,
    required this.text,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final String text;

  final void Function() onTap;

  /// Le bouton est sélectionné
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            text,
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Container(
              height: 2,
              decoration: isSelected == false
                  ? null
                  : const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.indigoAccent,
                          Colors.purpleAccent,
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
