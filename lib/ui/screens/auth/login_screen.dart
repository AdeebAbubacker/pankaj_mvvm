import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_app/core/model/failure/mainfailure.dart';
import 'package:panakj_app/ui/screens/student/screens/home_screen/students_home_screen.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:panakj_app/ui/view_model/auth/auth_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FocusNode namefocusNode = FocusNode();
  FocusNode passwordfocusNode = FocusNode();
  bool showDots = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeMap(
            authsuccess: (value) {
              setState(() {
                showDots = false;
              });
              // Navigate to home screen on successful login
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const StudentsHomeScreen(),
                ),
              );
              // You can also perform any other actions on success
            },
            authError: (value) {
              setState(() {
                showDots = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Login failed: ${value.message}'),
                  duration: Duration(seconds: 2),
                ),
              );
              // You can also perform any other actions on failure
            },
            loading: (_) {
              // You can show loading indicators or perform other actions during loading
            },
            orElse: () {
              // Handle other states or do nothing
            },
          );
        },
        builder: (context, state) {
          return SafeArea(
            child: GestureDetector(
              onTap: () {
                if (namefocusNode.hasFocus || passwordfocusNode.hasFocus) {
                  namefocusNode.unfocus();
                  passwordfocusNode.unfocus();
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 90,
                    ),
                    SizedBox(
                      width: 260,
                      height: 240,
                      child: Image.asset('assets/login_img.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        focusNode: namefocusNode,
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: 'Enter email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 11),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        obscureText: _obscureText,
                        focusNode: passwordfocusNode,
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(
                            AuthEvent.signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                          setState(() {
                            showDots = true;
                          });
                          // Call your login function or logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 76, 81, 175),
                        ),
                        child: const Text('Login'),
                      ),
                    ),
                    const SizedBox(
                      height: 190,
                    ),
                    if (showDots)
                      Container(
                        width: 120,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(137, 212, 210, 210),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: JumpingDots(
                          color: const Color.fromARGB(255, 129, 106, 205),
                        ),
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
