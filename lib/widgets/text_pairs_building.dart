import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/theme_mode_toggler.dart';

// Вспомогательный метод для генерации пар текст-подтекст
List<Widget> buildTextPairs(List<(String, String)> pairs) {
  return pairs.expand((pair) {
    return [
      // Заголовок
      Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 4),
        child: Row(
          children: [
            Icon(Icons.circle, size: 10, color: Colors.blue),
            SizedBox(width: 8),
            LayoutBuilder(builder: (context, _) =>
            MouseRegion(
              cursor: SystemMouseCursors.text,
                child: SelectableText(
              pair.$1,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: context.read<ThemeToggler>().isDarkMode ? Colors.white : Colors.grey[900],
              )),
            ),),
          ],
        )
      ),
      // Подтекст
      MouseRegion(
      cursor: SystemMouseCursors.text,
      child: SelectableText(
        pair.$2,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          height: 1.5,
          color: Colors.grey[700],
        ),
      ),
      )];
  }).toList();
}