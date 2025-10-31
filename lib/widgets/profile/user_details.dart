// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      // color: LinearGradient(colors: []),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 165, 206, 255),
              Color.fromARGB(255, 147, 176, 213),
              Color.fromARGB(255, 157, 181, 210),
              //  const Color.fromARGB(255, 198, 240, 198),
              //  const Color.fromARGB(152, 149, 203, 150),
              //  const Color.fromARGB(35, 149, 203, 150),
            ],
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
            transform: GradientRotation(45),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.account_circle,
              color: const Color.fromARGB(255, 29, 75, 97),
              // color: const Color.fromARGB(255, 81, 121, 81),
              size: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BHF Tech Solution',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Text(
                  '+91 9876543210',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  'admin@bhftechsolution.com',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
