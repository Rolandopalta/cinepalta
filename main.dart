import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CinePalta',
      theme: ThemeData.dark(),
      home: MovieListScreen(),
    );
  }
}

class MovieListScreen extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {'title': 'Película 1', 'url': 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'},
    {'title': 'Película 2', 'url': 'https://www.youtube.com/watch?v=3JZ_D3ELwOQ'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Películas')),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            title: Text(movie['title']!),
            trailing: Icon(Icons.play_circle_outline),
            onTap: () async {
              final Uri url = Uri.parse(movie['url']!);
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                throw 'No se pudo abrir el enlace: ${movie['url']}';
              }
            },
          );
        },
      ),
    );
  }
}