import 'package:flutter/material.dart';
import 'package:movies/generated/l10n.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.heart_broken,
            size: 80,
            color: Colors.pink.withValues(alpha: 0.5),
          ),
          SizedBox(height: 16),
          Text(
            S.of(context).no_favourite_movies,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            S.of(context).start_adding_movies,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
