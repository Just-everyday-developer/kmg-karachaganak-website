import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_website/Pages/AboutCompanyPage.dart';
import 'package:practice_website/Pages/ContactsPage.dart';
import 'package:practice_website/Pages/HotlinePage.dart';
import 'package:practice_website/Pages/JobsPage.dart';
import 'package:practice_website/Pages/PressCenterPage.dart';
import 'package:practice_website/controllers/theme_mode_toggler.dart';
import 'package:practice_website/data/main_page_text.dart';
import 'package:practice_website/widgets/copyright_box.dart';
import 'package:practice_website/widgets/footer.dart';
import 'package:practice_website/widgets/text_pairs_building.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:practice_website/data/menu_items.dart';
import 'package:practice_website/controllers/search_controller.dart' as custom;
import '../data/news_items.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/navigation_panel.dart';
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
  final CarouselSliderController carouselSliderController =
      CarouselSliderController();

  @override
  void initState() {
    // TODO.md: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<custom.SearchController>(
      context,
      listen: false,
    );

    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Главное меню
            NavigationPanel(),
        SizedBox(
          width: double.infinity,
            child: CarouselSlider(
            items: [
              Image.asset("Assets/content/karachaganak_main_page-1.png", fit: BoxFit.fill,
                width: double.infinity),
              Image.asset("Assets/content/karachaganak_main_page-3.png", fit: BoxFit.cover,
                  width: double.infinity),
              Image.asset("Assets/content/karachaganak_main_page-4.png", fit: BoxFit.cover,
                  width: double.infinity),
            ],

            options: CarouselOptions(
              height: 600,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: Duration(milliseconds: 1000),
              initialPage: 2,
              autoPlayInterval: Duration(seconds: 3),
              pauseAutoPlayOnTouch: true,
              scrollPhysics: BouncingScrollPhysics(),
            ))),
            Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Вводный текст
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.text,
                      child: SelectableText(
                      intro,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        color: context.read<ThemeToggler>().isDarkMode ? Colors.white : Colors.grey[800],
                      ),
                    ),)
                  ),

                  // Выделенный центральный текст
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue[100]!),
                    ),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.text,
                      child: SelectableText(
                      boldText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.blue[900],
                      ),
                    ),)
                  ),

                  // Группы текста с заголовками
                  ...buildTextPairs([
                    (titledText1, subtext1),
                    (titledText2, subtext2),
                    (titledText3, subtext3),
                    (titledText4, subtext4),
                  ]),
                ],
              ),
            ),

            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text("Наши партнёры:", style: TextStyle(fontSize: 24)),
              ),
            ),
            // Слайдер
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 8,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
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
                        autoPlayAnimationDuration: const Duration(
                          milliseconds: 1000,
                        ), // Длительность анимации

                        enlargeCenterPage:
                            false, // Не увеличиваем центральный элемент
                        viewportFraction:
                            0.20, // Показываем 4 элемента (1/0.25=4)
                        initialPage:
                            2, // Начальная позиция (чтобы были видны соседние)
                        enableInfiniteScroll: true, // Бесконечная прокрутка
                        autoPlayInterval: const Duration(seconds: 3),
                        pauseAutoPlayOnTouch: true,
                        scrollPhysics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Footer(),
            CopyrightBox(),
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
