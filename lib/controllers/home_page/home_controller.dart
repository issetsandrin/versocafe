// lib/app/controllers/home_controller.dart
import 'package:mobx/mobx.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:versocafe/ui/pages/home/widgets/quick_actions.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  _HomeControllerBase() {
    actions = ObservableList.of([
      QuickAction(icon: LineAwesomeIcons.coffee_solid, label: 'Escala do Café', onTap: () => Modular.to.pushNamed('/escala')),
      QuickAction(icon: LineAwesomeIcons.certificate_solid, label: 'Ranking', onTap: () => Modular.to.pushNamed('/ranking')),
      QuickAction(icon: LineAwesomeIcons.trophy_solid, label: 'Conquistas', onTap: () => Modular.to.pushNamed('/conquistas')),
      QuickAction(icon: LineAwesomeIcons.user_tie_solid, label: 'Colaboradores', onTap: () => Modular.to.pushNamed('/colaboradores')),
      QuickAction(icon: LineAwesomeIcons.cog_solid, label: 'Configurações', onTap: () => Modular.to.pushNamed('/config')),
    ]);
  }

  @observable
  String userName = 'Desenvolvedor Versotech';

  @observable
  int level = 10;

  @observable
  int selectedAction = 0;

  @observable
  late ObservableList<QuickAction> actions;

  @computed
  String get initials {
    final parts = userName.trim().split(' ');
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return (parts.first[0] + parts.last[0]).toUpperCase();
  }

  @action
  void selectAction(int i) => selectedAction = i;
}
