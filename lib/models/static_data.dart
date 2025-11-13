import 'package:bhf_mobile_app/screens/cts/interiors_screen.dart';
import 'package:bhf_mobile_app/screens/cts/material_testing_screen.dart';
import 'package:bhf_mobile_app/screens/cts/painting_screen.dart';
import 'package:bhf_mobile_app/screens/cts/plan_and_design_screen.dart';
import 'package:bhf_mobile_app/screens/cts/pmc_screen.dart';
import 'package:bhf_mobile_app/screens/cts/repair_and_renovation_screen.dart';
import 'package:bhf_mobile_app/screens/cts/surveying_screen.dart';
import 'package:bhf_mobile_app/screens/cts/waterproof_screen.dart';

final List<dynamic> ctsData = [
  {
    "id": 1,
    "name": "Surveying",
    "category_image_url": "assets/images/Surveying/property_survey.jpg",
    "slug": '/cts/Surveying',
    'page_route': SurveyingScreen(),
  },
  {
    "id": 2,
    "name": "Planning & Design",
    "category_image_url": "assets/images/CTS/planning and design.png",
    "slug": '/cts/DesignServices',
    'page_route': PlanAndDesignScreen(),
  },
  {
    "id": 3,
    "name": "PMC",
    "category_image_url": "assets/images/Pmc/PMC_banner_image.jpg",
    "slug": '/cts/PMC',
    'page_route': PmcScreen(),
  },
  {
    "id": 4,
    "name": "Material Testing",
    "category_image_url": "assets/images/CTS/material testing.png",
    "slug": '/cts/LabTest',
    'page_route': MaterialTestingScreen(),
  },
  {
    "id": 5,
    "name": "Interior",
    "category_image_url": "assets/images/CTS/interiors.png",
    "slug": '/cts/Interiors',
    'page_route': InteriorsScreen(),
  },
  {
    "id": 6,
    "name": "Waterproofing",
    "category_image_url":
        "assets/images/Waterproofing/waterproofing_banner.JPG",
    "slug": '/cts/Waterproof',
    'page_route': WaterproofScreen(),
  },
  {
    "id": 7,
    "name": "Painting",
    "category_image_url": "assets/images/Painting/painting_banner_image.JPG",
    "slug": '/cts/Painting',
    'page_route': PaintingScreen(),
  },
  {
    "id": 8,
    "name": "Repair & Renovation",
    "category_image_url": "assets/images/CTS/repair and renovation.png",
    "slug": '/cts/RepairAndRenovations',
    'page_route': RepairAndRenovationScreen(),
  },
];
