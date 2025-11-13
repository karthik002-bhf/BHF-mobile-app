import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WhatsAppButton extends StatelessWidget {
  const WhatsAppButton({super.key});

  void launchWhatsApp(BuildContext context) async {
    final phone = "7993023562"; // Must have correct country code
    final message = Uri.encodeComponent("Hi..! BHF");
    final whatsappUri = Uri.parse("whatsapp://send?phone=$phone&text=$message");

    if (await launchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      final webUri = Uri.parse("https://wa.me/$phone?text=$message");
      if (await launchUrl(webUri)) {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("WhatsApp is not installed or cannot be opened!"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 75,
      right: 16,
      child: GestureDetector(
        onTap: () => launchWhatsApp(context),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(44),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
          ),
          child: SizedBox(
            width: 40,
            height: 40,
            child: SvgPicture.network(
              "https://upload.wikimedia.org/wikipedia/commons/6/6b/WhatsApp.svg",
              width: 40,
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Stack(children: [WhatsAppButton()]));
//   }
// }
