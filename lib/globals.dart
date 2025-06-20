import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import 'Pages/AboutCompanyPage.dart';
import 'Pages/MainPage.dart';
import 'Pages/SamrukPage.dart';
import 'Pages/SpecialPurchasesPage.dart';
//
// // Global variables
MenuItem item1 = MenuItem("Главная");
MenuItem item2 = MenuItem("О компании");
MenuItem item3 = MenuItem("Пресс Центр");
MenuItem item4 = MenuItem("Вакансии");
MenuItem item5 = MenuItem("Контакты");
MenuItem item6 = MenuItem("Горячая Линия");
//
// final newsItems = <NewsItem>[
//   NewsItem(
//     title:
//         "Рабочая встреча по поддержке местных сельскохозяйственных производителей Западно-Казахстанской области",
//     description:
//         "10 октября текущего года в здании областного Акимата Западно-Казахстанской области состоялась рабочая встреча, посвященная вопросам сотрудничества по поддержке местных сельскохозяйственных производителей. Мероприятие прошло",
//     imageUrl: "Assets/content/csm_news_14.10.2024_2_fc4db4ca52.jpg",
//   ),
//   NewsItem(
//       title: "КПО приняла участие в семинаре по локализации товаров в нефтегазовом секторе",
//       description: "2 октября 2024 года в городе Атырау компания Карачаганак Петролиум Оперейтинг Б.В. (КПО) приняла участие в семинаре-выставке, посвященном возможностям локализации товаров для крупных",
//       imageUrl: "Assets/content/csm_news_07.10.2024_f777c84cac.jpg"),
//   NewsItem(
//       title: "В Уральске прошел VII Международный экологический форум",
//       description: "УРАЛЬСК, Западно-Казахстанская область, 20 сентября 2024 г. — В г. Уральске состоялся VII Международный экологический форум «Uralsk Green Forum». В этом году участники мероприятия обсудили тему",
//       imageUrl: "Assets/content/csm_news_23.09.2024__1__47c57bea00.jpg"),
//   NewsItem(
//       title: "КПО завершила строительство нового физкультурно-оздоровительного комплекса в ЗКО",
//       description: "АКСАЙ, Западно-Казахстанская область, 16 сентября 2024 г. — Компания «Карачаганак Петролиум Оперейтинг Б.В.» (КПО) с радостью сообщает об успешном введении в эксплуатацию физкультурно-оздоровительного комплекса (ФОК) на 320 зрительских",
//       imageUrl: "Assets/content/csm_news_18.09.2024__1__baf3154fdf.jpg"),
//   NewsItem(
//       title: "КПО объявила о вводе в эксплуатацию объектов первого этапа Проекта расширения Карачаганака (ПРК-1А)",
//       description: "АКСАЙ, Западно-Казахстанская область, 6 сентября 2024 г. — компания «Карачаганак Петролиум Оперейтинг Б.В.» (КПО) объявляет об официальном вводе в эксплуатацию объектов первого этапа Проекта расширения Карачаганака",
//       imageUrl: "Assets/content/csm_news_09.09.2024__1__3ce82cf6c0.jpg"),
//   NewsItem(
//       title: "КПО завершила строительство новой школы в ЗКО",
//       description: "АКСАЙ, Западно-Казахстанская область, 1 сентября 2024 г. — Компания «Карачаганак Петролиум Оперейтинг Б.В.» (КПО) с радостью сообщает об успешном завершении строительства очередной школы на 60 мест, в селе Саралжын,",
//       imageUrl: "Assets/content/csm_news_04.09.2024__1__6506279a05.jpg"),
//   NewsItem(
//       title: "Технический вебинар КПО по ОВКВ и фильтрам с участием IMB Центра",
//       description: "КПО приглашает производителей ОВКВ и фильтров на технический вебинар с целью ознакомления с номенклатурой и потребностями Карачаганакского проекта по данным категориям товаров. Вебинар запланирован на 9 сентября 2024",
//       imageUrl: "Assets/content/csm_news_02.09.2024_3ee96b4a8c.jpg"),
//   NewsItem(
//       title: "КПО представила результаты деятельности за первое полугодие",
//       description: "АКСАЙ, Западно-Казахстанская область, 1 августа 2024 г. — Компания «Карачаганак Петролиум Оперейтинг Б.В.» (КПО) представила результаты своей работы за первое полугодие 2024 года. За первые шесть месяцев",
//       imageUrl: "Assets/content/csm_news_01.08.2024_c4782bd013.jpg"),
// ];
//
// // MySearchBar
// class MySearchBar extends StatelessWidget {
//   final SearchController searchController;
//   const MySearchBar({required this.searchController, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 40,
//       width: MediaQuery.of(context).size.width * 0.4,
//       child: TextField(
//         controller: searchController.text,
//         decoration: InputDecoration(
//           prefixIcon: const Icon(Icons.search),
//           suffixIcon: IconButton(
//             icon: const Icon(Icons.clear),
//             onPressed: searchController.clear,
//           ),
//           hintText: 'Search',
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//       ),
//     );
//   }
// }
//
// class SearchController with ChangeNotifier {
//   final TextEditingController _textController = TextEditingController();
//
//   TextEditingController get text => _textController;
//   String get searchText => _textController.text;
//
//   void clear() {
//     _textController.clear();
//     notifyListeners();
//   }
//
//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }
// }
//
// class NewsItem {
//   final String title;
//   final String description;
//   final String imageUrl;
//   final DateTime? date;
//
//   NewsItem({
//     required this.title,
//     required this.description,
//     required this.imageUrl,
//     DateTime? date,
//   }) : this.date = date ?? DateTime.now();
// }
//
// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const MyAppBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Provider.of<globals.SearchController>(context, listen: false);
//     return AppBar(
//       automaticallyImplyLeading: false,
//       toolbarHeight: 100,
//       title: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 25),
//         child: Row(
//           children: [
//             MouseRegion(
//                 cursor: SystemMouseCursors.click,
//                 child: GestureDetector(
//                   onTap: () => Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => const MainPage()),
//                   ),
//                   child: Image.asset('Assets/content/KMG-K-logo.png'),
//                 )),
//             const SizedBox(width: 20),
//             MouseRegion(
//               cursor: SystemMouseCursors.text,
//               child: globals.MySearchBar(searchController: controller),
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         TextButton.icon(
//           onPressed: () {},
//           icon: const Icon(Icons.visibility_outlined),
//           label: const Text("Версия для слабовидящих"),
//         ),
//         const VerticalDivider(thickness: 2),
//         TextButton(onPressed: () {}, child: const Text("Eng")),
//         TextButton(onPressed: () {}, child: const Text("Рус")),
//         TextButton(onPressed: () {}, child: const Text("Қаз")),
//       ],
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => const Size.fromHeight(100);
// }
//
// class NewsCard extends StatelessWidget {
//   final NewsItem newsItem;
//
//   const NewsCard({required this.newsItem, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             blurRadius: 10,
//             spreadRadius: 2,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min, // Важно для гибкости
//         children: [
//           // Изображение с аспектным соотношением
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//             child: AspectRatio(
//               aspectRatio: 16 / 9, // Стандартное соотношение для картинок
//               child: Image.asset(
//                 newsItem.imageUrl,
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//               ),
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Категория
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 8,
//                     vertical: 4,
//                   ),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF15DFFF),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   child: const Text(
//                     "Новости",
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 12),
//
//                 // Заголовок
//                 Text(
//                   newsItem.title,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     height: 1.3,
//                   ),
//                   maxLines: 3,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//
//                 const SizedBox(height: 8),
//
//                 // Дата
//                 Text(
//                   _formatDate(newsItem.date),
//                   style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                 ),
//
//                 const SizedBox(height: 12),
//
//                 // Описание
//                 Text(
//                   newsItem.description,
//                   style: const TextStyle(fontSize: 14, height: 1.4),
//                   maxLines: 5,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 12),
//                 Align(
//                     alignment: Alignment.bottomRight,
//                     child: IconButton(
//                         onPressed: () {debugPrint("more");},
//                         icon: Icon(Icons.arrow_forward)),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Форматирование даты
//   String _formatDate(DateTime? date) {
//     if (date == null) return "";
//     return "${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}";
//   }
//
// }
//
//
// class NavigationPanel extends StatefulWidget {
//   const NavigationPanel({super.key});
//
//   NavigationPanelState createState() => NavigationPanelState();
// }
//
// class NavigationPanelState extends State<NavigationPanel> {
//   @override
//   Widget build(context) {
//     return Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Главное меню
//           Card(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   MouseRegion(  // Главная
//                       onEnter: (_) {
//                         setState(() {
//                           item1 = item1.copyWith(true);
//                         });
//                       },
//
//                       onExit: (_) {
//                         setState(() {
//                           item1 = item1.copyWith(false);
//                         });
//                       },
//
//                       cursor: SystemMouseCursors.click,
//                       child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (_) => const MainPage()));
//                           },
//                           child: _menuText(item1.text, item1.isHovered)
//                       )
//                   ),
//                   MouseRegion(
//                       cursor: SystemMouseCursors.click,
//                       onEnter: (_) {
//                         setState(() {
//                           item2 = item2.copyWith(true);
//                         });
//                       },
//
//                       onExit: (_) {
//                         setState(() {
//                           item2 = item2.copyWith(false);
//                         });
//                       },
//                       child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutCompanyPage()));
//                           },
//                           child: _menuText(item2.text, item2.isHovered)
//                       ) // О компании
//                   ),
//                   MouseRegion(
//                       onEnter: (_) {
//                         setState(() {
//                           item3 = item3.copyWith(true);
//                         });
//                       },
//
//                       onExit: (_) {
//                         setState(() {
//                           item3 = item3.copyWith(false);
//                         });
//                       },
//                       cursor: SystemMouseCursors.click,
//                       child: _menuText(item3.text, item3.isHovered) // Пресс Центр
//                   ),
//                   MouseRegion(
//                     cursor: SystemMouseCursors.click,
//                     onEnter: (_) {
//                       setState(() {
//                         item4 = item4.copyWith(true);
//                       });
//                     },
//
//                     onExit: (_) {
//                       setState(() {
//                         item4 = item4.copyWith(false);
//                       });
//                     },
//                     child: GestureDetector(
//                       onTap: () => html.window.open(
//                           'https://qsamruk.kz/cabinet', '_blank'),
//                       child: _menuText(item4.text, item4.isHovered),  // Вакансии
//                     ),
//                   ),
//                   _dropdownMenu(context),  // Закупки
//                   MouseRegion(
//                       onEnter: (_) {
//                         setState(() {
//                           item5 = item5.copyWith(true);
//                         });
//                       },
//
//                       onExit: (_) {
//                         setState(() {
//                           item5 = item5.copyWith(false);
//                         });
//                       },
//                       cursor: SystemMouseCursors.click,
//                       child: _menuText(item5.text, item5.isHovered)  // Контакты
//                   ),
//                   MouseRegion(
//                       onEnter: (_) {
//                         setState(() {
//                           item6 = item6.copyWith(true);
//                         });
//                       },
//
//                       onExit: (_) {
//                         setState(() {
//                           item6 = item6.copyWith(false);
//                         });
//                       },
//                       cursor: SystemMouseCursors.click,
//                       child: _menuText(item6.text, item6.isHovered) // Горячая линия
//                   ),
//                 ],
//               ),
//             ),
//           )]);
//   }
//   Widget _menuText(String text, bool status) {
//     return Container(
//         height: MediaQuery.of(context).size.height * 0.09,
//         width: MediaQuery.of(context).size.width * 0.09,
//         decoration: BoxDecoration(
//             color: status ? Colors.blueAccent.shade100 : Colors.transparent,
//             borderRadius: BorderRadius.circular(10)
//         ),
//         child: Center(child: Text(text, style: const TextStyle(fontSize: 16)))
//     );
//   }
//
//   Widget _dropdownMenu(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton<String>(
//         value: 'Закупки',
//         items: const [
//           DropdownMenuItem(value: 'Закупки', child: Text('Закупки')),
//           DropdownMenuItem(value: 'Особый порядок', child: Text('Закупки по особому порядку')),
//           DropdownMenuItem(value: 'Портал', child: Text('Портал закупок "Самрук-Қазына"')),
//         ],
//         onChanged: (val) {
//           if (val == 'Особый порядок') {
//             Navigator.push(context, MaterialPageRoute(builder: (_) => const SpecialPurchasesPage()));
//           } else if (val == 'Портал') {
//             Navigator.push(context, MaterialPageRoute(builder: (_) => const SamrukPage()));
//           }
//         },
//       ),
//     );
//   }
// }
//
