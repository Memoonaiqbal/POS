import 'package:flutter/material.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  int monthlySales = 550000;
  int weeklySales = 95000;
  int dailySales = 11000;
  

  void resetMonthlySales() {
    setState(() {
      monthlySales = 0;
    });
  }

  void resetWeeklySales() {
    setState(() {
      weeklySales = 0;
    });
  }

    void resetDailySales() {
    setState(() {
      dailySales = 0;
    });
  }

  void resetAll() {
    setState(() {
      monthlySales = 0;
      dailySales = 0;
      weeklySales = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          "Reset Options",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 96, 140, 162),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildResetCard(
              title: "Monthly Sales",
              value: "Rs $monthlySales",
              icon: Icons.trending_up,
              color: const Color.fromARGB(255, 104, 205, 153),
              onReset: resetMonthlySales,
            ),
            _buildResetCard(
              title: "Weekly  Sales",
              value: "Rs $weeklySales",
              icon: Icons.trending_up,
              color: Colors.blueAccent,
              onReset: resetWeeklySales,
            ),
            _buildResetCard(
              title: "Daily Sales",
              value: "Rs $dailySales ",
              icon: Icons.trending_up,
              color: const Color.fromARGB(255, 45, 20, 206),
              onReset: resetDailySales,
            ),
          ],
        ),
      ),

      // Floating Action Button for Reset All
      floatingActionButton: FloatingActionButton.extended(
        onPressed: resetAll,
        backgroundColor: Colors.red.shade600,
        icon: const Icon(Icons.restore, color: Colors.white),
        label: const Text("Reset All", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black,)),
      ),
    );
  }

  Widget _buildResetCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required VoidCallback onReset,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: color.withOpacity(0.2),
                  child: Icon(icon, color: color, size: 28),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: onReset,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
