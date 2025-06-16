import 'package:flutter/material.dart';
import 'package:flutter_application/model/prediction_history/prediction_history.dart';
import 'package:flutter_application/screen/history_detail/widgets/gauge.dart';
import 'package:flutter_application/utils/helper.dart';

import 'package:share_plus/share_plus.dart' ;
class PredictionDetailScreen extends StatefulWidget {
  final PredictionHistory prediction;

  const PredictionDetailScreen({super.key, required this.prediction});

  @override
  State<PredictionDetailScreen> createState() => _PredictionDetailScreenState();
}

class _PredictionDetailScreenState extends State<PredictionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change back button color to white
        ),
        title: const Text('Prediction Details',style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              _shareReport();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildDetailRow('Predicted BG', widget.prediction.predicted_bg?.toStringAsFixed(2) ?? 'N/A'),
            _buildDetailRow('Predicted Blood Glucose(mg/DL)', mMoiLToMgDl(widget.prediction.predicted_bg ?? 0).toStringAsFixed(2)),
            _buildDetailRow('Status', widget.prediction.status ?? 'N/A'),
            _buildDetailRow('Risk Level', widget.prediction.risk_level ?? 'N/A'),
            _buildDetailRow('Interpretation', widget.prediction.interpretation ?? 'N/A'),
            _buildDetailRow('Advice', widget.prediction.advice ?? 'N/A'),
            _buildDetailRow('Insulin Suggestion', widget.prediction.insulin_suggestion ?? 'N/A'),
            _buildDetailRow('Activity Suggestion', widget.prediction.activity_suggestion ?? 'N/A'),
            _buildDetailRow(
              'Predicted At',
              formatCheckedAt(widget.prediction.timestamp),
            ),
            _buildDetailRow(
              'Next Check',
              formatCheckedAt(widget.prediction.next_insulin_check_suggested_at),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const Text(
              'Input Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
             _buildDetailRow('Blood Glucose', mMoiLToMgDl(widget.prediction.input_summary?.bg_mean??0).toString()),
            _buildDetailRow('BG Mean', widget.prediction.input_summary?.bg_mean?.toStringAsFixed(2) ?? 'N/A'),
            _buildDetailRow('Insulin Mean', widget.prediction.input_summary?.insulin_mean?.toString() ?? 'N/A'),
            _buildDetailRow('Carbs Mean', widget.prediction.input_summary?.carbs_mean?.toString() ?? 'N/A'),
            _buildDetailRow('Steps Mean', widget.prediction.input_summary?.steps_mean?.toString() ?? 'N/A'),
            _buildDetailRow('HR Mean', widget.prediction.input_summary?.hr_mean?.toString() ?? 'N/A'),
            _buildDetailRow('Cals Mean', widget.prediction.input_summary?.cals_mean?.toString() ?? 'N/A'),
            _buildDetailRow('Activity Encoded', widget.prediction.input_summary?.activity_encoded?.toString() ?? 'N/A'),
            const SizedBox(height: 10),
            const Divider(),
            GlucoseGauge(predictedBG: widget.prediction.predicted_bg ?? 0),
            

          ],
        ),
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
  void _shareReport() {
    final report = '''
🩸 **Prediction Report**
Predicted BG: ${widget.prediction.predicted_bg?.toStringAsFixed(2) ?? 'N/A'}
Status: ${widget.prediction.status ?? 'N/A'}
Risk Level: ${widget.prediction.risk_level ?? 'N/A'}
Interpretation: ${widget.prediction.interpretation ?? 'N/A'}
Advice: ${widget.prediction.advice ?? 'N/A'}
Insulin Suggestion: ${widget.prediction.insulin_suggestion ?? 'N/A'}
Activity Suggestion: ${widget.prediction.activity_suggestion ?? 'N/A'}
Next Check: ${formatCheckedAt(widget.prediction.next_insulin_check_suggested_at)}

📊 **Input Summary**
BG Mean: ${widget.prediction.input_summary?.bg_mean?.toString() ?? 'N/A'}
Insulin Mean: ${widget.prediction.input_summary?.insulin_mean?.toString() ?? 'N/A'}
Carbs Mean: ${widget.prediction.input_summary?.carbs_mean?.toString() ?? 'N/A'}
Steps Mean: ${widget.prediction.input_summary?.steps_mean?.toString() ?? 'N/A'}
HR Mean: ${widget.prediction.input_summary?.hr_mean?.toString() ?? 'N/A'}
Cals Mean: ${widget.prediction.input_summary?.cals_mean?.toString() ?? 'N/A'}
Activity Encoded: ${widget.prediction.input_summary?.activity_encoded?.toString() ?? 'N/A'}
''';

    Share.share(report, subject: 'My Prediction Report');
  }
}
