import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContentMenuItem extends StatelessWidget {
  const ContentMenuItem({super.key, required this.tutorial});

  final QueryDocumentSnapshot tutorial;

  @override
  Widget build(BuildContext context) {
    final thumbUrl = tutorial.get('thumb_url');
    String? localeName = AppLocalizations.of(context)?.localeName;
    final title = tutorial.get('title_$localeName');

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: MaterialButton(
        color: Colors.white60,
        padding: const EdgeInsets.only(
            left: 6.0, top: 9.0, right: 12.0, bottom: 9.0),
        onPressed: () {
          context.go('/tutorial/${tutorial.id}');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (thumbUrl?.isNotEmpty == true)
              Image(
                image: CachedNetworkImageProvider(thumbUrl),
                width: 120.0,
              ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}
