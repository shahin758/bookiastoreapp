
import 'package:bookiastoreapp/core/styles/colors.dart';
import 'package:bookiastoreapp/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookiastoreapp/feature/home/presentation/cubit/home_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int yourActiveIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccessState) {
          var sliders = context.read<HomeCubit>().sliders;

          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: sliders.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(10),
                          child: Image.network(
                            sliders[itemIndex].image ?? '',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                options: CarouselOptions(
                  height: 150,
                  viewportFraction: 1,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      yourActiveIndex = index;
                    });
                  },
                ),
              ),
              Gap(14),
              AnimatedSmoothIndicator(
                activeIndex: yourActiveIndex,
                count: sliders.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 7,
                  dotWidth: 7,
                  activeDotColor: AppColors.primaryColor,
                  dotColor: AppColors.textcolor,
                  expansionFactor: 4,
                ),
              ),
            ],
          );
        } else if (state is HomeErrorState) {
          return Center(child: Text('Error'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
