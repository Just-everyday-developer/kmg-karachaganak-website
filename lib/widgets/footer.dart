import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Pages/AboutCompanyPage.dart';
import '../Pages/ContactsPage.dart';
import '../Pages/HotlinePage.dart';
import '../Pages/JobsPage.dart';
import '../Pages/MainPage.dart';
import '../Pages/PressCenterPage.dart';
import '../Pages/SpecialPurchasesPage.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.blueAccent.shade100,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Image.asset('Assets/KMG-K-logo.png', height: 100),
          Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            spacing: 10,
            children: [
              InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => const MainPage()));},
                  child: Text('Главная', style: TextStyle(color: Colors.white)
                  )
              ),
              InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => const PressCenterPage()));},
                  child: Text('Пресс Центр', style: TextStyle(color: Colors.white)
                  )
              ),
              InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutCompanyPage()));},
                  child: Text('О компании', style: TextStyle(color: Colors.white)
                  )
              ),
              InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => const JobsPage()));},
                  child: Text('Вакансии', style: TextStyle(color: Colors.white)
                  )
              ),
              InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => const SpecialPurchasesPage()));},
                  child: Text('Закупки', style: TextStyle(color: Colors.white)
                  )
              ),
              InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactsPage()));},
                  child: Text('Контакты', style: TextStyle(color: Colors.white)
                  )
              ),
              InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => const HotlinePage()));},
                  child: Text('Горячая линия', style: TextStyle(color: Colors.white)
                  )
              ),
            ],
          ),
          Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            spacing: 10,
            children: const [
              Text('Контакты', style: TextStyle(color: Colors.white)),
              Text('ТОО КМГ Карачаганак', style: TextStyle(color: Colors.white)),
              Text('(номер телефона)', style: TextStyle(color: Colors.white)),
              Text('(Адрес)', style: TextStyle(color: Colors.white)),
              Text('Имейл', style: TextStyle(color: Colors.white)),
              Text('Ссылки на соц.сеть', style: TextStyle(color: Colors.white)),
              Row(spacing: 10, children: [Icon(FontAwesomeIcons.linkedin, size: 32.0, color: Colors.blue), Icon(FontAwesomeIcons.telegram, size: 32.0, color: Colors.blue,)]),
            ],
          ),
        ],
      ),
    );
  }
}