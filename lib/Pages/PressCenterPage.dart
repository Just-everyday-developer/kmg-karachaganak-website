import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:practice_website/controllers/search_controller.dart' as custom;
import 'package:flutter/material.dart';
import '../data/news_items.dart';
import '../widgets/footer.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/navigation_panel.dart';
import '../widgets/news_card.dart';
import 'MainPage.dart';
import 'SamrukPage.dart';
import 'SpecialPurchasesPage.dart';

class PressCenterPage extends StatefulWidget {
  const PressCenterPage ({super.key});

  @override
  PressCenterPageState createState() => PressCenterPageState();
}

class PressCenterPageState extends State<PressCenterPage> {
  late final CarouselSliderController _controllerCarousel;
  @override
  void initState() {
    super.initState();
    _controllerCarousel = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<custom.SearchController>(context, listen: false);
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                NavigationPanel(),
                const SizedBox(height: 50),
                    const Padding(padding: EdgeInsets.only(left: 50), child: const Text("Новости КМГ Карачаганак", style: TextStyle(fontSize: 40),)),
                const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      height: 600,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Левая кнопка
                          IconButton(
                            onPressed: () {
                              if (_controllerCarousel.ready) {  // Проверяем готовность контроллера
                                _controllerCarousel.previousPage();
                              }
                            },
                            icon: Icon(Icons.arrow_circle_left_outlined, size: 64),
                          ),

                          // Карусель
                          Expanded(
                            flex: 6,
                            child: CarouselSlider.builder(
                              carouselController: _controllerCarousel,
                              itemCount: newsItems.length,
                              itemBuilder: (context, index, realIndex) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: NewsCard(newsItem: newsItems[index]),
                                );
                              },
                              options: CarouselOptions(
                                height: 500,
                                viewportFraction: 0.20,  // Увеличено для лучшего отображения
                                enableInfiniteScroll: true,
                                autoPlay: true,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                                initialPage: 2,
                                autoPlayInterval: Duration(seconds: 3),
                                pauseAutoPlayOnTouch: true,
                                scrollPhysics: BouncingScrollPhysics(),
                              ),
                            ),
                          ),

                          // Правая кнопка
                          IconButton(
                            onPressed: () {
                              if (_controllerCarousel.ready) {  // Проверяем готовность контроллера
                                _controllerCarousel.nextPage();
                              }
                            },
                            icon: Icon(Icons.arrow_circle_right_outlined, size: 64),
                          ),
                        ],
                      ),
                    ),
                const SizedBox(height: 50),
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.blue[50]),
                      child:(
                          Center(
                        child: const Text("Все новости",
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500))
                  ))
                ),
                const SizedBox(height: 25),
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
                Footer()
              ]),
            ),
          ),
        ],
      ),
    );
  }
}