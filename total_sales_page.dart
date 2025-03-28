import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TotalSalesPage extends StatefulWidget {
  const TotalSalesPage({super.key});

  @override
  _TotalSalesPageState createState() => _TotalSalesPageState();
}

class _TotalSalesPageState extends State<TotalSalesPage> {
  String selectedTimeframe = "Last Month"; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TOTAL SALES CONTAINER
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
              ),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.bar_chart, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        " TOTAL SALES",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        " Rs 550,650.00",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // BAR CHART CONTAINER
            Container(
              height: 340,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: BarChart(
                      BarChartData(
                        barGroups: _getBarGroups(),
                        titlesData: FlTitlesData(
                          leftTitles: const AxisTitles(
                            axisNameWidget: Text("Sales Count", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                          ),
                          bottomTitles: AxisTitles(
                            axisNameWidget: Text(
                              selectedTimeframe == "Last Month" ? "Dish Name" : "Daily Dishes",
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                final labels = selectedTimeframe == "Last Month"
                                    ? ["Biryani", "Burger", "Pasta", "Pulao", "Salan", "Juices", "Salad", "Fries", "Wraps", "Roti"]
                                    : ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6", "Day 7", "Day 8", "Day 9", "Day 10"];
                                return Text(labels[value.toInt()], style: const TextStyle(color: Colors.black54, fontSize: 12));
                              },
                              reservedSize: 22,
                            ),
                          ),
                          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        ),
                        borderData: FlBorderData(show: false),
                        gridData: const FlGridData(show: false),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // TIMEFRAME DROPDOWN
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        value: selectedTimeframe,
                        underline: Container(),
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
                        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        items: ["Last Month", "Daily Sales"].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedTimeframe = newValue;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // STAT CARDS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard("Total Sales", "Rs 55000", Icons.shopping_bag, Colors.purple, Colors.purple.shade100),
                _buildStatCard("Total Orders", "620", Icons.attach_money, Colors.orange, Colors.orange.shade100),
                _buildStatCard("Sales Of Last 30 Days", "Rs 700000", Icons.receipt, Colors.red, Colors.red.shade100),
                _buildStatCard("Monthly Customers", "800", Icons.person, Colors.green, Colors.green.shade100),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // FUNCTION TO GENERATE BAR GROUP DATA
  List<BarChartGroupData> _getBarGroups() {
    final salesData = selectedTimeframe == "Last Month"
        ? [15, 25, 40, 35, 20, 30, 10, 18, 28, 22] // Last Month Sales
        : [8, 12, 18, 10, 6, 14, 20, 9, 15, 11]; // Daily Sales

    return salesData.asMap().entries.map((entry) {
      return BarChartGroupData(
        x: entry.key,
        barRods: [
          BarChartRodData(
            toY: entry.value.toDouble(),
            color: Colors.blue,
            width: 22,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    }).toList();
  }

  // STAT CARD WIDGET
  Widget _buildStatCard(String title, String value, IconData icon, Color iconColor, Color bgColor) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(20),
        height: 120,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: iconColor.withOpacity(0.2), shape: BoxShape.circle),
              child: Icon(icon, color: iconColor, size: 28),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(title, style: const TextStyle(fontSize: 13, color: Colors.black54)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
