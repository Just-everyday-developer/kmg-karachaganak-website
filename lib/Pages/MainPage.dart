import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_website/Pages/AboutCompanyPage.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/services.dart';

import 'SamrukPage.dart';
import 'SpecialPurchasesPage.dart';

class MenuItem {
  final String text;
  final bool isHovered;

  const MenuItem(this.text, {this.isHovered = false});

  MenuItem copyWith(bool? isHovered) {
   return MenuItem(text, isHovered: isHovered ?? this.isHovered);
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final TextEditingController _controller = TextEditingController();
  bool isHovered = false;
  final CarouselSliderController carouselSliderController = CarouselSliderController();
  MenuItem item1 = MenuItem("Главная");
  MenuItem item2 = MenuItem("О компании");
  MenuItem item3 = MenuItem("Пресс Центр");
  MenuItem item4 = MenuItem("Вакансии");
  MenuItem item5 = MenuItem("Контакты");
  MenuItem item6 = MenuItem("Горячая Линия");


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
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
              ),

              const SizedBox(height: 600,),
              // Слайдер
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(flex: 8, child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: CarouselSlider(
                      items: [
                        Image.asset('Assets/akorda.png'),
                        Image.asset('Assets/samruk-logo.png'),
                        Image.asset('Assets/KMG-logo.png'),
                        Image.asset('Assets/Chevron-logo.png'),
                        Image.asset('Assets/LUK_OIL-logo.png'),
                        Image.asset('Assets/eni-logo.png'),
                        Image.asset('Assets/Shell-logo.png'),
                      ],
                      carouselController: carouselSliderController,
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration: const Duration(milliseconds: 1000), // Длительность анимации

                        enlargeCenterPage: false, // Не увеличиваем центральный элемент
                        viewportFraction: 0.20, // Показываем ~4 элемента (1/0.25=4)
                        initialPage: 3, // Начальная позиция (чтобы были видны соседние)
                        enableInfiniteScroll: true, // Бесконечная прокрутка
                        autoPlayInterval: const Duration(seconds: 3),
                        pauseAutoPlayOnTouch: true,
                        scrollPhysics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(height: 20,),
              Container(
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
                      children: const [
                        Text('Главная', style: TextStyle(color: Colors.white)),
                        Text('Пресс Центр', style: TextStyle(color: Colors.white)),
                        Text('О компании', style: TextStyle(color: Colors.white)),
                        Text('Вакансии', style: TextStyle(color: Colors.white)),
                        Text('Закупки', style: TextStyle(color: Colors.white)),
                        Text('Контакты', style: TextStyle(color: Colors.white)),
                        Text('Горячая линия', style: TextStyle(color: Colors.white)),
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
                        Row(spacing: 10, children: [Icon(FontAwesomeIcons.linkedin, color: Colors.blue, size: 32.0,), Icon(FontAwesomeIcons.instagram, color: Colors.red, size: 32.0,), Icon(FontAwesomeIcons.facebook, color: Colors.blue, size: 32.0,)]),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.black,
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [_copyrightText("Копирайт "), Icon(FontAwesomeIcons.copyright, color: Colors.white,), _copyrightText(" 2025 "), _underlineText("ТОО КМГ КАРАЧАГАНАК"), _copyrightText(". Все права защищены.")])),
              )
            ],
          ),
        ),
      ),
    ])
    );
  }

  Widget _copyrightText(String text) {
    return Text(text, style: TextStyle(color: Colors.white, fontSize: 15));
  }

  Widget _underlineText(String text) {
    return Text(text, style: TextStyle(color: Colors.blue, fontSize: 15, decoration: TextDecoration.underline));
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

// MySearchBar
class MySearchBar extends StatelessWidget {
  final TextEditingController controller;
  const MySearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery
          .of(context)
          .size
          .width * 0.4,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: controller.clear,
          ),
          hintText: 'Search',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }}