import 'package:bookiastoreapp/feature/main_profile/presentation/edit_profile/cubit/edite_profile_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomeCachedImage extends StatelessWidget {
  const CustomeCachedImage({
    super.key,
    required this.cubit,
  });

  final EditeProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: cubit.imageUrl,
      height: 120,
      width: 120,
    );
  }
}
