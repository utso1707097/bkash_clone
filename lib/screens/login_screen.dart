import 'package:bkash_clone/core/const.dart';
import 'package:bkash_clone/screens/animation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isBanglaSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: AppConstants.defaultThemeColor,
          size: 40,
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _isBanglaSelected = !_isBanglaSelected;
                });
                Get.updateLocale(_isBanglaSelected
                    ? Locale('bn', 'BD')
                    : Locale('en', 'US'));
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: AppConstants.defaultThemeColor),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.5, horizontal: 5),
                child: Text(
                  _isBanglaSelected ? 'বাংলা' : 'English',
                  style: TextStyle(color: AppConstants.defaultThemeColor),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Spacer(),
          Container(
            padding: EdgeInsets.all(16),
            // height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/logo/pink_bird.png",
                      width: 50,
                      height: 50,
                    ),
                    SvgPicture.asset(
                      'assets/logo/qr-code.svg',
                      color: AppConstants.defaultThemeColor,
                      semanticsLabel: 'Bkash Logo',
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.login,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.to_your_bkash_account,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  AppLocalizations.of(context)!.account_number,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff787878),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "+88 01712121212",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              AppLocalizations.of(context)!.bkash_pin,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff787878),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: 32,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)!
                                    .enter_bkash_pin,
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffd2d2d2),
                                ),
                                border: InputBorder.none,
                                errorStyle: const TextStyle(height: 0.01),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/logo/fingerprint-scan.png",
                      height: 50,
                      width: 50,
                      color: AppConstants.defaultThemeColor,
                    )
                  ],
                ),
                Divider(),
                Text(
                  AppLocalizations.of(context)!.forgot_pin_try_pin_reset,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppConstants.defaultThemeColor,
                  ),
                ),
                // Expanded(child: Container()),
              ],
            ),
          ),
          Spacer(),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AnimationScreen()));
            },
            child: Container(
              height: 50,
              width: double.infinity,
              color: Color(0xff9e9e9e),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.next,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.white,
                      size: 40,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
