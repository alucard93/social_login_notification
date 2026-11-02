import 'package:flutter/material.dart';
import 'package:social_login_notification/widgets/my_drawer/my_drawer.widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configurações")),
      drawer: MyDrawer(),
      body: Center(child: Text("Página de configurações")),
    );
  }
}
