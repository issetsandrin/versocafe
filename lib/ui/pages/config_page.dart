import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});
  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  bool lembreteCafe = true;
  bool rankingSemanal = false;
  bool somNotificacoes = true;
  bool modoEscuro = false;

  Color get _accent => const Color(0xFFFF7A00);
  Color get _tileIconBg => const Color(0xFFFFF3E8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          padding: const EdgeInsets.all(5),
          constraints: const BoxConstraints(),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          _IosHeader(title: 'Configurações'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              children: [
                const SizedBox(height: 24),
                _SectionHeader(label: 'Perfil', icon: LineAwesomeIcons.user),
                const SizedBox(height: 8),
                _CardContainer(
                  children: [
                    _NavTile(
                      icon: LineAwesomeIcons.user_edit_solid,
                      iconBg: _tileIconBg,
                      iconColor: _accent,
                      title: 'Editar Perfil',
                      subtitle: 'Nome e informações pessoais',
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _SectionHeader(
                  label: 'Notificações',
                  icon: LineAwesomeIcons.bell,
                ),
                const SizedBox(height: 8),
                _CardContainer(
                  children: [
                    _SwitchTile(
                      icon: LineAwesomeIcons.bell,
                      iconBg: _tileIconBg,
                      iconColor: _accent,
                      title: 'Lembrete do Café',
                      subtitle: 'Notificar no slack quando for meu dia',
                      value: lembreteCafe,
                      onChanged: (v) => setState(() => lembreteCafe = v),
                    ),
                    const _ItemDivider(),
                    _SwitchTile(
                      icon: LineAwesomeIcons.volume_up_solid,
                      iconBg: _tileIconBg,
                      iconColor: _accent,
                      title: 'Som das Notificações',
                      subtitle: 'Ativar sons de alerta',
                      value: somNotificacoes,
                      onChanged: (v) => setState(() => somNotificacoes = v),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _SectionHeader(
                  label: 'Aparência',
                  icon: LineAwesomeIcons.paint_brush_solid,
                ),
                const SizedBox(height: 8),
                _CardContainer(
                  children: [
                    _SwitchTile(
                      icon: LineAwesomeIcons.moon,
                      iconBg: _tileIconBg,
                      iconColor: _accent,
                      title: 'Modo Escuro',
                      subtitle: 'Tema escuro para o app',
                      value: modoEscuro,
                      onChanged: (v) => setState(() => modoEscuro = v),
                    ),
                    const _ItemDivider(),
                    _NavTile(
                      icon: LineAwesomeIcons.paint_brush_solid,
                      iconBg: _tileIconBg,
                      iconColor: _accent,
                      title: 'Tema',
                      subtitle: 'Personalizar as cores do aplicativo',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IosHeader extends StatelessWidget {
  const _IosHeader({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Container(
      width: double.infinity,
      color: const Color(0xFFF2F2F7),
      padding: EdgeInsets.fromLTRB(16, top + 12, 16, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 45,
            decoration: const BoxDecoration(
              color: Color(0xFFFFF3E8), // fundo igual aos demais
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Icon(
              LineAwesomeIcons.cog_solid,
              size: 23,
              color: Color(0xFFFF7A00), // laranja principal
            ),
          ),
          const SizedBox(width: 12),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                height: 1.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.label, required this.icon});
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 22, color: Color(0xFFFF7A00)),
        const SizedBox(width: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: const Color(0xFF6C6C6C),
            letterSpacing: 0.6,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class _CardContainer extends StatelessWidget {
  const _CardContainer({required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
        border: Border.all(color: const Color(0x10FF7A00)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(children: children),
      ),
    );
  }
}

class _ItemDivider extends StatelessWidget {
  const _ItemDivider();
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Divider(height: 1, color: Color(0x10FF7A00)),
    );
  }
}

class _LeadingIcon extends StatelessWidget {
  const _LeadingIcon({
    required this.icon,
    required this.bg,
    required this.color,
  });
  final IconData icon;
  final Color bg;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Icon(icon, color: color, size: 22),
    );
  }
}

class _SwitchTile extends StatelessWidget {
  const _SwitchTile({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          _LeadingIcon(icon: icon, bg: iconBg, color: iconColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(color: Color(0xFF8A8A8A)),
                ),
              ],
            ),
          ),
          Transform.scale(
            scale: 0.8,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.white,
              activeTrackColor: const Color(0xFFFF7A00), // laranja ativo
              inactiveThumbColor: Colors.white, // círculo branco
              inactiveTrackColor: const Color(0xFFE5E5EA), // cinza iOS
              thumbIcon: MaterialStateProperty.all(
                const Icon(null),
              ), // remove ícone de check em M3
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              trackOutlineColor: MaterialStateProperty.all(
                Colors.transparent,
              ), // remove borda escura
            ),
          ),
        ],
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.onTap,
  });
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            _LeadingIcon(icon: icon, bg: iconBg, color: iconColor),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Color(0xFF8A8A8A)),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
