import 'package:flutter/material.dart';
// Impor ItemHomepage dari menu.dart
import 'package:football_news/screens/menu.dart';
// Impor halaman form
import 'package:football_news/screens/newslist_form.dart';

// Widget ItemCard dari T6 [cite: 1514], dipindah ke file ini di T7 
class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.secondary, // T6 [cite: 1521]
      borderRadius: BorderRadius.circular(12), // T6 [cite: 1523]
      child: InkWell(
        // Logika onTap diubah di T7 [cite: 532-540]
        onTap: () {
          // Menampilkan SnackBar T6 [cite: 1528]
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          // Navigasi T7 [cite: 538]
          if (item.name == "Tambah Berita") {
            // TODO [cite: 539] diisi
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewsFormPage(),
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}