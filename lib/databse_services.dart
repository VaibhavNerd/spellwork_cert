
import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {



  // Collection reference
  final CollectionReference userCollection =FirebaseFirestore.instance.collection('users');



  // get user data
  Future getUserData(String userID) async {
    DocumentSnapshot snapshot = await userCollection.doc(userID).get();
    // print(snapshot.docs(userID).data());
    return snapshot;
  }



  // get user blog posts
  getUserBlogPosts() async {
    // return await Firestore.instance.collection("users").where('email', isEqualTo: email).snapshots();
    return FirebaseFirestore.instance.collection('blogPosts').where('userId', isEqualTo: "").orderBy('createdAt', descending: true).snapshots();
  }

}