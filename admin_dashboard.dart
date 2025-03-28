import 'package:flutter/material.dart';
import '/sidebar.dart';
import 'dashboard_page.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  Widget _selectedPage = const DishPage(); // Default page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Bar
          Container(
            height: 60,
            color: Colors.blueGrey[900],
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("POS Restaurant", style: TextStyle(color: Colors.white, fontSize: 18)),
                Row(
                  children: [
                    const Icon(Icons.account_circle, color: Colors.white, size: 28),
                    const SizedBox(width: 10),
                    ElevatedButton(onPressed: () {}, child: const Text("Log Out"))
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Sidebar(onMenuSelected: (page) {
                  setState(() {
                    _selectedPage = page;
                  });
                }),
                Expanded(
                  child: _selectedPage, // Only this area changes
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
