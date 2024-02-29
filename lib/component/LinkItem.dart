import 'package:flutter/material.dart';

class LinkItem extends StatelessWidget {
  final String longUrl;
  final String shortUrl;
  const LinkItem({super.key, required this.longUrl, required this.shortUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card.outlined(
        child: Column(
          children: [
            ListTile(
              title: Text(shortUrl),
              subtitle: Text(longUrl),
            )
          ],
        ),
      ),
    );
  }
}
