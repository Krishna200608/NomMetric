import 'package:flutter/material.dart';

class HomeScreenKrishna extends StatelessWidget {
  const HomeScreenKrishna({super.key});

  static const Color bg = Color(0xFFF5F6FA);
  static const Color primaryText = Color(0xFF2D3142);
  static const double hPad = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: hPad, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- 1. Header Section ---
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Good Morning, 👋",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Krishna Sikheirya",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: primaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      // FIXED: Using foregroundImage to properly handle the fallback
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.blue.shade50,
                        // 'foregroundImage' renders ON TOP of the child.
                        // If it loads, you see "KS". If it fails, you see the child (Icon).
                        foregroundImage: const NetworkImage(
                          'https://ui-avatars.com/api/?name=Krishna+S&background=random',
                        ),
                        onForegroundImageError: (_, __) {},
                        child: const Icon(Icons.person, color: Colors.blue),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // --- 2. Notification Banner ---
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.indigo.shade600, Colors.blue.shade500],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.notifications_active_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mess Rebate Open",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Apply before 25 Jan",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white70,
                        size: 16,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // --- 3. Today's Overview (Stats) ---
                const Text(
                  "Today at a Glance",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryText,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        "Breakfast",
                        "Done",
                        Icons.check_circle,
                        Colors.green,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildStatCard(
                        "Lunch",
                        "Available",
                        Icons.access_time_filled,
                        Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildStatCard(
                        "Dinner",
                        "Special",
                        Icons.star_rounded,
                        Colors.purple,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // --- 4. Today's Meals List ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Today's Meals",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryText,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("View Menu"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  children: const [
                    // Using the private placeholder class
                    _MealCardPlaceholder(
                      mealName: "Poha & Jalebi",
                      mealTime: "Breakfast • 8:00 - 9:30 AM",
                      icon: Icons.breakfast_dining,
                      calories: "Sweet",
                    ),
                    SizedBox(height: 12),
                    _MealCardPlaceholder(
                      mealName: "Rajma Chawal",
                      mealTime: "Lunch • 12:30 - 2:00 PM",
                      icon: Icons.rice_bowl,
                      calories: "Favorite",
                    ),
                    SizedBox(height: 12),
                    _MealCardPlaceholder(
                      mealName: "Egg Curry / Paneer",
                      mealTime: "Dinner • 7:30 - 9:00 PM",
                      icon: Icons.dinner_dining,
                      calories: "High Protein",
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // --- 5. Upcoming Event ---
                const Text(
                  "Upcoming",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryText,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.calendar_today,
                          color: Colors.purple.shade400,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Special Dinner Tomorrow",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Biryani Night • 7:30 PM",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "RSVP",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String label,
    String status,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            status,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

// --- PRIVATE PLACEHOLDER CLASS ---
class _MealCardPlaceholder extends StatelessWidget {
  final String mealName;
  final String mealTime;
  final IconData icon;
  final String calories;

  const _MealCardPlaceholder({
    required this.mealName,
    required this.mealTime,
    required this.icon,
    required this.calories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          // Gradient Icon Box
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [Color(0xFFFFA726), Color(0xFFFF7043)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.withOpacity(0.12),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 16),

          // Text Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mealName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.schedule, size: 14, color: Colors.grey),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        mealTime,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF4EA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              calories,
              style: const TextStyle(
                color: Color(0xFFFF8A3D),
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
