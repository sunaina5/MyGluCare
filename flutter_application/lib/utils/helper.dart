import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatCheckedAt(DateTime? timestamp) {
  return timestamp != null
      ? DateFormat("MMM dd yyyy 'at' hh:mm a").format(timestamp)
      : 'N/A';
}

 Color getStatusColor(String? status) {
    switch (status) {
      case "Low":
        return Colors.orange;
      case "Normal":
        return Colors.green;
      case "High":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  double mgDlToMmolL(double mgDl) {
  return mgDl / 18.0;
}

double calculateBgMeanMmolL(List<double> bgValuesMgDl) {
  if (bgValuesMgDl.isEmpty) return 0.0;

  double totalMmolL = bgValuesMgDl
      .map((bg) => mgDlToMmolL(bg))
      .reduce((a, b) => a + b);

  return totalMmolL / bgValuesMgDl.length;
}

double mMoiLToMgDl(double mmolL) {
  return mmolL * 18.0;
}