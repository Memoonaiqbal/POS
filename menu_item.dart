import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget page;
  final Function(Widget) onTap;

  const MenuItem({super.key, required this.title, required this.icon, required this.page, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        onTap(page);
      },
    );
  }
}
