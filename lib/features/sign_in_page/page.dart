import 'package:flutter/material.dart';
import 'package:my_flutter_app/features/sign_in_page/ui/google_sign_in_button.dart';
import 'package:my_flutter_app/services/authentication.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Row(),
              const Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(flex: 1, child: Icon(Icons.person, size: 160.0)),
                    SizedBox(height: 20),
                    Text(
                      "Войдите в свой аккаунт",
                      style: TextStyle(
                        // color: CustomColors.firebaseYellow,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Произошла какая-то ошибка');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return const CircularProgressIndicator(
                      // valueColor: AlwaysStoppedAnimation<Color>(
                      // CustomColors.firebaseOrange,
                      // ),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
