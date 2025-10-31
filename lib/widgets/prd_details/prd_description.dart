// import 'package:bhf_mobile_app/widgets/common/html_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PrdDescription extends StatelessWidget {
  const PrdDescription({super.key, required this.htmlContent});
  final dynamic htmlContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            "Specification:-",
            style: TextStyle(
              fontSize: 22,
              color: Colors.black87,
              fontWeight: FontWeight.w900,
              decoration: TextDecoration.underline,
              decorationColor: Colors.green,
              decorationThickness: 2.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Html(
            data: htmlContent['specifications'],
            style: {
              "body": Style(textAlign: TextAlign.justify, margin: Margins.zero,),
              "p": Style(margin: Margins.only(bottom: 0),),
            },
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            "Description:-",
            style: TextStyle(
              fontSize: 22,
              color: Colors.black87,
              fontWeight: FontWeight.w900,
              decoration: TextDecoration.underline,
              decorationColor: Colors.green,
              decorationThickness: 2.0,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Html(
            data: htmlContent['description'],
            style: {
              "body": Style(textAlign: TextAlign.justify, margin: Margins.zero),
              "p": Style(margin: Margins.only(bottom: 8)),
            },
          ),
        ),
      ],
    );
  }
}
