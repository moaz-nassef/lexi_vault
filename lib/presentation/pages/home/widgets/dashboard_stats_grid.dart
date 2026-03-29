import 'package:flutter/material.dart';

class DashboardStatsGrid extends StatelessWidget {
  const DashboardStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.3,
        children: [
          _buildStatCard("Total Clients", "124", Icons.people_alt, isDark ? Colors.blue.shade900.withOpacity(0.3) : Colors.blue.shade50, Colors.blue.shade600),
          _buildStatCard("Total Cases", "56", Icons.gavel, isDark ? Colors.indigo.shade900.withOpacity(0.4) : Colors.indigo.shade50, Colors.indigo.shade600),
          _buildStatCard("Upcoming", "04", Icons.calendar_today, isDark ? Colors.amber.shade900.withOpacity(0.3) : Colors.amber.shade50, Colors.amber.shade600),
          _buildStatCard("Overdue", "02", Icons.attach_money, isDark ? Colors.pink.shade900.withOpacity(0.3) : Colors.pink.shade50, Colors.pink.shade600),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String count, IconData icon, Color bgColor, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const Spacer(),
          Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey.shade600)),
          Text(count, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
