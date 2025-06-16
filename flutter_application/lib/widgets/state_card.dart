import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title, value, unit;
  final Icon? icon;
  final Color? color;
  const StatCard({super.key, required this.title, required this.value, required this.unit, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:color?? Colors.blue[700],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)),
              const SizedBox(height: 6),
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              Text(unit, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
Icon(
            icon?.icon ?? Icons.bar_chart,
            color:icon?.color ?? Colors.white,
            size: icon?.size ?? 30,
          ),
        ],
      ),
    );
  }
}

