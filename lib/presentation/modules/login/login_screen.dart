import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_validators/queen_validators.dart';
import '../../../helpers/cache_helper.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/styles/colors.dart';
import '../../../shared/constants.dart';
import '../../layouts/home_layout.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_states.dart';
import '../sign_up/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {
          if (state is UserLoginSuccessState) {
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              uId = state.uId;
              navigateAndFinish(context, const HomeLayout());
            });
          }
          if (state is CreateUserSuccessState) {
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              uId = state.uId;
              navigateAndFinish(context, const HomeLayout());
            });
          }
        },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Image.asset('assets/images/logo.png', width: 200, height: 140,),
                    const BuildHeader(title: 'Login'),
                    sizedBox12,
                    const BuildSecondHeader(title: 'Credenciales de acceso'),
                    sizedBox28,
                    DefaultTextFormField(
                      context: context,
                      hintText: 'Tu correo',
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validator: qValidator([
                        IsRequired(),
                         IsEmail(),
                      ]),
                    ),
                    sizedBox15,
                    DefaultTextFormField(
                      context: context,
                      hintText: 'Password',
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      isPassword: true,
                      validator: qValidator([
                         IsRequired(),
                      ]),
                    ),
                    sizedBox15,
                    BuildCondition(
                      condition: state is! UserLoginLoadingsState,
                      builder: (context) => DefaultButton(
                        color: mainColor,
                        title: 'Login',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            LoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      ),
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    sizedBox15,
                    DefaultTextButton(
                      child: 'Olvido su contraseña?',
                      color: secondaryFontColor,
                      fontWeight: FontWeight.w400,
                      onPressed: () {},
                    ),
                    sizedBox10,
                    const BuildSecondHeader(title: 'También puedes logearte con:'),
                    sizedBox15,
                    RawButton(
                      buttonColor: Colors.blue,
                      image: 'assets/images/facebook.svg',
                      text: 'Login Con Facebook',
                      onPressed: () {},
                    ),
                    sizedBox15,
                    BuildCondition(
                      condition: state is! CreateUserLoadingsState,
                      builder: (context) => RawButton(
                        buttonColor: Color.fromARGB(255, 253, 0, 0),
                        
                        text: 'Login Con Google',
                        image: 'assets/images/google.svg',
                        onPressed: () {
                          LoginCubit.get(context).logInWithGoogle();
                        },
                      ),
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    sizedBox28,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const BuildSecondHeader(
                            title: 'No tienes una cuenta?'),
                        DefaultTextButton(
                          child: 'Registrate',
                          onPressed: () {
                            navigateTo(context, SignUp());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
