import 'package:flutter/material.dart';
import 'package:flutter_application/controller/prediction_controller.dart';
import 'package:flutter_application/model/prediction_history/prediction_history.dart';
import 'package:flutter_application/screen/history_detail/history_detail_screen.dart';
import 'package:flutter_application/utils/helper.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Prediction History',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<PredictionHistory>>(
        stream: PredictionController.getPredictionHistoryStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(fontSize: 18, color: Colors.red),
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final history = snapshot.data!;
            return ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final item = history[index];
                final checkedAt = item.timestamp != null
                  ? DateFormat("MMM dd yyyy 'at' hh:mm a").format(item.timestamp!)
                  : 'N/A';
                final statusColor = getStatusColor(item.status);

                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: statusColor,
                      child: Text(
                        item.predicted_bg?.toStringAsFixed(1) ?? '?',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text('Status: ${item.status ?? 'N/A'}',
                      style: TextStyle(
                        color: getStatusColor(item.status),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Risk: ${item.risk_level ?? 'N/A'}'),
                        Text('Advice: ${item.advice ?? 'N/A'}'),
                        Divider(color: Colors.grey[300], height: 1),
                        Text(
      'Checked at: $checkedAt',
      style: TextStyle(color: getStatusColor(item.status), fontSize: 12),
    ),
                      ],
                    ),
                     trailing: PopupMenuButton<String>(
  onSelected: (value) async {
    if (value == 'delete') {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Delete Entry'),
          content: const Text('Are you sure you want to delete this entry?'),
          actions: [
            OutlinedButton(onPressed: () => Navigator.pop(context, false),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
              side: const BorderSide(color: Colors.blue, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
             child: const Text('Cancel')),
            OutlinedButton(onPressed: () => Navigator.pop(context, true),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),),
             child: const Text('Delete')),
          ],
        ),
      );
      if (confirmed == true) {
        if(item.id == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Unable to delete entry. ID is null.')),
          );
          return;
        }
        await PredictionController.deletePrediction(item.id!);
      }
    }
  },
  itemBuilder: (context) => [
    const PopupMenuItem(value: 'delete', child: Text('Delete')),
  ],
),

                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return PredictionDetailScreen(prediction: item);
                      }));
                    },
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text(
              'Prediction History will be displayed here',
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          );
        },
      ),
    );
  }

 

 
}
