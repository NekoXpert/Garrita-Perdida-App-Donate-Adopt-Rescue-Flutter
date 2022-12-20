import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/cubit/cubit.dart';

import 'helpers/cache_helper.dart';
import 'presentation/layouts/home_layout.dart';
import 'presentation/modules/login/login_screen.dart';
import 'presentation/modules/on_boarding_screen.dart';
import 'shared/bloc_observer.dart';
import 'shared/components/styles/styles.dart';
import 'shared/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Transparent Statusbar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  await CacheHelper.init();
  await Firebase.initializeApp();

  Widget gPWidget;
  var onBoarding = CacheHelper.getData(key: 'onBoarding');
  uId = CacheHelper.getData(key: 'uId');

  if (onBoarding != null) {
    if (uId != null) {
      gPWidget = const HomeLayout();
    } else {
      gPWidget = LoginScreen();
    }
  } else {
    gPWidget = OnBoardingScreen();
  }

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        gPWidget: gPWidget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget gPWidget;

  const MyApp({
    Key? key,
    required this.gPWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (BuildContext context) => AppCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: gPWidget,
      ),
    );
  }
}
