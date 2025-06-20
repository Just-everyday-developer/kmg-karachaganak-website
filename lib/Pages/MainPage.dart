import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_website/Pages/AboutCompanyPage.dart';
import 'package:practice_website/Pages/ContactsPage.dart';
import 'package:practice_website/Pages/HotlinePage.dart';
import 'package:practice_website/Pages/JobsPage.dart';
import 'package:practice_website/Pages/PressCenterPage.dart';
import 'package:practice_website/widgets/copyright_box.dart';
import 'package:practice_website/widgets/footer.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:practice_website/data/menu_items.dart';
import 'package:practice_website/controllers/search_controller.dart' as custom;
import '../data/news_items.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/news_card.dart';
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
  bool isHovered = false;
  final CarouselSliderController carouselSliderController = CarouselSliderController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<custom.SearchController>(context, listen: false);

    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutCompanyPage()));
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
                      child: _menuText(item3.text, item3.isHovered), // Пресс Центр
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
                        onTap: () => html.window.open('https://qsamruk.kz/cabinet', '_blank'),
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
                      child: _menuText(item5.text, item5.isHovered),  // Контакты
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
                      child: _menuText(item6.text, item6.isHovered), // Горячая линия
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(), // Отключаем скролл внутри
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.6,
                crossAxisSpacing: 20,
                mainAxisSpacing: 30,
              ),
              itemBuilder: (context, index) {
                return NewsCard(newsItem: newsItems[index]);
              },
              itemCount: newsItems.length,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Center(child: Text("Наши партнёры:", style: TextStyle(fontSize: 24),)),
            ),
            // Слайдер
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(flex: 8, child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: CarouselSlider(
                    items: [
                      Image.asset('Assets/content/akorda.png'),
                      Image.asset('Assets/content/samruk-logo.png'),
                      Image.asset('Assets/content/KMG-logo.png'),
                      Image.asset('Assets/content/Chevron-logo.png'),
                      Image.asset('Assets/content/LUK_OIL-logo.png'),
                      Image.asset('Assets/content/eni-logo.png'),
                      Image.asset('Assets/content/Shell-logo.png'),
                    ],
                    carouselController: carouselSliderController,
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: const Duration(milliseconds: 1000), // Длительность анимации

                      enlargeCenterPage: false, // Не увеличиваем центральный элемент
                      viewportFraction: 0.20, // Показываем 4 элемента (1/0.20=4)
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
            // Футер
            Footer(),
            CopyrightBox()
          ],
        ),
      ),
    );
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