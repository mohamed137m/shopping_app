import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/view/sign_in.dart';
import 'package:shopping_app/view/sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String? imageUrl;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        imageUrl =
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVGHL9r9OucwArH8yO3rEDPryG4V3tSCBw-w&s';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6978E0),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff705BB7),
                    Color(0xff6978E0),
                    Color(0xff7352AC),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                      child: Center(
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            ScaleAnimatedText(
                              'ShopCraft',
                              textStyle: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            RotateAnimatedText(
                              'Welcome App',
                              textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            RotateAnimatedText(
                              'Your Premium Shopping\nExperience',
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: 350,
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/IMG_20240105_170633_923.PNG',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    imageUrl == null
                        ? CircularProgressIndicator(color: Colors.amber)
                        : Container(
                            width: 350,
                            height: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: NetworkImage(imageUrl ?? "Error"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return SignUpScreen();
                        //     },
                        //   ),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 50),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: Icon(Icons.sign_language, color: Colors.white),
                      label: DefaultTextStyle(
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText('Click in'),
                            WavyAnimatedText('Sign Up'),
                          ],
                          isRepeatingAnimation: true,
                          repeatForever: true,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignUpScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(150, 50),
                        backgroundColor: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                      ),
                      icon: Icon(Icons.sign_language, color: Colors.white),
                      label: AnimatedTextKit(
                        animatedTexts: [
                          ScaleAnimatedText(
                            'Click in',
                            textStyle: TextStyle(color: Colors.white),
                          ),
                          WavyAnimatedText(
                            'Sign in',
                            textStyle: TextStyle(color: Colors.white),
                          ),
                        ],
                        isRepeatingAnimation: true,
                        repeatForever: true,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return SignIn();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
