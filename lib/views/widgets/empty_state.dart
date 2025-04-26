import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 80,
            color: isDark ? Colors.grey.shade600 : Colors.grey.shade400,
          ),
          SizedBox(height: 16),
          Text(
            'No tasks yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Add a new task using the button below',
            style: TextStyle(
              color: isDark ? Colors.grey.shade500 : Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}