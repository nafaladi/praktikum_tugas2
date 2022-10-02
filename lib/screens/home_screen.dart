import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertravelapp/models/recommended_model.dart';
import 'package:fluttertravelapp/screens/selected_place_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tugas Praktikum 2"),
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              /// Text Widget for Title
              Padding(
                padding: EdgeInsets.only(top: 48, left: 28.8),
                child: Text(
                  'Ayo Berwisata\nke Bandung',
                  style: GoogleFonts.playfairDisplay(
                      fontSize: 45.6, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 25,
              ),

              /// ListView widget with PageView
              /// Recommendations Section
              Container(
                height: 218.4,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  controller: _pageController,
                  // scrollDirection: Axis.horizontal,
                  children: List.generate(
                    recommendations.length,
                    (int index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SelectedPlaceScreen(
                                recommendedModel: recommendations[index])));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 28.8),
                        width: 333.6,
                        height: 218.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                recommendations[index].imageAsset),
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 19.2,
                              left: 19.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.8),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaY: 19.2, sigmaX: 19.2),
                                  child: Container(
                                    height: 36,
                                    padding: EdgeInsets.only(
                                        left: 16.72, right: 14.4),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        SvgPicture.asset(
                                            'assets/svg/icon_location.svg'),
                                        SizedBox(
                                          width: 9.52,
                                        ),
                                        Text(
                                          recommendations[index].name,
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          ' || ${recommendations[index].ticketPrice}',
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /// Dots Indicator
              /// Using SmoothPageIndicator Library
              Padding(
                padding: EdgeInsets.only(left: 28.8, top: 28.8),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: recommendations.length,
                  effect: ExpandingDotsEffect(
                      activeDotColor: Color(0xFF8a8a8a),
                      dotColor: Color(0xFFababab),
                      dotHeight: 4.8,
                      dotWidth: 6,
                      spacing: 4.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
