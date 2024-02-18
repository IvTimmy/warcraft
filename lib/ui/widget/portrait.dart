import 'package:flutter/material.dart';

class Portrait extends StatelessWidget {
  final String _url;

  const Portrait(this._url, {super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      backgroundImage: NetworkImage(_url),
    );
  }
}
