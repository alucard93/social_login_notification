import 'package:flutter/material.dart';
import 'package:social_login_notification/widgets/my_drawer/my_drawer.widget.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Center(child: Text("Página de mensagens")),
    );
  }
}
