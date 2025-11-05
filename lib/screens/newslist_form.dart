import 'package:flutter/material.dart';
// Impor drawer [cite: 191]
import 'package:football_news/widgets/left_drawer.dart';

class NewsFormPage extends StatefulWidget {
  const NewsFormPage({super.key});
  @override
  State<NewsFormPage> createState() => _NewsFormPageState();
}

class _NewsFormPageState extends State<NewsFormPage> {
  // [cite: 226]
  final _formKey = GlobalKey<FormState>();
  // [cite: 236-241]
  String _title = "";
  String _content = "";
  String _category = "update"; // default
  String _thumbnail = "";
  bool _isFeatured = false; // default
  // [cite: 241-251]
  final List<String> _categories = [
    'transfer',
    'update',
    'exclusive',
    'match',
    'rumor',
    'analysis',
  ];

  @override
  Widget build(BuildContext context) {
    // [cite: 203]
    return Scaffold(
      appBar: AppBar(
        // [cite: 206]
        title: const Center(
          child: Text(
            'Form Tambah Berita',
          ),
        ),
        backgroundColor: Colors.indigo, // [cite: 211]
        foregroundColor: Colors.white, // [cite: 212]
      ),
      // TODO [cite: 214] diisi
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey, // [cite: 228]
        child: SingleChildScrollView(
          // [cite: 256]
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // [cite: 262]
            children: [
              // === Title === [cite: 265-291]
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Judul Berita",
                    labelText: "Judul Berita",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _title = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Judul tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // === Content === [cite: 301-328]
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Isi Berita",
                    labelText: "Isi Berita",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _content = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Isi berita tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // === Category === [cite: 330-352]
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _category,
                  items: _categories
                      .map((cat) => DropdownMenuItem(
                            value: cat,
                            child: Text(
                                cat[0].toUpperCase() + cat.substring(1)),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ),
              // === Thumbnail URL === [cite: 354-373]
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "URL Thumbnail (opsional)",
                    labelText: "URL Thumbnail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _thumbnail = value!;
                    });
                  },
                ),
              ),
              // === Is Featured === [cite: 375-386]
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text("Tandai sebagai Berita Unggulan"),
                  value: _isFeatured,
                  onChanged: (bool value) {
                    setState(() {
                      _isFeatured = value;
                    });
                  },
                ),
              ),
              // === Tombol Simpan === [cite: 390-445]
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // [cite: 406]
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Berita berhasil disimpan!'), // [cite: 410]
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Judul: $_title'), // [cite: 415]
                                    // TODO  diisi
                                    Text('Isi: $_content'), // [cite: 416]
                                    Text('Kategori: $_category'), // [cite: 417]
                                    Text('Thumbnail: $_thumbnail'), // [cite: 418]
                                    Text( // [cite: 420]
                                        'Unggulan: ${_isFeatured ? "Ya" : "Tidak"}'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        _formKey.currentState!.reset(); // [cite: 435]
                        // Reset state variables
                        setState(() {
                          _title = "";
                          _content = "";
                          _category = "update";
                          _thumbnail = "";
                          _isFeatured = false;
                        });
                      }
                    },
                    child: const Text(
                      "Simpan", // [cite: 439]
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}