import 'package:flutter/material.dart';

class MealCardIshanrajsingh extends StatelessWidget {
  final String mealName;
  final String mealType;
  final IconData icon;

  const MealCardIshanrajsingh({
    super.key,
    this.mealName = 'Meal Name',
    this.mealType = 'Breakfast',
    this.icon = Icons.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Icon Section
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                size: 26,
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(width: 16),

            // Text Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mealName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  mealType,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
