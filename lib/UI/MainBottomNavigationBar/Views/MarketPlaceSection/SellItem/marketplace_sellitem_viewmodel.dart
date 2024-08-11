import 'package:flutter/material.dart';

import '../../../../../Core/Custom/pick_image.dart';

class MarketplaceSellitemViewmodel extends ChangeNotifier {
  String? sellItemPic;

  void setSellItemPic() {
    ImagePickerUtil.pickImage().then((String? value) {
      sellItemPic = value;
      notifyListeners();
    });
  }
}
