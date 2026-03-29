import 'package:flutter/material.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/dashboard_stats_grid.dart';
import 'widgets/dashboard_quick_actions.dart';
import 'widgets/dashboard_upcoming_sessions.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardHeader(),
              SizedBox(height: 16),
              DashboardStatsGrid(),
              SizedBox(height: 16),
              DashboardQuickActions(),
              SizedBox(height: 24),
              DashboardUpcomingSessions(),
            ],
          ),
        ),
      ),
    );
  }
}
