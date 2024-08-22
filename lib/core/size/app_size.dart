import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension AppSize on num{

  static const double _width= 430.0;
  static const double _height= 982.0;

  double  rH(BuildContext context)=> (MediaQuery.of(context).size.height /_height) * this;
  double  rW(BuildContext context)=> (MediaQuery.of(context).size.width /_width) * this;

   double rP(BuildContext context)=>
       max(MediaQuery.of(context).size.height /_height,
       MediaQuery.of(context).size.width /_width) * this;

}