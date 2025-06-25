import 'package:flutter/material.dart';
import 'package:flutter_application/controller/prediction_controller.dart';
import 'package:flutter_application/model/prediction_history/prediction_history.dart';
import 'package:flutter_application/screen/history_detail/history_detail_screen.dart';
import 'package:flutter_application/screen/history_detail/widgets/gauge.dart';
import 'package:flutter_application/utils/helper.dart';
import 'package:flutter_application/widgets/state_card.dart';

class HomeStats extends StatefulWidget {
  const HomeStats({super.key});

  @override
  State<HomeStats> createState() => _HomeStatsState();
}

class _HomeStatsState extends State<HomeStats> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PredictionHistory>>(
      stream: PredictionController.getPredictionHistoryStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          debugPrint('Error fetching prediction history: ${snapshot.error}');
          return Center(child: Text('Error: Unable to fetch data'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No summary available'));
        }
        final predictionHistory = snapshot.data!;
        final latestPrediction = predictionHistory.first;
        return Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Colors.transparent,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
                 GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  PredictionDetailScreen(prediction: latestPrediction,))),
                   child: Card(
                    
                    color: getStatusColor(latestPrediction.status),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                          text: const TextSpan(
                            text: 'Latest Prediction Summary',
                            style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            ),
                          ),
                          ),
                          const SizedBox(height: 10),
                          const Divider(color: Colors.white70),
                          const SizedBox(height: 10),
                          GlucoseGauge(
                            predictedBG: latestPrediction.predicted_bg ?? 0,
                          ),
                          const SizedBox(height: 10),
                          RichText(
                          text: TextSpan(
                            children: [
                            const TextSpan(
                              text: 'Status: ',
                              style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '${latestPrediction.status}',
                              style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              ),
                            ),
                            ],
                          ),
                          ),
                          const SizedBox(height: 10),
                          // Risk level based on status
                          RichText(
                          text: TextSpan(
                            children: [
                            const TextSpan(
                              text: 'Risk Level: ',
                              style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '${latestPrediction.risk_level}',
                              style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              ),
                            ),
                            ],
                          ),
                          ),
                          const SizedBox(height: 10),
                          // Advice based on status
                          RichText(
                          text: TextSpan(
                            children: [
                            const TextSpan(
                              text: 'Advice: ',
                              style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '${latestPrediction.advice}',
                              style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              ),
                            ),
                            ],
                          ),
                          ),
                          const SizedBox(height: 10),
                          // Activity level based on status
                          RichText(
                          text: TextSpan(
                            children: [
                            const TextSpan(
                              text: 'Next Checkup: ',
                              style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: formatCheckedAt(latestPrediction.next_insulin_check_suggested_at),
                              style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              ),
                            ),
                            ],
                          ),
                          ),
                          const Divider(color: Colors.white70),
                          RichText(
                          text: TextSpan(
                            children: [
                            const TextSpan(
                              text: 'Checked at: ',
                              style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: formatCheckedAt(latestPrediction.timestamp),
                              style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.normal,
                              ),
                            ),
                            ],
                          ),
                          ),
                        ],
                      ),
                    ),
                   ),
                 ),
              const SizedBox(height: 10),
              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                StatCard(title: 'Glucose', value: mMoiLToMgDl(latestPrediction.predicted_bg??0).toStringAsFixed(2), unit: 'mg/dL', icon: Icon(Icons.bloodtype, color: Colors.white)),
                                StatCard(title: 'Status', value: '${latestPrediction.status}', unit: '',
                                    icon: Icon(Icons.warning, color: Colors.white)),
                              ],
                            ),
                            
            ],
          ),
        );
      }
    );
  }
}