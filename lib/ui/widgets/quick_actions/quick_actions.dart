import 'package:flutter/material.dart';

class QuickAction {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  QuickAction({required this.icon, required this.label, required this.onTap});
}
