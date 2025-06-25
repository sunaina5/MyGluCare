import 'package:flutter/material.dart';
import 'package:flutter_application/services/firebase_auth_services.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  String? _feedbackMessage;

  Future<void> _resetPassword() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      setState(() => _feedbackMessage = 'Please enter your email.');
      return;
    }

    setState(() => _isLoading = true);
    final result = await FirebaseAuthServices.sendPasswordResetEmail(email);

    setState(() {
      _isLoading = false;
      _feedbackMessage = result['message'];
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800))),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 1),
            Flexible(
              flex: 2,
              child: Image.asset("assets/images/forget-pass.png", fit: BoxFit.fitHeight),
            ),
            const SizedBox(height: 24),
            const Text(
              "Enter your registered email to receive a reset link.",
              textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.grey, width: 1),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _resetPassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Send Reset Link"),
            ),
            const SizedBox(height: 16),
            if (_feedbackMessage != null)
              Text(
                _feedbackMessage!,
                style: TextStyle(
                  color: _feedbackMessage!.toLowerCase().contains("success")
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
