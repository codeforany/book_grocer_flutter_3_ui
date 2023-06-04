

import 'package:flutter/material.dart';

extension CommonExtension on State {

    void endEditing(){
      FocusScope.of(context).requestFocus(FocusNode());
    }
}