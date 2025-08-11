import 'package:flutter_modular/flutter_modular.dart';
import 'package:versocafe/controllers/home_page/home_controller.dart';
import 'package:versocafe/ui/pages/config/config_page.dart';
import 'package:versocafe/ui/pages/home/home_page.dart';
import 'package:versocafe/ui/pages/notifies/notification_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
     i.addSingleton<HomeController>(HomeController.new);
  }

  @override
  void routes(r) {
     r.child('/',              child: (_) => HomePage());
     r.child('/escala',        child: (_) => HomePage());
     r.child('/colaboradores', child: (_) => HomePage());
     r.child('/ranking',       child: (_) => HomePage());
     r.child('/conquistas',    child: (_) => HomePage());
     r.child('/config',        child: (_) => ConfigPage());
     r.child('/notificacoes',  child: (_) => NotificationPage());
  }
}


