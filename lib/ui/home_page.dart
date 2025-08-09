import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:versocafe/ui/widgets/quick_actions/quick_actions.dart';
import 'widgets/app_bar/gradient_header.dart';
import 'widgets/quick_actions/quick_actions_bar.dart';
import 'widgets/cafe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedAction = 0;

  late final List<QuickAction> _actions = [
    QuickAction(icon: LineAwesomeIcons.coffee_solid, label: 'Escala do Café', onTap: () {}),
    QuickAction(icon: LineAwesomeIcons.user_tie_solid, label: 'Colaboradores', onTap: () {}),
    QuickAction(icon: LineAwesomeIcons.certificate_solid, label: 'Ranking', onTap: () {}),
    QuickAction(icon: LineAwesomeIcons.trophy_solid, label: 'Conquistas', onTap: () {}),
    QuickAction(icon: LineAwesomeIcons.cog_solid, label: 'Configurações', onTap: () {}),
  ];

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return (parts[0][0] + parts.last[0]).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final initials = _getInitials("Vitor Sandrin");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GradientHeader(
        height: 180,
        initials: initials,
        titleGreeting: "Olá, Vitor",
        subtitle: "Seja bem vindo ao VersoCafé!",
        levelText: "Nivel 1",
      ),
      body: Column(
        children: [
          QuickActionsBar(
            actions: _actions,
            selectedIndex: _selectedAction,
            onSelected: (i) => setState(() => _selectedAction = i),
          ),
          // Expanded(child: _buildBody(_selectedIndex)),
        ],
      ),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
          children: const [
            CafeCard(name: "Ana Souza", role: "Barista", rating: 4.7),
            CafeCard(name: "João Pedro", role: "Atendente", rating: 4.2),
          ],
        );
      case 1:
        return const Center(child: Text("Missões em breve..."));
      case 2:
        return const Center(child: Text("Perfil em construção..."));
      default:
        return const Center(child: Text("Página não encontrada"));
    }
  }
}
