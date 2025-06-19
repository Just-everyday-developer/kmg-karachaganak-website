import 'package:universal_html/html.dart' as html;

import 'package:flutter/material.dart';
import 'MainPage.dart';
import 'SamrukPage.dart';
import 'SpecialPurchasesPage.dart';

class AboutCompanyPage extends StatefulWidget {
  const AboutCompanyPage({super.key});

  @override
  AboutCompanyPageState createState() => AboutCompanyPageState();
}

class AboutCompanyPageState extends State<AboutCompanyPage> {
  MenuItem item1 = MenuItem("Главная");
  MenuItem item2 = MenuItem("О компании");
  MenuItem item3 = MenuItem("Пресс Центр");
  MenuItem item4 = MenuItem("Вакансии");
  MenuItem item5 = MenuItem("Контакты");
  MenuItem item6 = MenuItem("Горячая Линия");
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Row(
            children: [
              MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MainPage()),
                    ),
                    child: Image.asset('Assets/KMG-K-logo.png'),
                  )),
              const SizedBox(width: 20),
              MouseRegion(
                  cursor: SystemMouseCursors.text,
                  child: MySearchBar(controller: _controller)
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.visibility_outlined),
            label: const Text("Версия для слабовидящих"),
          ),
          const VerticalDivider(thickness: 2),
          TextButton(onPressed: () {}, child: const Text("Eng")),
          TextButton(onPressed: () {}, child: const Text("Рус")),
          TextButton(onPressed: () {}, child: const Text("Қаз")),
        ],
      ),
      body: Column(
          children: [
      Expanded(
      child: SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
      // Главное меню
      Card(
      child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MouseRegion(  // Главная
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
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const MainPage()));
                  },
                  child: _menuText(item1.text, item1.isHovered)
              )
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
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutCompanyPage()));
                  },
                  child: _menuText(item2.text, item2.isHovered)
              ) // О компании
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
              child: _menuText(item3.text, item3.isHovered) // Пресс Центр
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
                  'https://qsamruk.kz/cabinet', '_blank'),
              child: _menuText(item4.text, item4.isHovered),  // Вакансии
            ),
          ),
          _dropdownMenu(context),  // Закупки
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
              child: _menuText(item5.text, item5.isHovered)  // Контакты
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
              child: _menuText(item6.text, item6.isHovered) // Горячая линия
          ),
        ],
      ),
    ),
    )])))]));

    }
  Widget _menuText(String text, bool status) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 0.09,
        decoration: BoxDecoration(
            color: status ? Colors.blueAccent.shade100 : Colors.transparent,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text(text, style: const TextStyle(fontSize: 16)))
    );
  }

  Widget _dropdownMenu(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: 'Закупки',
        items: const [
          DropdownMenuItem(value: 'Закупки', child: Text('Закупки')),
          DropdownMenuItem(value: 'Особый порядок', child: Text('Закупки по особому порядку')),
          DropdownMenuItem(value: 'Портал', child: Text('Портал закупок "Самрук-Қазына"')),
        ],
        onChanged: (val) {
          if (val == 'Особый порядок') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SpecialPurchasesPage()));
          } else if (val == 'Портал') {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SamrukPage()));
          }
        },
      ),
    );
  }
}

