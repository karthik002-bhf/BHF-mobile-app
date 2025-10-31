import 'package:bhf_mobile_app/models/static_data.dart';
import 'package:bhf_mobile_app/screens/profile_screen.dart';
import 'package:bhf_mobile_app/widgets/home/home_first_content.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.categoryData});
  final List<dynamic> categoryData;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorScheme.primary,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 110, 168, 238), // Navy
                Color.fromARGB(255, 129, 156, 188), // Navy
                // Color(0xFFF3F6F9), // Concrete Grey
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/images/BHF Logo A-01.png',
              width: 52,
              height: 48,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BHF Tech Solution',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimary,
                  ),
                ),
                Text(
                  'Build Home Fine At Its First',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: colorScheme.tertiaryFixed,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const ProfileScreen()),
              );
            },
            icon: Icon(
              Icons.account_circle_rounded,
              size: 34,
              color: colorScheme.onPrimary,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE6EBF6), // Subtle blue
              Color(0xFFF3F6F9), // Very light grey
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.categoryData.isNotEmpty)
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 86, 151, 231), // Navy
                          Color.fromARGB(255, 186, 204, 243), // Subtle blue
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Column(
                      children: [
                        Text(
                          'C-Mart',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                              ),
                          // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: colorScheme.secondary),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        HomeFirstContent(catItems: widget.categoryData, from: 'cmart'),
                      ],
                    ),
                  ),
                ),
              if (widget.categoryData.isEmpty)
                const Center(child: CircularProgressIndicator()),
              const SizedBox(height: 14),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                elevation: 6,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      colors: [
                        // Color(0xFF174378), // Navy
                        // Color(0xFFE6EBF6), // Subtle blue
                        Color.fromARGB(255, 86, 151, 231), // Navy
                        Color.fromARGB(255, 186, 204, 243), // P
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  // decoration: BoxDecoration(
                  //   color: colorScheme.primary.withOpacity(0.05),
                  //   borderRadius: BorderRadius.circular(24),
                  // ),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Column(
                    children: [
                      Text(
                        'Construction Tech services',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: colorScheme.primary),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      HomeFirstContent(catItems: ctsData, from: 'cts'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// HomeFirstContent: no major code changes needed except light color update if used
