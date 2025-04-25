import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/task_controller copy.dart';
import '../../controllers/task_controller.dart';
import '../../utils/app_theme.dart';

class FilterSection extends StatelessWidget {
  final TaskController taskController;
  
  const FilterSection({Key? key, required this.taskController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Obx(() => Row(
          children: [
            _buildFilterButton('All'),
            _buildFilterButton('Active'),
            _buildFilterButton('Completed'),
          ],
        )),
      ),
    );
  }
  
  Widget _buildFilterButton(String filterName) {
    return Expanded(
      child: GestureDetector(
        onTap: () => taskController.changeFilter(filterName),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: taskController.filter.value == filterName
                ? AppTheme.primaryColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            filterName,
            style: TextStyle(
              color: taskController.filter.value == filterName
                  ? Colors.white
                  : Colors.grey.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}