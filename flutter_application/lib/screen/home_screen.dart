import 'package:flutter/material.dart';
import 'package:flutter_application/widgets/input_field.dart';
import 'package:flutter_application/widgets/state_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Welcome Back!", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),body: SingleChildScrollView(
      
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                StatCard(title: 'Glucose', value: '112', unit: 'mg/dL'),
                StatCard(title: 'Heart', value: '78', unit: 'bpm'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                StatCard(title: 'Carbs', value: '34', unit: 'g'),
                StatCard(title: 'Steps', value: '6,200', unit: 'steps'),
              ],
            ),
            const SizedBox(height: 30),
            const Text("Enter Health Data for Prediction", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
  children: const [
    Expanded(child: InputField(label: "Blood Glucose")),
    SizedBox(width: 20),
    Expanded(child: InputField(label: "Heart Rate(bpm)")),
  ],
),
const SizedBox(height: 10),
Row(
  children: const [
    Expanded(child: InputField(label: "Carbs(g)")),
    SizedBox(width: 10),
    Expanded(child: InputField(label: "Steps")),
  ],
),
const SizedBox(height: 10),
Row(
  children: const [
    Expanded(child: InputField(label: "Insulin(U)")),
    SizedBox(width: 10),
    Expanded(child: InputField(label: "Calories(kcal)")),
  ],
),
const SizedBox(height: 10),
const InputField(label: "Type of Physical Activity"),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Predict", style: TextStyle(fontSize: 16, color: Colors.white), textAlign: TextAlign.center),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Prediction Result", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: const [
                Icon(Icons.circle, size: 12, color: Colors.blue),
                SizedBox(width: 8),
                Text("Next dose required", style: TextStyle(fontSize: 14))
              ],
            )
          ],
        ),
      ),);
  }
}