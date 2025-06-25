import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/controller/auth_controller.dart';
import 'package:flutter_application/key/global_key.dart';
import 'package:flutter_application/model/user/user_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application/screen/home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _sexController = TextEditingController();
  final List<String> _sexOptions = [
  'Male',
  'Female',
  'Transgender',
  'Non-Binary',
  'Genderqueer',
  'Agender',
  'Two-Spirit',
  'Intersex',
  'Prefer not to say',
  'Other',
];
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  String? _selectedSex;
  DateTime? _selectedDob;
  bool loading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool ispasswordmatch = false;
Future<void> _pickDate() async {
  await showCupertinoModalPopup(
    context: context,
    builder: (_) => Container(
      height: 300,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: _selectedDob ?? DateTime(2000),
              minimumDate: DateTime(1900),
              maximumDate: DateTime.now(),
              onDateTimeChanged: (date) {
                setState(() {
                  _selectedDob = date;
                });
              },
            ),
          ),
          
          
        ],
      ),
    ),
  );
}
void _showSexPicker() {
  showCupertinoModalPopup(
    context: context,
    builder: (_) => Container(
      height: 250,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: CupertinoPicker(
              backgroundColor: Colors.white,
              itemExtent: 40,
              scrollController: FixedExtentScrollController(
                initialItem: _selectedSex != null
                    ? _sexOptions.indexOf(_selectedSex!)
                    : 0,
              ),
              onSelectedItemChanged: (int index) {
                setState(() {
                  _selectedSex = _sexOptions[index];
                  _sexController.text = _sexOptions[index];
                });
              },
              children: _sexOptions.map((e) => Text(e)).toList(),
            ),
          ),
          CupertinoButton(
            child: const Text('Done'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    ),
  );
}
  void _handleSignUp()async {
   
     if (_formKey.currentState!.validate()) {
      try{
        setState(() {
          loading = true;
        });
      final dob = _selectedDob != null ? DateFormat('yyyy-MM-dd').format(_selectedDob!) : 'N/A';
      final user = UserModel(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        dob: dob != 'N/A' ? DateTime.parse(dob) : null,
        sex: _selectedSex,
      );
    
      if (_passwordController.text == _confirmPasswordController.text) {

        setState(() {
          ispasswordmatch = false;
        });
        final result = await AuthController.signUp(user, _passwordController.text);

        if (result) {
          // Navigate to the home screen or show success message
          navigatorKey.currentState?.pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false,
          );
        } else {
          setState(() {
            loading = false;
          });
          // Show error message
          messengerKey.currentState?.showSnackBar(
            const SnackBar(content: Text('Sign up failed. Please try again.')),
          );
        }
       
      }
      else {
        setState(() {
          ispasswordmatch = true;
        });
      
      }
    } catch (e) {
        messengerKey.currentState?.showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      } finally {
        setState(() {
          loading = false;
        });
      }}
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text("Sign Up", style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/pic6.png',
                  
                  height: 250,
                ),
                const SizedBox(height: 30),
                _buildTextField(_firstNameController, "First Name"),
                _buildTextField(_lastNameController, "Last Name"),
                TextFormField(
  controller: _sexController,
  readOnly: true,
  decoration: const InputDecoration(
    labelText: 'Sex',
    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
  ),
  onTap: _showSexPicker,
  validator: (value) => value == null || value.isEmpty ? 'Please select your sex' : null,
),
const SizedBox(height: 15),
                InkWell(
                  onTap: _pickDate,
                  child: InputDecorator(
                    decoration: const InputDecoration(labelText: "Date of Birth", 
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    child: Text(
                      _selectedDob == null
                          ? 'Select your birth date'
                          : DateFormat('yyyy-MM-dd').format(_selectedDob!),
                      style: TextStyle(color: _selectedDob == null ? Colors.grey : Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

  TextFormField(
    controller: _emailController,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      labelText: 'Email',
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) return 'Email is required';
      final emailRegex = RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w]{2,4}$');
      if (!emailRegex.hasMatch(value)) return 'Enter a valid email address';
      return null;
    },
  ),
                const SizedBox(height: 10),
                
                _buildTextField(_passwordController, "Password", obscureText: true),
                _buildTextField(_confirmPasswordController, "Confirm Password", obscureText: true),
                if (ispasswordmatch)
                  const Text(
                    "Passwords do not match",
                    style: TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 20),
                const Text(
                  "By signing up, you agree to our Terms of Service and Privacy Policy.",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),  
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed:!loading? _handleSignUp:null,
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child:loading?const CircularProgressIndicator(color: Colors.white,) :const Text("Sign Up", style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: (value) => value == null || value.isEmpty ? controller == _lastNameController? null : 'Required' : null, 
      ),
    );
  }
}
