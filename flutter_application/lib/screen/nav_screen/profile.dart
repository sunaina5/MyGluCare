import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application/controller/user_controller.dart';
import 'package:flutter_application/screen/authentication/login_screen.dart';
import 'package:flutter_application/screen/profile/edit_profile_screen.dart';
import 'package:flutter_application/services/firebase_auth_services.dart';
import 'package:flutter_application/services/notification_services.dart';
import 'package:flutter_application/services/reminder_storage_service.dart';
import 'package:flutter_application/utils/profile_image_loader.dart';
import 'package:permission_handler/permission_handler.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final currentUser= FirebaseAuth.instance.currentUser;

  late Future userFuture;
    bool _isReminder = false;
  

  @override
  void initState() {
    super.initState();
    userFuture = UserController.getCurrentUser();
  }

  void _refreshUser() {
    setState(() {
      userFuture = UserController.getCurrentUser();
    });
  }


void setReminder(bool value) async {
    if (value) {
      WidgetsFlutterBinding.ensureInitialized();
      await Permission.notification.isDenied.then((value) {
        if (value) {
          Permission.notification.request();
        }
      });
      setState(() {
        _isReminder = value;
      });
       await ReminderStorage.setReminderEnabled(true);
    } else {
      NotificationServices.cancelAllNotifications();
     
      setState(() {
        _isReminder = value;
      });
      await ReminderStorage.setReminderEnabled(false);
    }
  }

  

  // void _scheduleNotification() {
  //   final notificationTime = DateTime(
  //     DateTime.now().year,
  //     DateTime.now().month,
  //     DateTime.now().day,
  //     _selectedTime.hour,
  //     _selectedTime.minute,
  //   );

  //   NotificationServices.scheduleNotificattions(
  //     'Glucare Reminder',
  //     'Hii ${currentUser?.displayName}, it\'s time to check your glucose levels.',
  //     '',
  //     notificationTime,
  //   );
  // }

  @override
  Widget build(BuildContext context) {

    
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,fontSize: 20)),
        
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: userFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text('Error fetching user data'));
            }

            final user = snapshot.data;
            if (user == null) {
              return const Center(child: Text('No user data found'));
            }
            return Column(
              children: [
                // Avatar + Edit

                   FutureBuilder(
                          future: getSignedUrl(user.profileImage),
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
                                 child: profileImageUrl != null
                                  ? CachedNetworkImage(imageUrl: profileImageUrl, fit: BoxFit.cover)
                                  : Icon(Icons.person, size: 50, color: Colors.white),
                            ),
                                                 );
                         }
                         }
                       ),

                   
                
                const SizedBox(height: 16),
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(user.email?? 'No email provided', style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 4),
                Text(user.sex ?? 'Not specified', style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 4),
                // format the date of birth like 5th January 1990
                Text(
                  user.dob != null ? '${user.dob!.day} ${_getMonthName(user.dob!.month)} ${user.dob!.year}' : 'Date of Birth not specified',
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24),
            
                // Health Metrics
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    _MetricTile(icon: Icons.water_drop, label: 'Glucose', value:user.glucoseValue!=null&&user.glucoseValue!.isNotEmpty? '${user.glucoseValue} mg/dL':'Not specified'),
                    _MetricTile(icon: Icons.favorite, label: 'Heart Rate', value: user.heartRateValue!=null&&user.heartRateValue!.isNotEmpty? '${user.heartRateValue} bpm':'Not specified'),
                    _MetricTile(icon: Icons.directions_walk, label: 'Steps', value: user.stepsValue!=null&&user.stepsValue!.isNotEmpty? '${user.stepsValue} steps':'Not specified'),
                  ],
                ),
                const SizedBox(height: 24),
                const SizedBox(height: 24),
                // Edit Profile list tile
                ListTile(
                  tileColor: Colors.blue.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  leading: const Icon(Icons.person, color: Colors.blue),
                  title: const Text('Edit Profile', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  onTap: () async{
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  EditProfileScreen(user: user)),
                    );
                    _refreshUser();
                  },
                ),
                const SizedBox(height: 16),

              //  Settings list tile
                ListTile(
                  tileColor: Colors.yellow.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.yellow, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  leading: const Icon(Icons.notifications, color: Colors.yellow),
                  title: const Text('Notifications', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                   trailing: FutureBuilder<bool>(
                     future: ReminderStorage.getReminderEnabled(),
                     builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return const Icon(Icons.error, color: Colors.red);
                      } 
                        _isReminder = snapshot.data ?? false;

                       return Switch(
                                         activeColor: Colors.white,
                                         activeTrackColor: Colors.green,
                                         inactiveTrackColor: Colors.red,
                                         inactiveThumbColor: Colors.white,
                                         
                                         value: _isReminder,
                                         onChanged: ((value) => setReminder(value)));
                     }
                   ),
                ),
            const SizedBox(height: 16),
                // Logout list tile   
                ListTile(
                  tileColor: Colors.red.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text('Logout', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  onTap: () {
                    // open logout confirmation dialog
                    showDialog(
                      
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        title: const Text('Logout'),
                        content: const Text('Are you sure you want to logout?'),
                        actions: [
                          OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.blue,
                              side: const BorderSide(color: Colors.blue),
                            ),
                            child: const Text('Cancel'),
                          ),
                          OutlinedButton(
                            onPressed: ()  {
                             FirebaseAuthServices.logoutUser();
                              Navigator.pop(context);
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red,
                              side: const BorderSide(color: Colors.red),
                            ),
                            child: const Text('Logout'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
            
              ],
            );
          }
        ),
      ),
    );
  }

  _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}

class _MetricTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _MetricTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.blue),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
