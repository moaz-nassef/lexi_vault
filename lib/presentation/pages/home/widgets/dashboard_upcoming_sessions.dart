import 'package:flutter/material.dart';

class DashboardUpcomingSessions extends StatelessWidget {
  const DashboardUpcomingSessions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Upcoming Sessions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 8),
          _buildSessionCard(
            context,
            month: "OCT", day: "12",
            name: "Ahmed Al-Mansouri", caseInfo: "Case #LX-9022 • Civil Court",
            time: "09:30 AM", status: "Confirmed",
            dateColor: Colors.blue.shade100, dateTextColor: Colors.blue.shade700,
            statusColor: Colors.green.shade100, statusTextColor: Colors.green.shade800,
          ),
          const SizedBox(height: 12),
          _buildSessionCard(
            context,
            month: "OCT", day: "14",
            name: "Mariam Hassan", caseInfo: "Case #LX-1104 • Supreme Court",
            time: "11:00 AM", status: "Pending",
            dateColor: Colors.grey.shade100, dateTextColor: Colors.grey.shade600,
            statusColor: Colors.amber.shade100, statusTextColor: Colors.amber.shade800,
          ),
          const SizedBox(height: 12),
          _buildSessionCard(
            context,
            month: "OCT", day: "15",
            name: "Khalid Rashid", caseInfo: "Case #LX-8821 • District Court",
            time: "02:15 PM", status: null,
            dateColor: Colors.grey.shade100, dateTextColor: Colors.grey.shade600,
            opacity: 0.6,
          ),
          const SizedBox(height: 140), // Padding to clear Floating Action Button entirely
        ],
      ),
    );
  }

  Widget _buildSessionCard(
    BuildContext context, {
    required String month, required String day, required String name, required String caseInfo,
    required String time, String? status,
    required Color dateColor, required Color dateTextColor,
    Color? statusColor, Color? statusTextColor,
    double opacity = 1.0,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Opacity(
      opacity: opacity,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E293B) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: isDark ? Colors.grey.shade800 : Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Container(
              width: 56, height: 56,
              decoration: BoxDecoration(color: isDark ? dateColor.withOpacity(0.15) : dateColor, borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(month, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: dateTextColor)),
                  Text(day, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: dateTextColor)),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(caseInfo, style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(time, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF2563EB))),
                if (status != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(color: statusColor, borderRadius: BorderRadius.circular(4)),
                    child: Text(status, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: statusTextColor)),
                  ),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
