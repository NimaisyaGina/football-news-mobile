import 'package:flutter/material.dart';
// Impor widget drawer
import 'package:football_news/widgets/left_drawer.dart';
// Impor widget news_card
import 'package:football_news/widgets/news_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // Variabel dari T6 [cite: 1452, 1453, 1454]
  final String nama = "Nimaisya Gina Herapati";
  final String npm = "2406429885";
  final String kelas = "C";

  // List items dari T6[cite: 1502], "Add News" diubah menjadi "Tambah Berita"
  // agar sesuai dengan logika navigasi di T7 [cite: 538]
  final List<ItemHomepage> items = [
    ItemHomepage("See Football News", Icons.newspaper),
    ItemHomepage("Tambah Berita", Icons.add),
    ItemHomepage("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Football News',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary, // T6 [cite: 1588]
      ),
      // Tambahkan drawer T7 [cite: 178]
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row InfoCard T6 [cite: 1596-1602]
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: nama),
                InfoCard(title: 'Class', content: kelas),
              ],
            ),
            const SizedBox(height: 16.0), // T6 [cite: 1604]
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Selamat datang di Football News', // T6 [cite: 1612]
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  // GridView T6 [cite: 1629-1640]
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ItemHomepage item) {
                      // Menggunakan ItemCard dari news_card.dart
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// InfoCard T6 [cite: 1458-1488]
class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

// ItemHomepage T6 [cite: 1495-1499]
class ItemHomepage {
  final String name;
  final IconData icon;
  ItemHomepage(this.name, this.icon);
}