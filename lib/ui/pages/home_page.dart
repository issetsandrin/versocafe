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
        builder: (_) => Column(
          children: [
            QuickActionsBar(
              actions: controller.actions,
              selectedIndex: controller.selectedAction,
              onSelected: (i) {
                controller.selectAction(i);
                controller.actions[i].onTap.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}
