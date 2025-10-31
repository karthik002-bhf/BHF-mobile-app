import 'package:flutter/material.dart';

class ExecutionProcess extends StatelessWidget {
  const ExecutionProcess({
    super.key,
    required this.processDescription,
    required this.executionProcess,
  });
  final String processDescription;
  final List<dynamic> executionProcess;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          Text(
            'Execution Process',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          Text(processDescription, textAlign: TextAlign.center),
          const SizedBox(height: 10),
          // Use Column instead of ListView.builder for all items inside scroll view
          Column(
            children: executionProcess
                .map((service) => ServiceContainer(service: service))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ServiceContainer extends StatelessWidget {
  const ServiceContainer({super.key, required this.service});
  final Map<String, String> service;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 203, 200, 200),
              Colors.grey.shade200,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.asset(
                  service['img'].toString(),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  service['title'].toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Padding(
                // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                padding: const EdgeInsets.fromLTRB(16, 2, 16, 12),
                child: Text(
                  service['description'].toString(),
                  style: TextStyle(color: Colors.grey.shade700),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





















// import 'package:flutter/material.dart';

// class ExecutionProcess extends StatelessWidget {
//   const ExecutionProcess({
//     super.key,
//     required this.processDescription,
//     required this.executionProcess,
//   });
//   final String processDescription;
//   final List<dynamic> executionProcess;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           'Execution Process',
//           style: TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         Text(processDescription, textAlign: TextAlign.center),

//         const SizedBox(height: 8),
//         ListView.builder(
//           itemCount: executionProcess.length,
//           physics: NeverScrollableScrollPhysics(),

//           itemBuilder: ((context, index) {
//             return ServiveContainer(sercice: executionProcess[index]);
//           }),
//         ),
//       ],
//     );
//   }
// }

// class ServiveContainer extends StatelessWidget {
//   const ServiveContainer({super.key, required this.sercice});
//   final Map<String, String> sercice;

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     return Column(
//       children: [
//         Expanded(
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(14),
//               boxShadow: [
//                 BoxShadow(
//                   color: colorScheme.primary.withOpacity(0.07),
//                   spreadRadius: 2,
//                   blurRadius: 10,
//                 ),
//               ],
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(14),
//               child: Image.asset(
//                 sercice['img'].toString(),
//                 width: double.infinity,
//                 height: double.infinity,
//                 // width: imageWidth,
//                 // height: imageWidth,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 12),
//         Text(sercice['title'].toString()),
//         const SizedBox(height: 12),
//         Text(sercice['description'].toString()),
//       ],
//     );
//   }
// }
