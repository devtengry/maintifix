import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:maintifix/constants/fonts/project_fonts.dart';
import 'package:maintifix/constants/fonts/project_text_styles.dart';
import 'package:maintifix/constants/theme/project_colors.dart';
import 'package:maintifix/widgets/home_widgets/floating_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    // Check if user is logged in
    user = FirebaseAuth.instance.currentUser;
  }

  Future<bool> _onWillPop() async {
    // Handle the back button press manually and navigate to '/home'
    Navigator.of(context).pushReplacementNamed('/home');
    return Future.value(
        false); // Prevent the default behavior of exiting the app
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Center(child: Text('No user logged in'));
    }

    return WillPopScope(
      onWillPop: _onWillPop, // Intercept the back button press
      child: Container(
        decoration: BoxDecoration(
          gradient: ProjectGradientColors.summaryScreenBackroundColor,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Settings', style: ProjectTextStyle.appBarTextStyle),
            backgroundColor: ProjectColors.appBarColor,
            leading: IconButton(
              color: ProjectColors.iconColor,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account Settings',
                  style: ProjectFonts().headerFont,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: ProjectColors.iconColor,
                      child: Icon(Icons.person, size: 30, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                Divider(color: ProjectColors.textColor),
                Text(
                  'Username: ${user?.displayName ?? 'No username'}',
                  style: ProjectTextStyle.loginTextButtonStlyle,
                ),
                SizedBox(height: 5),
                Text(
                  'Email: ${user?.email ?? 'No email'}',
                  style: ProjectTextStyle.loginTextButtonStlyle,
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      if (context.mounted) {
                        Navigator.of(context).pushReplacementNamed('/login');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 62, 95, 141),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Logout',
                      style: ProjectTextStyle.loginTextButtonStlyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: const BottomAppBarFloating(),
        ),
      ),
    );
  }
}
