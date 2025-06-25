import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/controller/user_controller.dart';
import 'package:flutter_application/key/global_key.dart';
import 'package:flutter_application/model/user/user_model.dart';
import 'package:flutter_application/utils/pick_and_crop_image.dart';
import 'package:flutter_application/utils/profile_image_loader.dart';
import 'package:flutter_application/utils/profile_widgets_functions.dart';
import 'package:flutter_application/widgets/profile/text_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel user;
  const EditProfileScreen({super.key, required this.user});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late String? firstName;
  late String? lastName;
  late String? email;
  TextEditingController sexController = TextEditingController();
  DateTime? _selectedDob;
  String? glucoseValue;
  String? heartRateValue;
  String? stepsValue;
  Uint8List? _avatarImage;
  bool loading = false;
  

  @override
  void initState() {
    super.initState();
    firstName = widget.user.firstName;
    lastName = widget.user.lastName;
    email = widget.user.email;
    sexController.text = widget.user.sex?? 'not specified';
    _selectedDob = widget.user.dob;
    glucoseValue = widget.user.glucoseValue;
    heartRateValue = widget.user.heartRateValue;
    stepsValue = widget.user.stepsValue;
    _avatarImage = null; // Initialize avatar image to null
   

  }

  void pickImage()async{
    final pickedImage = await pickImageAndCrop(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _avatarImage = pickedImage;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Edit Profile',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                // Avatar Placeholder
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                       FutureBuilder(
                          future: getSignedUrl(widget.user.profileImage),
                         builder: (context, snapshot) {
                           if (snapshot.connectionState == ConnectionState.waiting) {
                             return CircularProgressIndicator();
                           } else if (snapshot.hasError) {
                             return Icon(Icons.error, color: Colors.red);
                           } else {
                            final profileImageUrl = snapshot.data;
                             return CircleAvatar(
                               radius: 50,
                               child: ClipOval(
                                 child: _avatarImage != null
                                     ? Image.memory(_avatarImage!, fit: BoxFit.cover)
                                     : profileImageUrl != null
                                  ? CachedNetworkImage(imageUrl: profileImageUrl, fit: BoxFit.cover)
                                  : Icon(Icons.person, size: 50, color: Colors.white),
                            ),
                                                 );
                         }
                         }
                       ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt, size: 20),
                          onPressed: () {
                            pickImage();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
        
                // Name
                ProfileTextFormField(
                  validator: true,
                  initialValue: firstName??'Unknown',
                  label: 'First Name',
                  onSaved: (value) => firstName = value,
                ),
                const SizedBox(height: 16),
                // Last Name
                ProfileTextFormField(
                  validator: true,
                  initialValue: lastName??'Unknown',
                  label: 'Last Name',
                  onSaved: (value) => lastName = value,
                ),
                const SizedBox(height: 16),
                // Email
                ProfileTextFormField(
                  validator: true,
                  initialValue: email??'Unknown',
                  label: 'Email',
                  onSaved: (value) => email = value,
                ),
                const SizedBox(height: 16),
        
                 TextFormField(
          controller: sexController,
          readOnly: true,
          decoration: const InputDecoration(
            labelText: 'Sex',
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          onTap: ()async{
          
        sexController.text = await showSexPicker(
          context: context,
          currentValue: sexController.text,
        ) ?? '';
            
          },
          validator: (value) => value == null || value.isEmpty ? 'Please select your sex' : null,
        ),
        const SizedBox(height: 15),
                  InkWell(
                    onTap: () async {
                      _selectedDob = await pickDate(context, _selectedDob);
                      setState(() {});
                    },
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
        
                  ProfileTextFormField(
                    validator: false,
                    label: 'Glucose mg/dL (optional)', onSaved: (value) => glucoseValue = value, initialValue: glucoseValue?? ''),
                  const SizedBox(height: 16),
        
                  ProfileTextFormField(
                    validator: false,
                    label: 'Heart Rate BPM (optional)', onSaved: (value) => heartRateValue = value, initialValue: heartRateValue?? ''),
                  const SizedBox(height: 16),
        
                  ProfileTextFormField(
                    validator: false,
                    label: 'Steps (optional)', onSaved: (value) => stepsValue = value, initialValue: stepsValue?? ''),
                  const SizedBox(height: 16),
        
                ElevatedButton(
                  onPressed: loading ? null : () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      setState(() {
                        loading = true;
                      });
                      try {
                        UserModel updatedUser = widget.user.copyWith(
                          firstName: firstName,
                          lastName: lastName,
                          email: email,
                          dob: _selectedDob,
                          sex: sexController.text,
                          glucoseValue: glucoseValue,
                          heartRateValue: heartRateValue,
                          stepsValue: stepsValue,
                        );
                        await UserController.updateUser(updatedUser, _avatarImage);
                        messengerKey.currentState?.showSnackBar(
                          const SnackBar(content: Text('Profile updated successfully!', style: TextStyle(color: Colors.white)), backgroundColor: Colors.green, duration: Duration(seconds: 2)),
                        );
                        navigatorKey.currentState?.pop(); // Return to previous screen with success
                      } catch (e) {
                        setState(() {
                          loading = false;
                        });
                        messengerKey.currentState?.showSnackBar(
                          SnackBar(content: Text('Error updating profile: $e', style: TextStyle(color: Colors.white)), backgroundColor: Colors.red),
                        );

                      } finally {
                        setState(() {
                          loading = false;
                        });
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: loading
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text("Save Changes", style: TextStyle(fontSize: 16, color: Colors.white), textAlign: TextAlign.center),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
