import 'package:flutter/material.dart';

class OurMotto extends StatelessWidget {
  const OurMotto({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Our Motto',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            BulletItem(
              title: 'BUILDING DREAMS',
              text: "to realize every customer's aspiration of a 'Dream Home'.",
            ),
            BulletItem(
              title: 'CUSTOMER-CENTRIC APPROACH',
              text: 'by providing transparency & upholding strong work ethics.',
            ),
            BulletItem(
              title: 'UNCOMPROMISED QUALITY & SAFETY',
              text:
                  'by adhering to the highest Quality Standards, Regulatory and Statutory, Environment & Health Compliances and on-site HSE Protocols.',
            ),
            BulletItem(
              title: 'RELIABILITY',
              text:
                  'Rely on us; we never get tired of building. Dependability is at our core.',
            ),
            BulletItem(
              title: 'TECHNOLOGY & INNOVATION DRIVEN',
              text:
                  'We leverage technology to bring order, efficiency, innovation & strive to be leaders in organizing the Civil, Construction and other Allied sectors.',
            ),
            BulletItem(
              title: 'EMPOWERING OUR WORKFORCE',
              text:
                  'We value and uplift our blue-collar workforce by emphasizing skill development, certifications, and world-class safety and workmanship standards.',
            ),
          ],
        ),
      ],
    );
  }
}

class BulletItem extends StatelessWidget {
  final String title;
  final String text;

  const BulletItem({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 20, height: 1.4)),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                    fontSize: 16, // Set a reasonable size
                    color: Colors.black, // Use a standard color
                    fontFamily: 'Roboto', // Or your app's default
                    decoration: TextDecoration.none, // No underline/highlight
                    fontWeight: FontWeight.normal,
                  ),
                children: [
                  TextSpan(
                    text: '$title ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: text),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
