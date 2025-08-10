// lib/app/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:versocafe/controllers/home_page/home_controller.dart';
import '../widgets/app_bar/gradient_header.dart';
import '../widgets/quick_actions/quick_actions_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = Modular.get<HomeController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: Observer(
          builder: (_) => GradientHeader(
            height: 180,
            initials: controller.initials,
            titleGreeting: "Olá, ${controller.userName.split(' ').first}",
            subtitle: "Seja bem vindo ao VersoCafé!",
            levelText: "Nível ${controller.level}",
          ),
        ),
      ),
      body: Observer(
        builder: (_) => SingleChildScrollView(
          child: Column(
            children: [
              QuickActionsBar(
                actions: controller.actions,
                selectedIndex: controller.selectedAction,
                onSelected: (i) {
                  controller.selectAction(i);
                  controller.actions[i].onTap.call();
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: LayoutBuilder(
                  builder: (_, c) {
                    final cards = [
                      Expanded(
                        child: StatCard(
                          icon: Icons.emoji_events_outlined,
                          iconColor: const Color(0xFFFFC107),
                          title: 'Sua Posição',
                          value: '5º',
                          footnote: '+2 esta semana',
                          footnoteColor: const Color(0xFF2ECC71),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: StatCard(
                          icon: Icons.local_cafe_outlined,
                          iconColor: const Color(0xFFFF7A00),
                          title: 'Cafés',
                          value: '12',
                          footnote: 'Proxima meta: 15 cafés',
                          footnoteColor: const Color(0xFF6C6C6C),
                        ),
                      ),
                    ];
                    return Row(children: cards);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==== widget reutilizável ====
class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.footnote,
    required this.footnoteColor,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;
  final String footnote;
  final Color footnoteColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Color(0x11000000), blurRadius: 16, offset: Offset(0, 6)),
        ],
        border: Border.all(color: const Color(0x14000000)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(icon, size: 20, color: iconColor),
            const SizedBox(width: 5),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF223344),
              ),
            ),
          ]),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F2233),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            footnote,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: footnoteColor,
            ),
          ),
        ],
      ),
    );
  }
}
