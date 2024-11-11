import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Favorite Cards'),
        ),
        body: FavoriteCards(),
      ),
    );
  }
}

class FavoriteCard {
  final String title;
  final String description;
  bool isFavorite;

  FavoriteCard({required this.title, required this.description, this.isFavorite = false});
}

class FavoriteCards extends StatefulWidget {
  @override
  _FavoriteCardState createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCards> {
  final List<FavoriteCard> _favoriteCards = [
    FavoriteCard(title: 'Card 1', description: 'This is the first card'),
    FavoriteCard(title: 'Card 2', description: 'This is the second card'),
    FavoriteCard(title: 'Card 3', description: 'This is the third card'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _favoriteCards.length,
      itemBuilder: (context, index) {
        final card = _favoriteCards[index];
        return Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(card.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text(card.description),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(_isFavorite(index) ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                      onPressed: () => _toggleFavorite(index),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _isFavorite(int index) {
    return _favoriteCards[index].isFavorite;
  }

  void _toggleFavorite(int index) {
    setState(() {
      _favoriteCards[index].isFavorite = !_favoriteCards[index].isFavorite;
    });
  }
}