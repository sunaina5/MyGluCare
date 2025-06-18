import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application/model/prediction_history/prediction_history.dart';
import 'package:flutter_application/services/firestore_db.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application/services/notification_services.dart';
class PredictionController {
  static final userId = FirebaseAuth.instance.currentUser?.uid;
  static Stream<List<PredictionHistory>> getPredictionHistoryStream() {
    try {
      return firestoreDb
          .collection('prediction_history')
          .where('user_id', isEqualTo: userId)
          .orderBy('timestamp', descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) {
                final data = doc.data();
                // Add the document ID as 'id' in the data map
                data['id'] = doc.id;
                return PredictionHistory.fromJson(data);
              }).toList());
    } catch (e) {
      debugPrint('Error fetching prediction history: $e');
      return Stream.value([]);
    }
  }
  static Future<PredictionHistory?> predict(InputSummary inputSummary)async{
    try{
      final url = 'https://my-glucare-fast-api.onrender.com/api/predict';
      final token = await FirebaseAuth.instance.currentUser?.getIdToken();
      final dio = Dio();
      final response = await dio.post(url, data: inputSummary.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'authorization':'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
      final data = response.data;
      final prediction = PredictionHistory.fromJson(data);
      
      // Schedule notification if insulin check time is provided
      if (prediction.next_insulin_check_suggested_at != null) {
        await NotificationServices.scheduleInsulinCheckNotification(prediction);
      }
      
      return prediction;
    } else {
      debugPrint('Error: ${response.statusMessage}');
      return null;
    }
    }catch (e){
      debugPrint('Error predicting: $e');
      return Future.value(null);
    }
  }
  static Future<void> deletePrediction(String id) async {
  final doc = firestoreDb.collection('prediction_history').doc(id);
  await doc.delete();
}

}