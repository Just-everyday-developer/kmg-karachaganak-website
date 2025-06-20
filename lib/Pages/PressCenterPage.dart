import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:practice_website/controllers/search_controller.dart' as custom;
import 'package:flutter/material.dart';
import '../widgets/footer.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/navigation_panel.dart';
import 'MainPage.dart';
import 'SamrukPage.dart';
import 'SpecialPurchasesPage.dart';

class PressCenterPage extends StatefulWidget {
  const PressCenterPage ({super.key});

  @override
  PressCenterPageState createState() => PressCenterPageState();
}

class PressCenterPageState extends State<PressCenterPage> {
  @override
  void initState() {
    super.initState();
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
              child: Column(children: [NavigationPanel(), Footer()]),
            ),
          ),
        ],
      ),
    );
  }
}