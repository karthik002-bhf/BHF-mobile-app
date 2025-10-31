import 'package:flutter/material.dart';

class OurMission extends StatelessWidget {
  const OurMission({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Our Mission',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        Text(
          'At BHF Tech Solution LLP, our mission is to deliver holistic, tech-enabled, and innovative solutions that reshape the construction, engineering industries and allied domains through a combination of deep domain expertise and cutting-edge technology.',
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 12,),
         Text(
          "We aspire to be a trusted providers of Construction, Engineering, and Technology Services. With competence and commitment, we are well-equipped to deliver comprehensive, time-bound, and technology-driven solutions that exceed our client's expectations. BHF is the abbreviation for Build Homes Fine.",
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
