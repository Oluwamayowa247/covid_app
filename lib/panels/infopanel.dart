import 'package:covid_app/pages/faq.dart';
import 'package:covid_app/utils/datasource.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatefulWidget {
  const InfoPanel({Key? key}) : super(key: key);

  @override
  State<InfoPanel> createState() => _InfoPanelState();
}

class _InfoPanelState extends State<InfoPanel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const FAQ())));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            color: primaryBlack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'FAQS',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            launchUrl(Uri.parse(
                'https://www.afro.who.int/health-topics/coronavirus-covid-19/mythbusters'));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            color: primaryBlack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'MYTH BUSTERS',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            launchUrl(Uri.parse('https://covid19response.who.foundation/'));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            color: primaryBlack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'DONATE NOW',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
