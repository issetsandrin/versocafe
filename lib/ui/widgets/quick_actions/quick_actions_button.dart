import 'package:flutter/material.dart';

class QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const QuickActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: onTap,
     splashColor: Colors.transparent,
     highlightColor: Colors.transparent,
     hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(40),
      child: SizedBox(
        width: 82,
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Color.fromARGB(33, 165, 165, 165),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Color.fromRGBO(255, 109, 0, 1)),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color:  Color.fromRGBO(255, 109, 0, 1),
                fontWeight: FontWeight.w500
              ),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
