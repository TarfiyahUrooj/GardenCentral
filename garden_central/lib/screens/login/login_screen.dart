import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden_central/bloc/user/user_bloc.dart';
import 'package:garden_central/screens/home_page.dart';
import 'package:garden_central/screens/user_profile.dart';
import 'package:get/get.dart';
import '../../bloc/auth/bloc/auth_bloc.dart';
import 'signup_page.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmPassword =
      TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  void initState() {
    super.initState();
  }

  void signInWithEmailAndPassword() {
    BlocProvider.of<AuthBloc>(context).add(SignInEvent(
      email: _controllerEmail.text,
      password: _controllerPassword.text,
    ));
  }

  void createUserWithEmailAndPassword() {
    BlocProvider.of<AuthBloc>(context).add(SignUpEvent(
      email: _controllerEmail.text,
      password: _controllerPassword.text,
      confirmPassword: _controllerConfirmPassword.text,
      name: _controllerName.text,
    ));
  }

  Widget _entryField(String title, TextEditingController controller, Key key,
      {bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        key: key,
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        obscureText: isPassword,
      ),
    );
  }

  Widget _errorMessage(String text) {
    if (text.isNotEmpty) {
      return Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    return SizedBox.shrink();
  }

  Widget _submitButton() {
    return Container(
      //width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        onPressed: isLogin
            ? signInWithEmailAndPassword
            : createUserWithEmailAndPassword,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          isLogin ? 'LOGIN' : 'REGISTER',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLogin = !isLogin;
        });

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => HomePage(),
        //   ),
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Text(
            isLogin ? "OR REGISTER" : "LOGIN",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInWithGoogle() {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<AuthBloc>(context).add(GoogleSignInEvent());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/google.png',
            height: 25,
            width: 25,
          ),
          SizedBox(width: 8),
          Text(
            'Sign In With Google',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/plant.jpg'),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Icon(
                    Icons.login_sharp,
                    size: 100,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                        color: Colors.green.shade300,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: emailController,
                    hintText: 'Username',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  MyButton(
                    onTap: signUserIn,
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SquareTile(imagePath: 'assets/images/google.png'),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.black,
                          //fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 4),
                      ElevatedButton(
                          onPressed: () {
                            Get.to(SignupPage());
                          },
                          child: Text("Sign Up")),
                      // const Text(
                      //   'Sign Up',
                      //   style: TextStyle(
                      //     fontSize: 16,
                      //     color: Colors.black,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      ElevatedButton(
                          onPressed: () {
                            Get.to(BlocProvider(
                                create: (context) => UserBloc(),
                                child: UserProfile()));
                          },
                          child: Text("Get User Data"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  */
    return Scaffold(
      appBar: AppBar(
        title: Text('Garden Central'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is UnAuthenticatedState) {
            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/plant.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Center(
                              child: Text(
                                isLogin ? 'LOGIN' : 'REGISTER',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          _errorMessage(state.error),
                          _entryField(
                            'Email',
                            _controllerEmail,
                            Key("EnterEmail"),
                          ),
                          _entryField(
                            'Password',
                            _controllerPassword,
                            Key("EnterPassword"),
                            isPassword: true,
                          ),
                          if (!isLogin)
                            Column(
                              children: [
                                _entryField(
                                  'Confirm Password',
                                  _controllerConfirmPassword,
                                  Key("EnterConfirmPassword"),
                                  isPassword: true,
                                ),
                                _entryField(
                                  'Name',
                                  _controllerName,
                                  Key("EnterName"),
                                ),
                              ],
                            ),
                          _submitButton(),
                          SizedBox(
                            height: 10,
                          ),
                          _loginOrRegisterButton(),
                          SizedBox(
                            height: 10,
                          ),
                          _signInWithGoogle(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is AuthenticatedState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Get.to(() => HomePage());
            });
          } else if (state is AuthLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Text("Unknown State");
          }
          return Container();
        },
      ),
    );
  }
}
