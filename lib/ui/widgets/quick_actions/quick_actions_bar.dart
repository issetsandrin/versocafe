import 'package:flutter/material.dart';
import 'package:versocafe/ui/widgets/quick_actions/quick_actions.dart';
import 'package:versocafe/ui/widgets/quick_actions/quick_actions_button.dart';

class QuickActionsBar extends StatelessWidget {
  final List<QuickAction> actions;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const QuickActionsBar({
    super.key,
    required this.actions,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: actions.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          final a = actions[i];
          return QuickActionButton(
            icon: a.icon,
            label: a.label,
            selected: selectedIndex == i,
            onTap: () => onSelected(i),
          );
        },
      ),
    );
  }
}
