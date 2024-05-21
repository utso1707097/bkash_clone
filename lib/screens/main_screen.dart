import 'package:bkash_clone/core/const.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isAnimated = false;
  bool _isBallanceShown = false;
  bool _isBallance = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppConstants.defaultThemeColor,
        unselectedItemColor: const Color(0xff9a9a9a),
        currentIndex: 0,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 40,
            ),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code_scanner,
              size: 40,
            ),
            label: "QR Scan",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              size: 40,
            ),
            label: "QR Scan",
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppConstants.defaultThemeColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/utso.JPG',
                        fit: BoxFit.cover,
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Md Samaul Haque Malik",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      InkWell(
                        onTap: changeState,
                        child: Container(
                          width: 160,
                          height: 28,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              /// ৳ 50.00
                              AnimatedOpacity(
                                  opacity: _isBallanceShown ? 1 : 0,
                                  duration: const Duration(milliseconds: 500),
                                  child: const Text('৳ 50.00',
                                      style: TextStyle(
                                          color: Colors.pink, fontSize: 14))),

                              /// ব্যালেন্স দেখুন
                              AnimatedOpacity(
                                  opacity: _isBallance ? 1 : 0,
                                  duration: const Duration(milliseconds: 300),
                                  child: const Text('ব্যালেন্স দেখুন',
                                      style: TextStyle(
                                          color: Colors.pink, fontSize: 14))),

                              /// Circle
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 1100),
                                left: _isAnimated == false ? 5 : 135,
                                curve: Curves.fastOutSlowIn,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  // padding: const EdgeInsets.only(bottom: 4),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius:
                                          BorderRadius.circular(50)),
                                  child: const FittedBox(
                                    child: Text(
                                      '৳',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Icon(
                    MdiIcons.trophy,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "assets/images/bKash.png",
                    height: 40,
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [

              ],
            ),
          ))
        ],
      ),
    );
  }

  void changeState() async {
    _isAnimated = true;
    _isBallance = false;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 800),
        () => setState(() => _isBallanceShown = true));
    await Future.delayed(const Duration(seconds: 3),
        () => setState(() => _isBallanceShown = false));
    await Future.delayed(const Duration(milliseconds: 200),
        () => setState(() => _isAnimated = false));
    await Future.delayed(const Duration(milliseconds: 800),
        () => setState(() => _isBallance = true));
  }
}
