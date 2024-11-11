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

class FavoriteCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isFavorite;
  final VoidCallback onFavoriteToggled;

  FavoriteCard({
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.onFavoriteToggled,
  });

  @override
  Widget build(BuildContext context) {
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
                      Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text(description),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                  onPressed: onFavoriteToggled,
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
  }
}

class FavoriteCards extends StatefulWidget {
  @override
  _FavoriteCardsState createState() => _FavoriteCardsState();
}

class _FavoriteCardsState extends State<FavoriteCards> {
  final List<FavoriteCard> _favoriteCards = [
    FavoriteCard(
      title: 'Card 1',
      description: 'This is the first card',
      isFavorite: false,
      onFavoriteToggled: () {},
    ),
    FavoriteCard(
      title: 'Card 2',
      description: 'This is the second card',
      isFavorite: true,
      onFavoriteToggled: () {},
    ),
    FavoriteCard(
      title: 'Card 3',
      description: 'This is the third card',
      isFavorite: false,
      onFavoriteToggled: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _favoriteCards.length,
      itemBuilder: (context, index) {
        return _favoriteCards[index];
      },
    );
  }
}