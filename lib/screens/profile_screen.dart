import 'package:bhf_mobile_app/widgets/profile/other_info.dart';
import 'package:bhf_mobile_app/widgets/profile/user_details.dart';
import 'package:bhf_mobile_app/widgets/profile/user_info.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 193, 195, 195),

      appBar: AppBar(
        title: Text('Profile'),
        // backgroundColor: const Color.fromARGB(255, 217, 198, 234),
        elevation: 5,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Color.fromARGB(255, 161, 200, 161),
                // Color.fromARGB(149, 116, 136, 117),
                Color.fromARGB(255, 110, 168, 238), // Navy
                Color.fromARGB(255, 129, 156, 188),
              ],
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,
              transform: GradientRotation(45),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            UserDetails(),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Your Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 4),
            UserInfo(),

            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Other Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 4),
            OtherInfo(),

            SizedBox(height: 8),
            Card(
              elevation: 3,
              child: InkWell(
                onTap: () {},
                focusColor: const Color.fromARGB(181, 158, 158, 158),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // ElevatedButton(onPressed: () {}, child: Text('Logout')),
            SizedBox(height: 8),
            Center(
              child: Text(
                'App Version 1.0.0',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            // SizedBox(height: 4),
            Center(child: Text('v94-11')),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
