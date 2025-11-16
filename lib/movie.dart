import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String? id;
  final String title;
  final String director;
  final String description;
  final Timestamp timestamp;

  Movie({
    this.id,
    required this.title,
    required this.director,
    required this.description,
    required this.timestamp,
  });

  // Método para convertir desde Firestore a Movie
  factory Movie.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return Movie(
      id: snapshot.id,
      title: data['title'] ?? '',
      director: data['director'] ?? '',
      description: data['description'] ?? '',
      timestamp: data['timestamp'] ?? Timestamp.now(),
    );
  }

  // Método para convertir desde Movie a Firestore (Map)
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'director': director,
      'description': description,
      'timestamp': timestamp,
    };
  }
}
