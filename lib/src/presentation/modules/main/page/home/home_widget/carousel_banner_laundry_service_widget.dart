import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/data/models/banner_laundry_service.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/main_bloc.dart';
import 'package:project_laundry_flutter/src/presentation/modules/main/page/home/home_widget/item_image_slider.dart';

class CarouselBannerLaundryServiceWidget extends StatefulWidget {
  final MainBloc bloc;
  const CarouselBannerLaundryServiceWidget({super.key, required this.bloc});

  @override
  State<CarouselBannerLaundryServiceWidget> createState() =>
      _CarouselBannerLaundryServiceWidgetState();
}

class _CarouselBannerLaundryServiceWidgetState
    extends State<CarouselBannerLaundryServiceWidget> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BannerLaundryService>?>(
      stream: widget.bloc.listBannerLaundryServiceStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          List<BannerLaundryService>? banners = snapshot.data;
          if (banners != null) {
            return Stack(
              children: [
                CarouselSlider.builder(
                    itemCount: banners.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        ItemImageSlider(
                            urlImage: banners[itemIndex].src,
                            bloc: widget.bloc),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      animateToClosest: false,
                      initialPage: 0,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      disableCenter: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                    )),
                Positioned.fill(
                  bottom: 10,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: DotsIndicator(
                      dotsCount: banners.length,
                      position: currentPage,
                      decorator: const DotsDecorator(
                        color: Colors.white54,
                        activeColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Text("No data");
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
