import 'package:pocketbase/pocketbase.dart';

class Pb {
  PocketBase pb = PocketBase('https://kreateam.pockethost.io/');  
  
  Future<String> getHelloMessage() async {
    String message = "";
    try {
      final resultList = await pb.collection('WelcomeMessage').getFullList();
      message = resultList[0].getStringValue('Hello');
    } catch (e) {
      message = "Error: $e";
    }
    return message;
  }

  Future<bool> login(String username, String password) async {
    try {
      await pb.collection('users').authWithPassword(username, password);
      return true;
    } catch (e) {
      return false;
    }
  }

  void logout() {
    pb.authStore.clear();
  }

  bool isLoggedIn() {
    return pb.authStore.isValid;
  }

}

