import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  final String content;
  const WordCard({super.key, this.content = ''});

  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: content.isNotEmpty ? Text(content, overflow: TextOverflow.visible,)
          : const SizedBox(width: 30,
        height: 20,),
    ),);
  }
}
