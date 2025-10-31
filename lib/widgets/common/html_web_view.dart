// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class HtmlWebView extends StatefulWidget {
//   const HtmlWebView({super.key, required this.htmlContent});

//   final String htmlContent;

//   @override
//   State<HtmlWebView> createState() => _HtmlWebViewState();
// }

// class _HtmlWebViewState extends State<HtmlWebView> {
//   late final WebViewController _controller;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the controller with default settings
//     _controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted);

//     _loadHtmlContent();
//   }

//   void _loadHtmlContent() {
//     final base64Content = base64Encode(
//       const Utf8Encoder().convert(widget.htmlContent),
//     );
//     _controller.loadRequest(Uri.parse('data:text/html;base64,$base64Content'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WebViewWidget(controller: _controller);
//   }
// }
