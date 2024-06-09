import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  static Future<FirebaseApp> initializeFirebase({
    required BuildContext context,
  }) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Get.offNamed('/home', arguments: user);
    }

    return firebaseApp;
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (GetPlatform.isWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            // handle the error here

            Get.snackbar('Error',
                'The account already exists with a different credential',
                backgroundColor: Colors.black87,
                colorText: Colors.red.shade600);

            // Get.snackbar(
            // 'The account already exists with a different credential');
          } else if (e.code == 'invalid-credential') {
            // handle the error here

            Get.snackbar('Error',
                'Error occurred while accessing credentials. Try again.',
                backgroundColor: Colors.black87,
                colorText: Colors.red.shade600);
          }
        } catch (e) {
          // handle the error here
          Get.snackbar(
              'Error', 'Error occurred using Google Sign In. Try again.',
              backgroundColor: Colors.black87, colorText: Colors.red.shade600);
        }
      }
    }

    return user;
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!GetPlatform.isWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      Get.snackbar('Error', 'Error signing out. Try again.',
          backgroundColor: Colors.black87, colorText: Colors.red.shade600);
    }
  }
}
