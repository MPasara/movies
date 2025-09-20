import 'package:flutter/material.dart';

class GenreChip extends StatelessWidget {
  final String name;
  const GenreChip({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.65),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(name, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
