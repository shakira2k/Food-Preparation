import 'package:dinnerdive/functions/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var datas;
  var name = '';
  var email = '';
  void gettheData() async {
    datas = await FirebaseFunctions.displayUser();
    setState(() {
      name = datas['name'];
      email = datas['email'];
    });
  }

  @override
  Widget build(BuildContext context) {
    gettheData();
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              clipBehavior: Clip.antiAlias,
              child: UserAccountsDrawerHeader(
                accountName: Text(name), // Use the name variable here
                accountEmail: Text(email), // Use the email variable here
                currentAccountPicture: Card(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/user.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

            ),
          // const Card(
          //     child: ListTile(
          //       leading: Icon(Icons.edit),
          //       title: Text('Edit profile'),
          // )),
          // const Card(
          //     child: ListTile(
          //        leading: Icon(Icons.settings),
          //      title: Text('Settings'),
          // )),
          // Card(
          //     child: ListTile(
          //         onTap: () => FirebaseFunctions.userLogout(context),
          //        leading: const Icon(Icons.logout),
          //        title: const Text('Logout'),
          // )))
          )
        ],
      ),
    );
  }
}
