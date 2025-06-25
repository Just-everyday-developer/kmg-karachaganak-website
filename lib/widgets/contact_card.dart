import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

enum NumberPhoneType { whatsapp, phone, other }

class ContactCard extends StatelessWidget {
  final String text;
  final String description;
  final NumberPhoneType? phoneType;
  final IconData icon;
  final Color iconColor;
  static const bool kIsWeb = bool.fromEnvironment("dart.library.js_util");

  const ContactCard({
    super.key,
    required this.text,
    required this.description,
    this.phoneType,
    required this.icon,
    required this.iconColor,
  });


  @override
  Widget build(BuildContext context) {
    late final Widget contentWidget;

    if (phoneType == NumberPhoneType.phone) {
      contentWidget = TextButton(
        onPressed: () async {
          try {
            final uri = Uri(scheme: 'tel', path: description.replaceAll(" ", ""));
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Не удалось открыть приложение телефона')),
              );
            }
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Ошибка: $e')),
            );
          }
        },
        child: Text(description.trim())
      );
    } else if (phoneType == NumberPhoneType.whatsapp) {
      contentWidget = TextButton(
        onPressed: () async {
          try {
            final url = Uri.parse("https://wa.me/${description.replaceAll(" ", "")}?text=Здравствуйте");
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Не удалось открыть Whatsapp')),
              );
            }
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Ошибка: $e')),
            );
          }
        },
          child: Text(description.trim())

      );
    }
    else {
      contentWidget = SelectableText(description.trim());
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 24, color: iconColor),
                const SizedBox(width: 8),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            contentWidget,
          ],
        ),
      ),
    );
  }
}