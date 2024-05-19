import 'package:flutter/material.dart';

Widget suggestText(
    BuildContext context, TextEditingController queryText, String suggestText) {
  final search = queryText.text.toLowerCase();
  final text = suggestText;
  final matches = search.allMatches(text.toLowerCase()).toList();
  final spans = <TextSpan>[];

  if (matches.isEmpty) {
    spans.add(TextSpan(text: text, style: const TextStyle(color: Colors.grey)));
  } else {
    for (int i = 0; i < matches.length; i++) {
      final strStart = i;
      final match = matches[i];
      // From the first str to the first match str
      spans.add(
        TextSpan(
          text: text.substring(
            strStart,
            match.start,
          ),
          style: const TextStyle(color: Colors.grey),
        ),
      );
      // Matches str
      spans.add(
        TextSpan(
          text: text.substring(
            match.start,
            match.end,
          ),
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      );
    }
    // From the end of match str to the end
    spans.add(TextSpan(
      text: text.substring(matches.last.end),
      style: const TextStyle(color: Colors.grey),
    ));
  }

  return RichText(
      text: TextSpan(
    style: const TextStyle(fontSize: 13),
    children: spans,
  ));
}
