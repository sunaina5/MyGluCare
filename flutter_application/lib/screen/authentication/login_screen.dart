import 'package:flutter/material.dart';
//import signup_screen.dart';
import "package:flutter_application/screen/authentication/signup_screen.dart";
import 'package:flutter_application/screen/home.dart';
import 'package:flutter_application/services/firebase_auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 bool _isPasswordVisible = false; // For toggling password visibility
  bool _isLogin = true; // Toggle between login and create account

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 32),
                Image.asset(
                  'assets/images/pic5.png',
                  height: 300,
                ),
                const SizedBox(height: 16),
                Text(
                  _isLogin ? "Login to MyGluCare" : "Create Your Account",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration:  InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(!_isPasswordVisible? Icons.visibility: Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed:isLoading?null: ()async{
                    try{
                      setState(() {
                        isLoading = true;
                      });

                      final user = await FirebaseAuthServices.loginWithEmailAndPassword(_emailController.text, _passwordController.text);

                      if (user != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login successful!',style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login failed. Please try again.')),
                        );
                      }

                    }
                    catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e')),
                      );
                    }
                    finally{
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child:isLoading?const CircularProgressIndicator(color: Colors.white,): Text(_isLogin ? "Login" : "Create Account"),
                ),
                const SizedBox(height: 16),
                TextButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );
  },
  child: const Text("Don't have an account? Create one"),
)
              ],
            ),
          ),
        ),
      ),
    );
  }
}