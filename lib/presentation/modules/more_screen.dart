import 'package:flutter/material.dart';



import '/presentation/modules/jordan_chonlon.dart';
import '/presentation/modules/arnie_gavidia.dart';
import '/presentation/modules/jean_anorga.dart';
import '/presentation/modules/adrian_nieves.dart';
import '/presentation/modules/felipe_reyes.dart';
import '../../shared/components/components.dart';
import '../../shared/components/styles/colors.dart';
import '../../shared/constants.dart';


class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: DefaultAppBar(context: context, title: '', backgroundColor:Color.fromARGB(239, 228, 61, 32),),
      
      body: Padding(
     
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              sizedBox15,
              BuildItem(
                title: 'Felipe Reyes', 
                
                onPressed: () => navigateTo(context, const FelipeReyes()),
              ),
              sizedBox15,
              BuildItem(
                title: 'Jordan Chonlon',
                onPressed: () => navigateTo(context, const JordanChonlon()),
              ),
              sizedBox15,
              BuildItem(
                title: 'Jean Añorga',
                onPressed: () => navigateTo(context, const JeanAnorga()),
              ),
              sizedBox15,
              BuildItem(
                title: 'Adrian Nieves',
                onPressed: () => navigateTo(context, const AdrianNieves()),
              ),
              sizedBox15,
              BuildItem(
                title: 'Arnie Gavidia',
                onPressed: () => navigateTo(context, const ArnieGavidia()),
              ),
            ],
          )),
    );
  }
}

// ignore: must_be_immutable
class BuildItem extends StatelessWidget {
  static const Color itemColor = Color.fromARGB(255, 240, 219, 200);
  final String title;
  VoidCallback? onPressed;

  BuildItem({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        height: 75,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 93, 164, 245),

          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: placeHolderColor,
                    radius: 25,
                    child: Icon(
                      Icons.person, 
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    title,
                    style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20, fontWeight: FontWeight.bold)
                  ),
                ],
              ),
              const Icon(
                Icons.pets_sharp,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 50,
              ),
            ],
          ),
        ),
      ),
      onTap: onPressed,
    );
  }
}
