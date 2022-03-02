import 'package:flutter/material.dart';
import 'package:ui_project/exhibition_bottom_sheet.dart';
import 'package:ui_project/sliding_cards.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8),
                GNav(
                    rippleColor: Colors
                        .grey[800], // tab button ripple color when pressed
                    hoverColor: Colors.grey[700], // tab button hover color
                    haptic: true, // haptic feedback
                    tabBorderRadius: 15,
                    tabActiveBorder: Border.all(
                        color: Colors.blue[200], width: 5), // tab button border
// tab button border
                    curve: Curves.easeOutExpo, // tab animation curves
                    duration:
                        Duration(milliseconds: 200), // tab animation duration
                    gap: 8, // the tab button gap between icon and text
                    color: Colors.black, // unselected icon color
                    activeColor: Colors.white, // selected icon and text color
                    iconSize: 24, // tab button icon size
                    tabBackgroundColor: Colors.blue,
                    // selected tab background color
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 5), // navigation bar padding
                    tabs: [
                      GButton(
                        icon: LineIcons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: LineIcons.heart,
                        text: 'Likes',
                      ),
                      GButton(
                        icon: LineIcons.search,
                        text: 'Search',
                      ),
                      GButton(
                        icon: LineIcons.user,
                        text: 'Profile',
                      )
                    ]),
                SizedBox(height: 60),
                SlidingCardsView(),
              ],
            ),
          ),
          ExhibitionBottomSheet(), //use this or ScrollableExhibitionSheet
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        'T3 Drones',
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
