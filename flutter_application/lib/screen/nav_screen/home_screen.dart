import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/controller/prediction_controller.dart';
import 'package:flutter_application/key/global_key.dart';
import 'package:flutter_application/model/prediction_history/prediction_history.dart';
import 'package:flutter_application/screen/home_widgets/home_stats.dart';
import 'package:flutter_application/screen/home_widgets/prediction_result.dart';

import 'package:flutter_application/utils/helper.dart';
import 'package:flutter_application/widgets/activity_dropdown.dart';

import 'package:flutter_application/widgets/input_field.dart';
import 'package:flutter_application/widgets/prediction_shimmer.dart';
import 'package:flutter_application/widgets/processing_icon.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

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
  final GlobalKey _dataCardKey = GlobalKey(),
      _resultCardKey = GlobalKey(),
      _formKeyShow = GlobalKey(),
      _predictButtonKey = GlobalKey();
  SharedPreferences? prefs;
  @override
  void initState() {
    _checkAndStartShowcase();
    super.initState();
  }

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

  Future<void> _checkAndStartShowcase() async {
    prefs = await SharedPreferences.getInstance();

    final hasShownShowcase = prefs?.getBool('hasShownHomeShowcase') ?? false;

    if (!hasShownShowcase) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ShowCaseWidget.of(context).startShowCase([
          _dataCardKey,
          _formKeyShow,
          _predictButtonKey,
          _resultCardKey,
        ]);
        await prefs?.setBool('hasShownHomeShowcase', true);
      });
    }
  }

  static const Map<String, List<double>> realisticMedicalRanges = {
    'bloodGlucose': [30, 600],
    'insulin': [0, 200],
    'carbs': [0, 700],
    'steps': [0, 80000],
    'heartRate': [30, 220],
    'calories': [500, 8000],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "Welcome Back, ${user?.displayName != null && user!.displayName!.isNotEmpty ? user?.displayName!.split(' ')[0] : ''}",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          autovalidateMode:
              AutovalidateMode.onUserInteraction, // 👈 LIVE validation
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isPredicting
                  ? ProcessingIcon()
                  : Showcase(
                      key: _dataCardKey,
                      title: 'Latest Prediction Summary',
                      description:
                          'Tap here to view a detailed summary of your most recent glucose prediction, including risk level and next checkup advice.',
                      titleTextAlign: TextAlign.start,
                      descriptionTextAlign: TextAlign.start,
                      tooltipBackgroundColor: Colors.blue,
                      textColor: Colors.white,
                      enableAutoScroll: true,
                      // tooltipActions: [
                      //   TooltipActionButton(
                      //       type: TooltipDefaultActionType.next,
                      //       backgroundColor: Colors.pinkAccent,
                      //       textStyle: TextStyle(color: Colors.white))
                      // ],
                      child: HomeStats()),
              const SizedBox(height: 30),
              const Text("Enter Health Data for Prediction",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Showcase(
                key: _formKeyShow,
                title: 'Enter Your Health Data',
                description:
                    'Fill in your recent blood glucose, insulin, carbs, and other values here. These inputs help generate an accurate health prediction.',
                titleTextAlign: TextAlign.start,
                descriptionTextAlign: TextAlign.start,
                tooltipBackgroundColor: Colors.blue,
                textColor: Colors.white,
                enableAutoScroll: true,
                child: Row(
                  children: [
                    Expanded(
                      child: InputField(
                        controller: bgMeanController,
                        hintText: "e.g. 70 - 180",
                        label: "Blood Glucose(mg/DL)",
                        validator: (value) => validateInput(
                          value,
                          "Blood Glucose",
                          realisticMedicalRanges['bloodGlucose']![0],
                          realisticMedicalRanges['bloodGlucose']![1],
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        child: InputField(
                      controller: insulinMeanController,
                      hintText: "e.g. 0 - 50",
                      label: "Insulin(unit) mean",
                      validator: (value) => validateInput(
                        value,
                        "Insulin",
                        realisticMedicalRanges['insulin']![0],
                        realisticMedicalRanges['insulin']![1],
                      ),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: InputField(
                    controller: carbsMeanController,
                    hintText: "e.g. 0 - 300",
                    label: "Carbs(g) mean",
                    validator: (value) => validateInput(
                      value,
                      "Carbs",
                      realisticMedicalRanges['carbs']![0],
                      realisticMedicalRanges['carbs']![1],
                    ),
                  )),
                  SizedBox(width: 10),
                  Expanded(
                      child: InputField(
                    controller: stepsMeanController,
                    label: "Steps",
                    hintText: "e.g. 0 - 50000",
                    validator: (value) => validateInput(
                      value,
                      "Steps",
                      realisticMedicalRanges['steps']![0],
                      realisticMedicalRanges['steps']![1],
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: InputField(
                    controller: hrMeanController,
                    hintText: "e.g. 40 - 180",
                    label: "Heart Rate(bpm) mean",
                    validator: (value) => validateInput(
                      value,
                      "Heart Rate",
                      realisticMedicalRanges['heartRate']![0],
                      realisticMedicalRanges['heartRate']![1],
                    ),
                  )),
                  SizedBox(width: 10),
                  Expanded(
                      child: InputField(
                    controller: calsMeanController,
                    hintText: "e.g. 0 - 5000",
                    label: "Calories(kcal) mean",
                    validator: (value) => validateInput(
                      value,
                      "Calories",
                      realisticMedicalRanges['calories']![0],
                      realisticMedicalRanges['calories']![1],
                    ),
                  )),
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
                child: Showcase(
                  key: _predictButtonKey,
                  title: 'Predict Your Health Outcome',
                  description:
                      'Tap this button after entering your health data to get a prediction based on your recent values. Make sure all fields are filled correctly before proceeding.',
                  titleTextAlign: TextAlign.start,
                  descriptionTextAlign: TextAlign.start,
                  tooltipBackgroundColor: Colors.deepPurple,
                  textColor: Colors.white,
                  enableAutoScroll: true,
                  child: ElevatedButton(
                    onPressed: isPredicting
                        ? null
                        : () async {
                            try {
                              // Handle prediction logic here
                              // You can access the input values from the controllers
                              setState(() {
                                isPredicting =
                                    true; // Set predicting state to true
                              });

                              final bg = mgDlToMmolL(
                                double.tryParse(bgMeanController.text) ?? 0.0,
                              );
                              final inputSummary = InputSummary(
                                bg_mean: bg,
                                insulin_mean: double.tryParse(
                                        insulinMeanController.text) ??
                                    0.0,
                                carbs_mean:
                                    double.tryParse(carbsMeanController.text) ??
                                        0.0,
                                steps_mean:
                                    double.tryParse(stepsMeanController.text) ??
                                        0.0,
                                hr_mean:
                                    double.tryParse(hrMeanController.text) ??
                                        0.0,
                                cals_mean:
                                    double.tryParse(calsMeanController.text) ??
                                        0.0,
                                activity_encoded: _selectedActivity ??
                                    0, // Default to 0 if not selected
                              );
                              if (_formKey.currentState?.validate() ?? false) {
                                await PredictionController.predict(
                                  inputSummary,
                                );
                              }
                              //           // Call your prediction function here with the collected data
                              //           // For example: await predictGlucose(bgMean, insulinMean, carbsMean, stepsMean, hrMean, calsMean, activityType);
                            } catch (e) {
                              messengerKey.currentState?.showSnackBar(
                                SnackBar(
                                  content: Text("Error: ${e.toString()}",
                                      style: const TextStyle(fontSize: 16)),
                                ),
                              );
                            } finally {
                              setState(() {
                                isPredicting =
                                    false; // Reset the predicting state
                                // Clear the input fields after prediction
                                bgMeanController.clear();
                                insulinMeanController.clear();
                                carbsMeanController.clear();
                                stepsMeanController.clear();
                                hrMeanController.clear();
                                calsMeanController.clear();
                                _selectedActivity =
                                    null; // Reset activity selection
                              });
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[700],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: isPredicting
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text("Predict",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.center),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Prediction Result",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              isPredicting
                  ? PredictionShimmer()
                  : Showcase(
                      key: _resultCardKey,
                      title: 'Prediction Results',
                      description:
                          'Here you can view the outcome of your latest health prediction, including glucose status, insulin suggestions, and recommended next actions.',
                      titleTextAlign: TextAlign.start,
                      descriptionTextAlign: TextAlign.start,
                      tooltipBackgroundColor: Colors.green,
                      textColor: Colors.white,
                      enableAutoScroll: true,
                      child: PredictionResult()),
            ],
          ),
        ),
      ),
    );
  }

  String? validateInput(String? value, String label, double min, double max) {
    if (value == null || value.trim().isEmpty) {
      return '$label is required';
    }

    final parsed = double.tryParse(value);
    if (parsed == null) {
      return '$label must be a valid number';
    }

    if (parsed < 0) {
      return '$label cannot be negative';
    }

    if (parsed < min || parsed > max) {
      return 'Range: $min - $max';
    }

    return null;
  }
}
