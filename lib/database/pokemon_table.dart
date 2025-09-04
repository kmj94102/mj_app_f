import 'package:intl/intl.dart';

class PokemonCounter {
  final int? id;
  final String name;
  final String image;
  final String shinyImage;
  final String spotlight;
  final int count;
  final bool isCatch;
  final int timestamp;

  PokemonCounter({
    this.id,
    required this.name,
    required this.image,
    required this.shinyImage,
    required this.spotlight,
    required this.count,
    required this.isCatch,
    required this.timestamp,
  });

  factory PokemonCounter.fromMap(Map<String, dynamic> map) {
    return PokemonCounter(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      shinyImage: map['shinyImage'],
      spotlight: map['spotlight'],
      count: map['count'],
      isCatch: map['isCatch'] == 1,
      timestamp: map['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'shinyImage': shinyImage,
      'spotlight': spotlight,
      'count': count,
      'isCatch': isCatch ? 1 : 0,
      'timestamp': timestamp,
    };
  }

  String get getFormattedCount {
    final formatter = NumberFormat('#,###');
    return formatter.format(count);
  }
}
