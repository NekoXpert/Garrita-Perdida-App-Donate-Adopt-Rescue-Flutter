import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../shared/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class JordanChonlon extends StatelessWidget {
  const JordanChonlon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: paddingAll,
          child: Column(
            children: const [
              Text(
                'TEAM:\ SKY DRAGONS',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 245, 141, 22),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(""), //Espacio
              Text(""), //Espacio
              Text(""), //Espacio
              Text(""), //Espacio
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/Jordan.jpeg'),
                radius: 70,
              ),
              sizedBox15,

              Text('Jordan Chonlon', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              Text(""), //Espacio
              Text('{Perro}', style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 11, 167, 45), fontWeight: FontWeight.bold)),
              sizedBox10,
              Text(""), //Espacio
              //Espacio
              Text(
                'Estudiante de Diseño y Desarollo de Software CICLO III Certus. Me gusta mucho la tecnología, la música y el anime. Me gusta mucho la programación.',
                style: TextStyle(
                  fontSize: 18,
                  height: 1.3,
                ),
              ),
              sizedBox28,
              BuildIcon(),
            ],
          ),
        ),
      ),
    );
  }
}

List<Color> colors = const [
  Colors.blue,
  Color.fromARGB(255, 135, 29, 221),
  Color.fromARGB(255, 53, 53, 53),
  Color.fromARGB(255, 29, 44, 114),
];

List<IconData> icons = const [
  FontAwesomeIcons.facebook,
  FontAwesomeIcons.instagram,
  FontAwesomeIcons.github,
  FontAwesomeIcons.linkedin,
];

List<String> urls = const [
  'https://www.facebook.com/felipe.reyesi/',
  'https://www.instagram.com/felipe.reyesi/',
  'https://github.com/nekosor/',
  'https://www.linkedin.com/in/felipereyesi/',
];

class BuildIcon extends StatelessWidget {
  const BuildIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return SocilaButton(
            color: colors[index],
            url: urls[index],
            icon: icons[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemCount: colors.length,
      ),
    );
  }
}

class SocilaButton extends StatelessWidget {
  final Color color;
  final String url;
  final IconData icon;

  const SocilaButton({
    Key? key,
    required this.color,
    required this.url,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        launchUrl(url);
      },
      icon: FaIcon(
        icon,
        color: color,
        size: 30,
      ),
    );
  }
}

Future launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  }
}
