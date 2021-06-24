import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/modules/Login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widget/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              color: AppColors.primary,
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.person, height: size.height * 0.46),
                  Expanded(child: Container()),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Image.asset(AppImages.logomini),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 70, left: 70, right: 70),
                    child: Text("Organize seus boletos em um só lugar",
                        textAlign: TextAlign.center,
                        style: size.height < 800
                            ? TextStyles.titleRegular
                            : TextStyles.titleHome),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.height < 700 ? 16.0 : 30.0),
                    child: SocialLoginButton(onTap: () {
                      controller.googleSignIn(context);
                    }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
