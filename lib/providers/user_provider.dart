import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String? _userName;
  String? _userImage;
  String? _userEmail;
  String? _userPhoneNumber;
  String? _userAddress;
  String? get userName => this._userName;
  String? get userImage => this._userImage;
  String? get userEmail => this._userEmail;
  String? get userAddress => this._userAddress;
  String? get userPhoneNumber => this._userPhoneNumber;
  set userName(String? userName) {
    _userName = userName;
    notifyListeners();
  }

  set userImage(String? userImage) {
    _userImage = userImage;
    notifyListeners();
  }

  set userEmail(String? userEmail) {
    _userEmail = userEmail;
    notifyListeners();
  }

  set userAddress(String? userAddress) {
    _userAddress = userAddress;
    notifyListeners();
  }

  set userPhoneNumber(String? userPhoneNumber) {
    _userPhoneNumber = userPhoneNumber;
    notifyListeners();
  }
}
