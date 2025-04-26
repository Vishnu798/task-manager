import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/task_controller.dart';

class TaskStats extends StatelessWidget {
  final TaskController taskController;

  const TaskStats({super.key, required this.taskController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatCard('Total', taskController.tasks.length.toString()),
            _buildStatCard('Active', taskController.activeCount.toString()),
            _buildStatCard(
              'Completed',
              taskController.completedCount.toString(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String count) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha:0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha:0.9),
            ),
          ),
        ],
      ),
    );
  }
}
