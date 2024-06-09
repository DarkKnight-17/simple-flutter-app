import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_app/services/authentication.dart';

class MyDrawer extends StatefulWidget {
  final User user;
  const MyDrawer({super.key, required this.user});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late User _user;
  @override
  void initState() {
    _user = widget.user;
    super.initState();
  }

  void signOut() async {
    await Authentication.signOut(context: context);
    Get.offNamed('/signInPage');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // logo
              Column(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(_user.displayName!),
                    accountEmail: Text(_user.email!),
                    currentAccountPicture: _user.photoURL != null
                        ? ClipOval(
                            child: Material(
                              child: Image.network(
                                _user.photoURL!,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        : const ClipOval(
                            child: Material(
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.person,
                                  size: 60,
                                ),
                              ),
                            ),
                          ),
                  ),

                  // username

                  const ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Настройки'),
                  ),

                  // home list tile

                  ListTile(
                    title: const Text("На Главную"),
                    leading: const Icon(Icons.home),
                    onTap: () {
                      // close drawer
                      Get.back();
                    },
                  )
                ],
              ),
              //
              Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
                  child: ListTile(
                    title: const Text("Выйти"),
                    leading: const Icon(Icons.logout),
                    onTap: signOut,
                  )),
            ]));
  }
}
