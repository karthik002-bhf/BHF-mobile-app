import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: const Color.fromARGB(108, 0, 0, 0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 198, 200, 200),
              const Color.fromARGB(255, 227, 235, 235),
            ],
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
            transform: GradientRotation(45),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Your Orders', style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.arrow_forward_ios),
                splashColor: Color.fromARGB(181, 158, 158, 158),
                onTap: () {},
              ),
              const DottedLine(
                dashColor: Color.fromARGB(72, 158, 158, 158),
                dashLength: 10,
              ),
              ListTile(
                leading: Icon(Icons.favorite_outline),
                title: Text('Wishlist', style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.arrow_forward_ios),
                splashColor: Color.fromARGB(181, 158, 158, 158),
                onTap: () {},
              ),
              const DottedLine(
                dashColor: Color.fromARGB(72, 158, 158, 158),
                dashLength: 10,
              ),
              ListTile(
                leading: Icon(Icons.support_agent_outlined),
                title: Text('Help & Support', style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.arrow_forward_ios),
                splashColor: Color.fromARGB(181, 158, 158, 158),
                onTap: () {},
              ),
              const DottedLine(
                dashColor: Color.fromARGB(72, 158, 158, 158),
                dashLength: 10,
              ),
              ListTile(
                leading: Icon(Icons.location_on_outlined),
                title: Text('Saved Address', style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.arrow_forward_ios),
                splashColor: Color.fromARGB(181, 158, 158, 158),
                onTap: () {},
              ),
              const DottedLine(
                dashColor: Color.fromARGB(72, 158, 158, 158),
                dashLength: 10,
              ),
              ListTile(
                leading: Icon(Icons.account_circle_outlined),
                title: Text('Profile', style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.arrow_forward_ios),
                splashColor: Color.fromARGB(181, 158, 158, 158),
                onTap: () {},
              ),
              const DottedLine(
                dashColor: Color.fromARGB(72, 158, 158, 158),
                dashLength: 10,
              ),
              ListTile(
                leading: Icon(Icons.settings_outlined),
                title: Text('Settings', style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.arrow_forward_ios),
                splashColor: Color.fromARGB(181, 158, 158, 158),
                onTap: () {},
              ),

            ],
          ),
        ),
      ),
    );
  }
}
