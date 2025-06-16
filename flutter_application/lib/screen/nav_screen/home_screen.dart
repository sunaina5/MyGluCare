import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/controller/prediction_controller.dart';
import 'package:flutter_application/model/prediction_history/prediction_history.dart';
import 'package:flutter_application/screen/home_widgets/home_stats.dart';
import 'package:flutter_application/screen/home_widgets/prediction_result.dart';
import 'package:flutter_application/utils/helper.dart';
import 'package:flutter_application/widgets/activity_dropdown.dart';
import 'package:flutter_application/widgets/input_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   final _formKey = GlobalKey<FormState>();
  TextEditingController bgMeanController = TextEditingController();
  TextEditingController insulinMeanController = TextEditingController();
  TextEditingController carbsMeanController = TextEditingController();
  TextEditingController stepsMeanController = TextEditingController();
  TextEditingController hrMeanController = TextEditingController();
  TextEditingController calsMeanController = TextEditingController();
 int? _selectedActivity;
 bool isPredicting = false;
 final user = FirebaseAuth.instance.currentUser;
  @override
  void dispose() {
    bgMeanController.dispose();
    insulinMeanController.dispose();
    carbsMeanController.dispose();
    stepsMeanController.dispose();
    hrMeanController.dispose();
    calsMeanController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Welcome Back, ${user?.displayName != null && user!.displayName!.isNotEmpty ? user?.displayName!.split(' ')[0] : ''}",
          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),body: SingleChildScrollView(
      
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                      HomeStats(),
                      const SizedBox(height: 30),
                      const Text("Enter Health Data for Prediction", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
              Row(
            children:  [
              Expanded(child: InputField(controller:bgMeanController,label: "Blood Glucose(mg/DL)")),
              SizedBox(width: 20),
              Expanded(child: InputField(controller: insulinMeanController,label: "Insulin(unit) mean")),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children:  [
              Expanded(child: InputField(controller: carbsMeanController,label: "Carbs(g) mean")),
              SizedBox(width: 10),
              Expanded(child: InputField(controller: stepsMeanController, label: "Steps")),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children:  [
              Expanded( child: InputField(controller: hrMeanController, label: "Heart Rate(bpm) mean")),
              SizedBox(width: 10),
              Expanded(child: InputField(controller: calsMeanController, label: "Calories(kcal) mean")),
            ],
          ),
          const SizedBox(height: 10),
          ActivityDropdown(
          selectedActivity: _selectedActivity,
          onChanged: (value) {
            setState(() {
              _selectedActivity = value;
            });
          },
                ),
          //const InputField(label: "Type of Physical Activity"),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  
                  onPressed:isPredicting?null: ()async {
                    try{
                    // Handle prediction logic here
                    // You can access the input values from the controllers
                    setState(() {
                      isPredicting = true; // Set predicting state to true
                    });
                    final bg = mgDlToMmolL(
                      double.tryParse(bgMeanController.text) ?? 0.0,
                    );
                    final inputSummary = InputSummary(
                      bg_mean: bg,
                      insulin_mean: double.tryParse(insulinMeanController.text) ?? 0.0,
                      carbs_mean: double.tryParse(carbsMeanController.text) ?? 0.0,
                      steps_mean: double.tryParse(stepsMeanController.text) ?? 0.0,
                      hr_mean: double.tryParse(hrMeanController.text) ?? 0.0,
                      cals_mean: double.tryParse(calsMeanController.text) ?? 0.0,
                      activity_encoded: _selectedActivity ?? 0, // Default to 0 if not selected
                    );
          if (_formKey.currentState?.validate() ?? false) {
                    await PredictionController.predict(
                    inputSummary,
                    );
          }
                    // Call your prediction function here with the collected data
                    // For example: await predictGlucose(bgMean, insulinMean, carbsMean, stepsMean, hrMean, calsMean, activityType);
                   }
                  catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error: ${e.toString()}")),
                    );
                  }
                  finally {
                    setState(() {
                      isPredicting = false; // Reset the predicting state
                    });
                  }
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child:isPredicting?const CircularProgressIndicator(color: Colors.white,)  : const Text("Predict", style: TextStyle(fontSize: 16, color: Colors.white), textAlign: TextAlign.center),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Prediction Result", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              PredictionResult()
            ],
          ),
        ),
      ),);
  }
}