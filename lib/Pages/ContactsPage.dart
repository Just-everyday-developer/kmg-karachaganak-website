import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practice_website/widgets/contact_card.dart';
import 'package:practice_website/widgets/map_widget.dart';
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

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  ContactsPageState createState() => ContactsPageState();
}

class ContactsPageState extends State<ContactsPage> {
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
              child: Column(children: [
                NavigationPanel(),
                MapWidget(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  ContactCard(
                      text: "Адрес",
                      description: '''
БЦ Изумрудный квартал блок  
Улица Динмухамед Конаев, 8. 6 этаж''',
                    icon: Icons.location_on_outlined,
                    iconColor: Colors.orange
                  ),
                      ContactCard(
                        text: "Контактные телефоны",
                        description: "+7 800 080 47 47",
                        phoneType: NumberPhoneType.phone,
                        icon: Icons.phone,
                        iconColor: Colors.blue,
                      ),
                      ContactCard(
                        text: "Whatsapp",
                        description: "+7 771 191 8816",
                        phoneType: NumberPhoneType.whatsapp,
                        icon: FontAwesomeIcons.whatsapp,
                        iconColor: Colors.green,
                      ),
                      ContactCard(
                        text: "Электронная почта",
                        description: "kmg-k@kmg-k.kz",
                        phoneType: NumberPhoneType.other,
                        icon: Icons.email,
                        iconColor: Colors.blue,
                      ),
                ]),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15)]
          )),
                Footer()]),
            ),
          )],
      ),
    );
  }
}
