import 'package:flutter/material.dart';
import 'package:practice_website/Pages/ContactsPage.dart';
import 'package:practice_website/Pages/HotlinePage.dart';
import 'package:practice_website/Pages/PressCenterPage.dart';
import '../models/menu_item.dart';
import '../Pages/AboutCompanyPage.dart';
import '../Pages/MainPage.dart';
import '../Pages/SamrukPage.dart';
import '../Pages/SpecialPurchasesPage.dart';
import '../data/menu_items.dart';
import 'package:universal_html/html.dart' as html;

class NavigationPanel extends StatefulWidget {
  const NavigationPanel({super.key});

  NavigationPanelState createState() => NavigationPanelState();
}

class NavigationPanelState extends State<NavigationPanel> {
  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Главное меню
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MouseRegion(
                  // Главная
                  onEnter: (_) {
                    setState(() {
                      item1 = item1.copyWith(true);
                    });
                  },

                  onExit: (_) {
                    setState(() {
                      item1 = item1.copyWith(false);
                    });
                  },

                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const MainPage()),
                      );
                    },
                    child: _menuText(item1.text, item1.isHovered),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) {
                    setState(() {
                      item2 = item2.copyWith(true);
                    });
                  },

                  onExit: (_) {
                    setState(() {
                      item2 = item2.copyWith(false);
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AboutCompanyPage(),
                        ),
                      );
                    },
                    child: _menuText(item2.text, item2.isHovered),
                  ), // О компании
                ),
                MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      item3 = item3.copyWith(true);
                    });
                  },

                  onExit: (_) {
                    setState(() {
                      item3 = item3.copyWith(false);
                    });
                  },
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PressCenterPage(),
                        ),
                      );
                    },
                    child: _menuText(item3.text, item3.isHovered),
                  ), // Пресс Центр
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) {
                    setState(() {
                      item4 = item4.copyWith(true);
                    });
                  },

                  onExit: (_) {
                    setState(() {
                      item4 = item4.copyWith(false);
                    });
                  },
                  child: GestureDetector(
                    onTap: () => html.window.open(
                      'https://qsamruk.kz/cabinet',
                      '_blank',
                    ),
                    child: _menuText(item4.text, item4.isHovered), // Вакансии
                  ),
                ),
                _dropdownMenu(context), // Закупки
                MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      item5 = item5.copyWith(true);
                    });
                  },

                  onExit: (_) {
                    setState(() {
                      item5 = item5.copyWith(false);
                    });
                  },
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ContactsPage(),
                        ),
                      );
                    },
                    child: _menuText(item5.text, item5.isHovered),
                  ), // Контакты
                ),
                MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      item6 = item6.copyWith(true);
                    });
                  },

                  onExit: (_) {
                    setState(() {
                      item6 = item6.copyWith(false);
                    });
                  },
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HotlinePage(),
                        ),
                      );
                    },
                    child: _menuText(item6.text, item6.isHovered),
                  ), // Горячая линия
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _menuText(String text, bool status) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.09,
      decoration: BoxDecoration(
        color: status ? Colors.blueAccent.shade100 : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text(text, style: const TextStyle(fontSize: 16))),
    );
  }

  Widget _dropdownMenu(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: 'Закупки',
        items: const [
          DropdownMenuItem(value: 'Закупки', child: Text('Закупки')),
          DropdownMenuItem(
            value: 'Особый порядок',
            child: Text('Закупки по особому порядку'),
          ),
          DropdownMenuItem(
            value: 'Портал',
            child: Text('Портал закупок "Самрук-Қазына"'),
          ),
        ],
        onChanged: (val) {
          if (val == 'Особый порядок') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SpecialPurchasesPage()),
            );
          } else if (val == 'Портал') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SamrukPage()),
            );
          }
        },
      ),
    );
  }
}
