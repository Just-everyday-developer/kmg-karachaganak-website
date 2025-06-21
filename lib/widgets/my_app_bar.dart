import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/search_controller.dart' as custom;
import '../models/menu_item.dart';
import '../pages/MainPage.dart';
import '../widgets/my_search_bar.dart';


class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<custom.SearchController>(context, listen: false);
    return AppBar(
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
                  child: Image.asset('Assets/content/KMG-K-logo.png'),
                )),
            const SizedBox(width: 20),
            MouseRegion(
              cursor: SystemMouseCursors.text,
              child: MySearchBar(searchController: controller),
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
        TextButton.icon(
            onPressed: () {},
            icon: CountryFlag.fromCountryCode("USA", height: 20, width: 20, shape: Circle(),),
            label: const Text("Eng")
        ),
        TextButton.icon(
            onPressed: () {},
            icon: CountryFlag.fromCountryCode("RUS", height: 20, width: 20, shape: Circle()),
            label: const Text("Рус")),
        TextButton.icon(
            onPressed: () {},
            icon: CountryFlag.fromCountryCode("KZ", height: 20, width: 20, shape: Circle()),
            label: const Text("Қаз")),
      ],
    );
  }
}