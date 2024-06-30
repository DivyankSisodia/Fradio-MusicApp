import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    super.key,
    required this.title,
    this.onPressed,
    this.isSelected = false,
  });

  final String title;
  final VoidCallback? onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Chip(
        shadowColor: Colors.grey.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor:
            isSelected ? Colors.green.shade400 : Colors.grey.shade300,
        label: Text(
          title,
          style: isSelected
              ? const TextStyle(
                  color: Colors.black,
                )
              : TextStyle(
                  color: Colors.grey.shade900,
                ),
        ),
      ),
    );
  }
}
