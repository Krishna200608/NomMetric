import 'package:flutter/material.dart';
import '../widgets/mealCard_Krishna.dart';

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
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: hPad, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row: greeting + avatar
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
                            fontWeight: FontWeight.w800,
                            color: primaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // avatar
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(Icons.person, color: Colors.blue),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Search + action chips
              Row(
                children: [
                  Expanded(child: _SearchBar()),
                  const SizedBox(width: 12),
                  _IconCircle(icon: Icons.mic),
                ],
              ),

              const SizedBox(height: 18),

              // Notification banner (big)
              _NotificationBanner(),

              const SizedBox(height: 18),

              // Quick overview cards (horizontal scroll)
              SizedBox(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    SizedBox(width: 4),
                    OverviewCard(
                      title: "Breakfast",
                      value: "Served",
                      icon: Icons.breakfast_dining,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 12),
                    OverviewCard(
                      title: "Lunch",
                      value: "Available",
                      icon: Icons.lunch_dining,
                      color: Colors.teal,
                    ),
                    SizedBox(width: 12),
                    OverviewCard(
                      title: "Dinner",
                      value: "Special",
                      icon: Icons.dinner_dining,
                      color: Colors.purple,
                    ),
                    SizedBox(width: 4),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // Today's Menu header + filter chips
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today's Menu",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryText,
                    ),
                  ),
                  Row(
                    children: const [
                      _SmallChip(label: "All", selected: true),
                      SizedBox(width: 8),
                      _SmallChip(label: "Breakfast"),
                      SizedBox(width: 8),
                      _SmallChip(label: "Lunch"),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Meal list (scrollable)
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    MealCardKrishna(
                      mealName: "Aloo Paratha & Curd",
                      mealTime: "Breakfast • 8:00 - 9:30 AM",
                      icon: Icons.restaurant,
                      calories: "High Protein",
                    ),
                    SizedBox(height: 12),
                    MealCardKrishna(
                      mealName: "Rajma Chawal",
                      mealTime: "Lunch • 12:30 - 2:00 PM",
                      icon: Icons.rice_bowl,
                      calories: "Spicy",
                    ),
                    SizedBox(height: 12),
                    MealCardKrishna(
                      mealName: "Kadhai Paneer",
                      mealTime: "Dinner • 7:30 - 9:00 PM",
                      icon: Icons.local_dining,
                      calories: "Special",
                    ),
                    SizedBox(height: 18),

                    // Calendar strip + upcoming card
                    _CalendarStrip(),
                    SizedBox(height: 12),
                    _UpcomingCard(),
                    SizedBox(height: 80), // bottom padding for FAB
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* ---------------- COMPONENTS ---------------- */

class _SearchBar extends StatelessWidget {
  const _SearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: const [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Search menu, events...',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ),
          Icon(Icons.tune, color: Colors.grey),
        ],
      ),
    );
  }
}

class _IconCircle extends StatelessWidget {
  final IconData icon;
  const _IconCircle({super.key, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(child: Icon(icon, color: Colors.grey[700])),
    );
  }
}

class _NotificationBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2F8CF3), Color(0xFF2AA0F2)],
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.18),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.notifications, color: Colors.white),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mess Rebate Open",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Apply before Jan 25",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.white70),
        ],
      ),
    );
  }
}

class OverviewCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  const OverviewCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(14),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color.withOpacity(0.95), color.withOpacity(0.7)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Text(value, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "View details",
                style: TextStyle(fontSize: 12, color: Colors.blue),
              ),
              Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[400]),
            ],
          ),
        ],
      ),
    );
  }
}

class _SmallChip extends StatelessWidget {
  final String label;
  final bool selected;
  const _SmallChip({super.key, required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? Colors.blue.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected
              ? Colors.blue.shade200
              : Colors.grey.withOpacity(0.12),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.blue : Colors.grey[700],
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _CalendarStrip extends StatelessWidget {
  const _CalendarStrip({super.key});
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return SizedBox(
      height: 82,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 9,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, i) {
          final d = today.add(Duration(days: i));
          final isToday = i == 0;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              width: 84,
              decoration: BoxDecoration(
                color: isToday ? Colors.blue.shade50 : Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    [
                      "Sun",
                      "Mon",
                      "Tue",
                      "Wed",
                      "Thu",
                      "Fri",
                      "Sat",
                    ][d.weekday % 7],
                    style: TextStyle(
                      color: isToday ? Colors.blue : Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    d.day.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isToday ? Colors.blue : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _UpcomingCard extends StatelessWidget {
  const _UpcomingCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Icon(Icons.calendar_today, color: Colors.purple.shade400),
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
            " RSVP",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
