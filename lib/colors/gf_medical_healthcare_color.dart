import 'package:flutter/material.dart';

class GFMedicalHealthcareColors {
  // 🔷 Primary Healthcare Colors
  static const Color MEDICAL_BLUE = Color(0xFF1976D2);         // Trust, reliability
  static const Color HOSPITAL_WHITE = Color(0xFFF1F8FF);       // Clean, sterile
  static const Color SCRUB_GREEN = Color(0xFF388E3C);          // Healing, balance
  static const Color HEALTH_TEAL = Color(0xFF00796B);          // Calm, reassurance

  // 🌡️ Alert & Status Colors
  static const Color ALERT_RED = Color(0xFFD32F2F);            // Urgency, alerts
  static const Color WARNING_ORANGE = Color(0xFFF57C00);       // Caution
  static const Color STABLE_YELLOW = Color(0xFFFFF176);        // Monitoring
  static const Color CRITICAL_PURPLE = Color(0xFF7E57C2);      // Diagnostic

  // 🩺 Neutral & Functional Colors
  static const Color DOCTOR_GRAY = Color(0xFF757575);          // Text & icons
  static const Color LAB_BACKGROUND = Color(0xFFF5F5F5);       // Card/background
  static const Color PHARMA_SILVER = Color(0xFFE0E0E0);        // Divider, border

  // 💊 Specialty Color Tags
  static const Color PEDIATRIC_PINK = Color(0xFFF8BBD0);       // Kids healthcare
  static const Color DENTAL_BLUE = Color(0xFF64B5F6);          // Dental theme
  static const Color SURGICAL_GREEN = Color(0xFF81C784);       // Surgery theme
  static const Color WELLNESS_INDIGO = Color(0xFF5C6BC0);      // Mental health

  // 🧬 Department Color Map
  static const Map<String, Color> departmentColors = {
    'General': MEDICAL_BLUE,
    'Emergency': ALERT_RED,
    'Pediatrics': PEDIATRIC_PINK,
    'Dental': DENTAL_BLUE,
    'Surgery': SURGICAL_GREEN,
    'MentalHealth': WELLNESS_INDIGO,
    'Pharmacy': HEALTH_TEAL,
    'Radiology': CRITICAL_PURPLE,
  };

  // 🌈 Suggested UI Groupings
  static const List<Color> statusColors = [
    ALERT_RED,
    WARNING_ORANGE,
    STABLE_YELLOW,
    CRITICAL_PURPLE,
  ];

  static const List<Color> backgroundColors = [
    HOSPITAL_WHITE,
    LAB_BACKGROUND,
    PHARMA_SILVER,
  ];

  static const List<Color> specialtyColors = [
    PEDIATRIC_PINK,
    DENTAL_BLUE,
    SURGICAL_GREEN,
    WELLNESS_INDIGO,
  ];
}
