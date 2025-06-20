import 'package:flutter/material.dart';
import 'package:flutter_application/controller/prediction_controller.dart';
import 'package:flutter_application/model/prediction_history/prediction_history.dart';
import 'package:flutter_application/utils/helper.dart';

class PredictionResult extends StatelessWidget {
  const PredictionResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: StreamBuilder<List<PredictionHistory>>(
        stream: PredictionController.getPredictionHistoryStream(),
        builder: (context, snapshot) {
        // wait for the stream to load
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        // if there is an error, show it
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        // no data found
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No prediction found.'));
        }
        // if data is available, display the prediction history
        final predictions = snapshot.data!.first;
          return Column(
            children: [
              _buildDetailRow('Status:', predictions.status ?? 'N/A'),
              _buildDetailRow('Next Dosage Required at:', 
                  predictions.next_dose != null
                      ? formatCheckedAt(predictions.next_dose!)
                      : 'N/A'),

              _buildDetailRow('Next Insulin Check Suggested at:',
                  predictions.next_insulin_check_suggested_at != null
                      ? formatCheckedAt(predictions.next_insulin_check_suggested_at!)
                      : 'N/A'),

              _buildDetailRow('Insuliin Suggestion:',
                  predictions.insulin_suggestion ?? 'N/A'),
              _buildDetailRow('Interpretation:', 
                  predictions.interpretation ?? 'N/A'),
            ],
          );
        }
      ),
    );
  }
  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 3,
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
          const SizedBox(width: 10),
          Expanded(flex: 5, child: Text(value,
              style:  TextStyle(fontSize: 16, color: title=='Status'? getStatusColor(value): Colors.black54))),
        ],
      ),
    );
  }
}