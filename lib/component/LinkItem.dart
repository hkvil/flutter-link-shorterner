import 'package:flutter/material.dart';
import 'package:learn_provider_1/component/CopyIconButton.dart';

class LinkItem extends StatelessWidget {
  final String longUrl;
  final String shortUrl;
  const LinkItem({super.key, required this.longUrl, required this.shortUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Card.outlined(
        child: ListTile(
          title: Text(shortUrl),
          subtitle: Text(longUrl),
          trailing: CopyIconButton(text: shortUrl),
        ),
      ),
    );
  }
}
