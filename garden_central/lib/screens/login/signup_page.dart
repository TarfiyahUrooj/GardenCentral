// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:garden_central/screens/home_page.dart';
// import 'package:garden_central/screens/login/login_screen.dart';
// import 'package:garden_central/screens/login/user_repo.dart';

/*class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //List images = ["gmail.png", "fb.png"];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/plant.jpg"),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 100),
                const Icon(
                  Icons.app_registration_outlined,
                  size: 100,
                ),
                SizedBox(height: 50),
                Text(
                  'REGISTER',
                  style: TextStyle(
                    color: Colors.green[300],
                    fontSize: 20,
                  ),
                ),

                //username
                //SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.grey.shade500),
                      floatingLabelStyle:
                          TextStyle(color: Colors.grey.shade500),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green.shade300),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintStyle: TextStyle(color: Colors.grey.shade300),
                    ),
                  ),
                ),

                //password

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.grey.shade500),
                      floatingLabelStyle:
                          TextStyle(color: Colors.grey.shade500),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green.shade300),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintStyle: TextStyle(color: Colors.grey.shade300),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.grey.shade500),
                      floatingLabelStyle:
                          TextStyle(color: Colors.grey.shade500),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green.shade300),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintStyle: TextStyle(color: Colors.grey.shade300),
                    ),
                  ),
                ),

                ElevatedButton(
                    onPressed: () async {
                      UserRepository().CreateUser(
                          name: usernameController.text,
                          email: emailController.text,
                          password: passwordController.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogInScreen()
                              //cartScreen: CartScreen(),
                              ));

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('REGISTERED SUCCESSFULLY'),
                            content: Text('You can log in'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("RESGISTER"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/