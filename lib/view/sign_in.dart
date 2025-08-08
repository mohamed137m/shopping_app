import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/view/home_screen.dart';
import 'package:shopping_app/widgets/custom_buttom.dart';
import 'package:shopping_app/widgets/custom_text_form.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? fullName;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      fullName = pref.getString('fullName') ?? 'User';
    });
  }

  final _Key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
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
          Form(
            key: _Key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  margin: EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: Color(0xff9336ED),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Sign in to ShopCraft',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 15,
                            bottom: 25,
                          ),
                          child: Column(
                            children: [
                              CustomTextForm(
                                fullNameTitle: 'Email',
                                hintTextFormField: 'Enter your email',
                                controller: _emailController,
                              ),
                              SizedBox(height: 10),
                              CustomTextForm(
                                fullNameTitle: 'Password',
                                hintTextFormField: 'Enter your Password',
                                controller: _passwordController,
                              ),
                              SizedBox(height: 20),
                              CustomBottom(
                                titleTextBottom: 'Sign In',
                                onTap: () {
                                  if (_Key.currentState!.validate()) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Success"),
                                          content: Text("تم التسجيل بنجاح 🎉"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.of(
                                                  context,
                                                ).pushReplacement(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen(),
                                                  ),
                                                );
                                              },
                                              child: Text("متابعة"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
