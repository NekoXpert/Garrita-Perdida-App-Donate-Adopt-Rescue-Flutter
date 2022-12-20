import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/cubit.dart';
import '../../business_logic/cubit/states.dart';
import '../../shared/components/components.dart';
import '../../shared/components/styles/colors.dart';
import '../modules/donator_screen.dart';
import '../modules/felipe_reyes.dart';
//import 'package:garrita_perdida_app/screens/drawert.dart';
import 'package:garrita_perdida_app/presentation/modules/on_boarding_screen.dart';
import '../modules/donator_screen.dart';
class HomeLayout extends StatelessWidget {
  final List<IconData> icons = const [
    Icons.pets,
    Icons.report,
    Icons.person,
    Icons.more_vert,
  ];

  final List<String> titles = const [
    'Adoptar',
    'Reportar',
    'Perfil',
    'Más',
  ];

  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);

          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 7, 180, 65),
              child: const Icon(
                Icons.attach_money,
                size: 40,
              ),
              onPressed: () {
                navigateTo(
                  context,
                 DonatorScreen(),
                );
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar.builder(
              height: 55,
              gapLocation: GapLocation.center,
              itemCount: icons.length,
              tabBuilder: (int index, bool isActive) {
                final color = isActive ? mainColor : Color.fromARGB(255, 226, 165, 115);
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icons[index],
                      size: 30,
                      color: color,
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: BuildSecondHeader(title: titles[index]),
                    )
                  ],
                );
              },
              activeIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
            body: cubit.pages[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
