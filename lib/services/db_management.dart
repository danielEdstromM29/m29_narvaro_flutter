// Middleware for managing database interactions, 
// such as checking login status and handling user data.
// Purpose for this class is to abstract database
// incase we want to change the database solution in the future.
// Currently using Pocketbase (Pb) for data storage and 
// retrieval.

import 'package:m29_narvaro/services/pb.dart';

class DbManagement {
  Pb pb = Pb();

  Future<bool> login(String username, String password) async {
    bool success = await pb.login(username, password);
    if (success) {
      print('Login successful');
      return true;
    } else {
      print('Login failed');
      return false;
    }
  }

  bool isLoggedIn(){
    return pb.isLoggedIn();
  }
  
  void logout(){
    pb.logout();
  }
}