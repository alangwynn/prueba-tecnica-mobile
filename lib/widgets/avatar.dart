// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Avatar extends StatelessWidget {

  Avatar({
    Key? key,
    required this.urlImage,
  }) : super(key: key);

  String urlImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CircleAvatar(
        radius: 50.0,
        backgroundImage: CachedNetworkImageProvider(urlImage),
      ),
    );
  }

}