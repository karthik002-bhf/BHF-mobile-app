import 'package:bhf_mobile_app/common/config.dart';
import 'package:bhf_mobile_app/screens/category_prds_screen.dart';
import 'package:flutter/material.dart';

class PrdCatItem extends StatelessWidget {
  const PrdCatItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
    required this.from,
  });

  final dynamic category;
  final void Function() onSelectCategory;
  final String from;

  void _selectedCategory(BuildContext context) {
    if (from == 'cmart') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (cts) => CategoryPrdsScreen(
            title: category['name'],
            slug: category['slug'],
          ),
        ),
      );
    }else if (from == 'cc') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (cts) => CategoryPrdsScreen(
            title: category['name'],
            // slug: category['slug'],
            slug: 'construction-chemicals',
            subCatId: category['id'],            
          ),
        ),
      );
    }else if(from == 'cts'){
      // print('cat: $category');
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => category['page_route'],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double textSize = width > 500 ? 18 : 14;
    double imageHeight = 90; // Set your desired image height
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = colorScheme.tertiary;
    final highlightColor = colorScheme.secondary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _selectedCategory(context);
        },
        borderRadius: BorderRadius.circular(16),
        splashColor: highlightColor.withOpacity(0.3),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            SizedBox(
              height: imageHeight,
              width: imageHeight + 20,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.07),
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: category['category_image_url'] != null
                    ? from == 'cmart'
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.network(
                                '${AppConstant.imageUrl}${category['category_image_url']}',
                                width: imageHeight,
                                height: imageHeight,
                                fit: BoxFit.fill,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                category['category_image_url'],
                                width: imageHeight,
                                height: imageHeight,
                                fit: BoxFit.fill,
                              ),
                            )
                    : Text('No image found'),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              category['name'],
              style: TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:bhf_mobile_app/common/config.dart';

// class PrdCatItem extends StatelessWidget {
//   const PrdCatItem({
//     super.key,
//     required this.category,
//     required this.onSelectCategory,
//     required this.from,
//   });

//   final dynamic category;
//   final void Function() onSelectCategory;
//   final String from;

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     // double imageWidth = width > 500 ? 160 : 90;
//     double textSize = width > 500 ? 18 : 14;

//     final colorScheme = Theme.of(context).colorScheme;
//     final textColor = colorScheme.tertiary;
//     // final textColor = colorScheme.primary;
//     final highlightColor = colorScheme.primary;

//     return InkWell(
//       onTap: onSelectCategory,
//       borderRadius: BorderRadius.circular(16),
//       splashColor: const Color.fromARGB(255, 197, 189, 189),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(14),
//                   boxShadow: [
//                     BoxShadow(
//                       color: colorScheme.primary.withOpacity(0.07),
//                       spreadRadius: 2,
//                       blurRadius: 10,
//                     ),
//                   ],
//                 ),
//                 child: from == 'cmart'
//                     ? ClipRRect(
//                         borderRadius: BorderRadius.circular(14),
//                         child: Image.network(
//                           '${AppConstant.imageUrl}${category['category_image_url']}',
//                           width: 150,
//                           height: 150,
//                           // width: imageWidth +40,
//                           // height: imageWidth +5,
//                           fit: BoxFit.fill,
//                         ),
//                       )
//                     : ClipRRect(
//                         borderRadius: BorderRadius.circular(14),
//                         child: Image.asset(
//                           category['category_image_url'],
//                           width: double.infinity,
//                           height: double.infinity,
//                           // width: imageWidth,
//                           // height: imageWidth,
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//               ),
//             ),
//             const SizedBox(height: 12),
//             Text(
//               category['name'],
//               style: TextStyle(
//                 fontSize: textSize,
//                 fontWeight: FontWeight.bold,
//                 color: textColor,
//                 // letterSpacing: 0.2,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
