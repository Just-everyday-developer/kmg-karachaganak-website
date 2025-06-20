import 'package:practice_website/widgets/footer.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:practice_website/controllers/search_controller.dart' as custom;
import 'package:flutter/material.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/navigation_panel.dart';
import 'MainPage.dart';
import 'SamrukPage.dart';
import 'SpecialPurchasesPage.dart';

class AboutCompanyPage extends StatefulWidget {
  const AboutCompanyPage({super.key});

  @override
  AboutCompanyPageState createState() => AboutCompanyPageState();
}

class AboutCompanyPageState extends State<AboutCompanyPage> {
  @override
  void initState() {
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
