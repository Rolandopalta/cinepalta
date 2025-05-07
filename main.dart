import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(PeliculaApp());

class PeliculaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ver Películas',
      theme: ThemeData.dark(),
      home: PeliculaHome(),
    );
  }
}

class PeliculaHome extends StatelessWidget {
  final List<Map<String, String>> peliculas = [
    {'titulo': 'Película 1', 'url': 'https://servidor.com/video1.mp4'},
    {'titulo': 'Película 2', 'url': 'https://servidor.com/video2.mp4'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catálogo de Películas')),
      body: ListView.builder(
        itemCount: peliculas.length,
        itemBuilder: (context, index) {
          final peli = peliculas[index];
          return ListTile(
            title: Text(peli['titulo']!),
            trailing: Icon(Icons.play_arrow),
            onTap: () async {
              final url = Uri.parse(peli['url']!);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
          );
        },
      ),
    );
  }
}