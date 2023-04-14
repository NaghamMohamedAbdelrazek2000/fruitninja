import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Services {
  final auth=FirebaseAuth.instance;
  final store= FirebaseDatabase.instance;
  final GoogleSignIn googleSignin= GoogleSignIn();
  final  facebookSignin =FacebookAuth.instance;
}