
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kishan_se/helperFunctions/user_role.dart';

Future<void> createUserDocument(User user) async {
  final usersRef = FirebaseFirestore.instance.collection('users');
  
  final userDoc = await usersRef.doc(user.uid).get();
  UserRole userRole = UserRole();

  if (!userDoc.exists) {
    await usersRef.doc(user.uid).set({
      'uid': user.uid,
      'email': user.email,
      'displayName': user.displayName,
      'photoURL': user.photoURL,
      'role': userRole.isFarmer,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
