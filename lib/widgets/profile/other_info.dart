import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class OtherInfo extends StatelessWidget {
  const OtherInfo({super.key});

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
                leading: Icon(Icons.info_outline),
                title: Text('General Info', style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.arrow_forward_ios),
                splashColor: Color.fromARGB(181, 158, 158, 158),
                onTap: () {},
              ),
              const DottedLine(
                dashColor: Color.fromARGB(72, 158, 158, 158),
                dashLength: 10,
              ),
              ListTile(
                leading: Icon(Icons.business_center_outlined),
                title: Text('About Us', style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.arrow_forward_ios),
                splashColor: Color.fromARGB(181, 158, 158, 158),
                onTap: () {},
              ),
              const DottedLine(
                dashColor: Color.fromARGB(72, 158, 158, 158),
                dashLength: 10,
              ),
              ListTile(
                leading: Icon(Icons.description_outlined),
                title: Text('Terms', style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.arrow_forward_ios),
                splashColor: Color.fromARGB(181, 158, 158, 158),
                onTap: () {},
              ),

              // InkWell(
              //   onTap: () {},
              //   focusColor: const Color.fromARGB(181, 158, 158, 158),
              //   child: Container(
              //     padding: EdgeInsets.symmetric(vertical: 12),
              //     width: double.infinity,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Row(
              //           children: [
              //             Icon(Icons.description_outlined),
              //             SizedBox(width: 6),
              //             Text('Terms', style: TextStyle(fontSize: 18)),
              //           ],
              //         ),
              //         Icon(Icons.chevron_right),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
