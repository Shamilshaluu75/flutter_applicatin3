// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_applicatin3/login.dart';
import 'package:flutter_applicatin3/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomePagescreen extends StatefulWidget {
  const HomePagescreen({super.key});

  @override
  State<HomePagescreen> createState() => _HomePagescreenState();
}

class _HomePagescreenState extends State<HomePagescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        //text
        title: const Text("HOME"),
        centerTitle: true,

        //bg color
        backgroundColor: const Color.fromARGB(255, 47, 140, 211),
        leading: Icon(Icons.home),

        //Actions
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt))
        ],
        //shape
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),

        //Elevation
        elevation: 30,
        shadowColor: Colors.black,
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    alert(context);
                  },
                  title: const Text("SHAMIL"),
                  subtitle: const Text("23 minutes ago"),
                  leading: CircleAvatar(
                      backgroundImage: AssetImage("lib/assets/images/zw-toyota-fortuner-2020-3_lead.webp")),
                  trailing: const Icon(Icons.more_vert),
                ),
                const ListTile(
                  title: Text(
                    "From her comeback after...",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                Image.asset('lib/assets/images/WhatsApp Image 2024-05-27 at 11.11.41_1959de19.jpg'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.comment_rounded),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            child: Column(
              children: [
                const ListTile(
                  title: Text("Zayn"),
                  subtitle: Text("45 minutes ago"),
                  leading: CircleAvatar(
                      backgroundImage:
                          AssetImage("lib/assets/WhatsApp Image 2024-05-27 at 11.11.41_0d4d56f4.jpg")),
                  trailing: Icon(Icons.more_vert),
                ),
                const ListTile(
                  title: Text(
                    ".......!!!! ",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                Image.asset('lib/assets/WhatsApp Image 2024-05-27 at 11.11.41_0d4d56f4.jpg'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.comment_rounded),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            child: Column(
              children: [
                ListTile(
                  title: Text("LONDON"),
                  subtitle: Text("45 minutes ago"),
                  leading: CircleAvatar(
                      backgroundImage:
                          AssetImage("lib/assets/WhatsApp Image 2024-05-27 at 11.11.41_0d4d56f4.jpg")),
                  trailing: Icon(Icons.more_vert),
                ),
                ListTile(
                  title: Text(
                    "vacation at london ",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                Image.asset('lib/assets/WhatsApp Image 2024-05-27 at 11.11.41_0d4d56f4.jpg'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.comment_rounded),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  void alert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Manju'),
            content: Text('industry'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'))
            ],
          );
        });
  }

  //bldc object  ctx parameter
  void sigout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        //ctx para builder fun
        return AlertDialog(
          title: Text('Logout'),
          content: Text('You want logout this App'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Logouting(context);
                },
                child: Text('Yes')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No'))
          ],
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  void Logouting(BuildContext ctx) async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (ctx) =>LoginScreen ()),
      (route) => false, // This line removes all previous routes from the stack
    );
    final shared = await SharedPreferences.getInstance();
    shared.setBool(save_key, false);
  }
}
  