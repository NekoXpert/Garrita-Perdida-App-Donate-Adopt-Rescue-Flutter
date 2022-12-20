import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'styles/colors.dart';

class DefaultTextFormField extends StatelessWidget {
  final BuildContext context;
  final String hintText;
  final String? Function(String? val)? validator;
  final TextEditingController controller;
  final TextInputType type;
  final bool isPassword;
  const DefaultTextFormField({
    Key? key,
    required this.context,
    required this.hintText,
    required this.validator,
    required this.controller,
    required this.type,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: textFieldColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: textFieldColor,
          ),
        ),
        filled: true,
        fillColor: textFieldColor,
        contentPadding: const EdgeInsets.only(left: 34, top: 40),
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}

class BuildHeader extends StatelessWidget {
  final String title;

  const BuildHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: primaryFontColor,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }
}

class TotalText extends StatelessWidget {
  final String title;
  final String price;

  const TotalText({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(color: mainColor),
        ),
        Text(
          '\$$price',
          style: const TextStyle(color: mainColor),
        ),
      ],
    );
  }
}



class BuildSecondHeader extends StatelessWidget {
  final String title;
  final double? fontSize;
  final TextAlign? textAlign;

  const BuildSecondHeader({
    Key? key,
    required this.title,
    this.fontSize,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(color: secondaryFontColor, fontSize: fontSize),
    );
  }
}

class CustomTitle extends StatelessWidget {
  final String title;
  final double fontSize;

  const CustomTitle({
    Key? key,
    required this.title,
    this.fontSize = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onPressed;
  final Color textColor;
  final double width;
  final double height;

  const DefaultButton({
    Key? key,
    this.color = mainColor,
    required this.title,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 56,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      child: Text(title),
      textColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      height: height,
      minWidth: width,
    );
  }
}

class RawButton extends StatelessWidget {
  final Color buttonColor;
  final String text;
  final String image;
  final VoidCallback onPressed;

  const RawButton({
    Key? key,
    required this.buttonColor,
    required this.text,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: buttonColor,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      height: 56,
      minWidth: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image),
          const SizedBox(width: 32.4),
          Text(text),
        ],
      ),
      onPressed: onPressed,
    );
  }
}

class DefaultTextButton extends StatelessWidget {
  final Color? color;
  final String child;
  final VoidCallback onPressed;
  final FontWeight fontWeight;

  const DefaultTextButton({
    Key? key,
    this.color,
    this.fontWeight = FontWeight.bold,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        child,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (route) => false,
  );
}

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final Color? backgroundColor;
  final double? elevation;
  final Color? iconColor;
  final BuildContext context;

  const DefaultAppBar({
    Key? key,
    required this.title,
    this.color,
    this.backgroundColor,
    this.elevation,
    this.iconColor,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: iconColor),
      backgroundColor: backgroundColor,
      elevation: elevation,
      title: Text(title),
      actions: [
        
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}




class CircularIndicator extends StatelessWidget {
  const CircularIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}





