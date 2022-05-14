import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';


class BiometricAuthService {
 final _istance = BiometricAuthService();
  
  bool _isProtecting = false;
  bool isAuthSuccessful = false;
  

 Future<void> startAuthentication() async {
   if (_isProtecting) {
     try {
       isAuthSuccessful = await _auth.authenticateWithBiometrics(
         localizedReason: 'Scan your fingerprint to authenticate',
         useErrorDialogs: true,
         stickyAuth: true,
       );
     } on PlatformException catch (e) {debugPrint(e);
    }
  }
 }
}

//Please, put your main focus in the isAuthSuccessful variabile. It'll keep track of your authentication response, and it'll stay
//false in three main cases: NO AUTHENTICATION HAS BEEN MADE, AUTHENTICATION CANCELED, AUTH FAILED 2 MANY TIMES.