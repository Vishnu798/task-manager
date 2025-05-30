import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/task_controller.dart';
import '../../controllers/task_controller.dart';

class FilterSection extends StatelessWidget {
  final TaskController taskController;
  
  const FilterSection({Key? key, required this.taskController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? Color(0xFF2A2A2A) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha:isDark ? 0.2 : 0.05),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Obx(() => Row(
          children: [
            _buildFilterButton('All', context),
            _buildFilterButton('Active', context),
            _buildFilterButton('Completed', context),
          ],
        )),
      ),
    );
  }
  
  Widget _buildFilterButton(String filterName, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Expanded(
      child: GestureDetector(
        onTap: () => taskController.changeFilter(filterName),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: taskController.filter.value == filterName
                ? Theme.of(context).primaryColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            filterName,
            style: TextStyle(
              color: taskController.filter.value == filterName
                  ? Colors.white
                  : isDark ? Colors.grey.shade300 : Colors.grey.shade700,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}