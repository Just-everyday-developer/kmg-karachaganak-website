import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CopyrightBox extends StatelessWidget {
  const CopyrightBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_copyrightText("Копирайт "), Icon(FontAwesomeIcons.copyright, color: Colors.white,), _copyrightText(" 2025 "), _underlineText("ТОО КМГ КАРАЧАГАНАК"), _copyrightText(". Все права защищены.")])),
    );
  }
}

Widget _copyrightText(String text) {
  return Text(text, style: TextStyle(color: Colors.white, fontSize: 15));
}

Widget _underlineText(String text) {
  return Text(text, style: TextStyle(color: Colors.blue, fontSize: 15, decoration: TextDecoration.underline));
}