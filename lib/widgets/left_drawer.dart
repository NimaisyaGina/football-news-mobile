import 'package:football_news/screens/news_entry_list.dart';
import 'package:flutter/material.dart';
// Impor halaman menu.dart dari folder screens
import 'package:football_news/screens/menu.dart';
// Impor halaman newslist_form.dart dari folder screens
import 'package:football_news/screens/newslist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Bagian DrawerHeader (T7 [cite: 135-157])
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Text(
                  'Football News',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Seluruh berita sepak bola terkini di sini!",
                  // TODO [cite: 152-153] diisi
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          // Bagian routing (T7 [cite: 106-118])
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          // Bagian routing (T7 [cite: 124, 125, 130])
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Add News'),
            // Bagian redirection ke NewsFormPage
            onTap: () {
              // TODO  diisi
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewsFormPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_reaction_rounded),
            title: const Text('News List'),
            onTap: () {
                // Route to news list page
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewsEntryListPage()),
                );
            },
        ),
        ],
      ),
    );
  }
}