import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:social_login_notification/pages/login.page.dart';
import 'package:social_login_notification/pages/messages.page.dart';
import 'package:social_login_notification/pages/profile.page.dart';
import 'package:social_login_notification/pages/settings.page.dart';
import 'package:social_login_notification/pages/splash_screen.page.dart';
import 'package:social_login_notification/widgets/my_drawer/my_drawer.store.dart';
import 'package:get_it/get_it.dart';

class MyDrawer extends StatelessWidget {
  final myDrawerStore = GetIt.I.get<MyDrawerStore>();
  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: const Color(0xFFece2d3)),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,

                  backgroundImage: NetworkImage(
                    FirebaseAuth.instance.currentUser!.photoURL ??
                        "https://www.gravatar.com/avatar/placeholder",
                  ),
                ),

                SizedBox(height: 16),

                Text(
                  FirebaseAuth.instance.currentUser!.displayName ?? "No name",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Observer(
            builder: (context) {
              return ListTile(
                leading: Icon(Icons.person),
                title: Text("Perfil"),
                selected: myDrawerStore.selectedMenu == 1,
                onTap: () {
                  myDrawerStore.setSelectMenu(1);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              );
            },
          ),
          Observer(
            builder: (context) {
              return ListTile(
                leading: Icon(Icons.favorite),
                title: Text("Favoritos"),
                selected: myDrawerStore.selectedMenu == 2,
                onTap: () {
                  myDrawerStore.setSelectMenu(2);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SplashScreenPage()),
                  );
                },
              );
            },
          ),
          Observer(
            builder: (context) {
              return ListTile(
                leading: Icon(Icons.email),
                title: Text("Mensagens"),
                selected: myDrawerStore.selectedMenu == 3,
                onTap: () {
                  myDrawerStore.setSelectMenu(3);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MessagePage()),
                  );
                },
              );
            },
          ),

          Divider(height: 1, thickness: 1),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text("Aplicativo"),
          ),

          Observer(
            builder: (context) {
              return ListTile(
                leading: Icon(Icons.settings),
                title: Text("Configurações"),
                selected: myDrawerStore.selectedMenu == 4,
                onTap: () {
                  myDrawerStore.setSelectMenu(4);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
              );
            },
          ),

          Observer(
            builder: (context) {
              return ListTile(
                leading: Icon(Icons.info),
                title: Text("Sobre"),
                selected: myDrawerStore.selectedMenu == 5,
                onTap: () {
                  myDrawerStore.setSelectMenu(5);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SplashScreenPage()),
                  );
                },
              );
            },
          ),

          Observer(
            builder: (context) {
              return ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Sair"),
                selected: myDrawerStore.selectedMenu == 6,
                onTap: () async {
                  myDrawerStore.setSelectMenu(6);
                  await FirebaseAuth.instance.signOut();

                  if (!context.mounted) return;

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
