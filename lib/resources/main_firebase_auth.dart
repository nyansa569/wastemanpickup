// import 'package:firebase_auth/firebase_auth.dart';

// class MainAuthMethods {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<String> signInUser({
//     required String email,
//     required String password,
//   }) async {
//     String res = 'Some error occurred';
//     try {
//       if (email.isNotEmpty || password.isNotEmpty) {
//         //? we do not need to store this credentials
//         await _auth.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//         res = 'success';
//       } else {
//         res = 'Pleasse enter all the fields';
//       }
//     } catch (err) {
//       res = err.toString();
//     }
//     return res;
//   }

//   Future<void> signOut() async {
//     await _auth.signOut();
//   }

//   Future<String> forgottenPassword(String email) async {
//     String res = 'Some error occured';
//     try {
//       _auth.sendPasswordResetEmail(email: email);
//       res = 'successful';
//     } catch (e) {
//       res = e.toString();
//     }
//     return res;
//   }
// }
