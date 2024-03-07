import 'package:flutter/material.dart';
import 'package:panakj_app/ui/screens/student/screens/home_screen/students_home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

// class NavigationScreen extends StatefulWidget {
//   const NavigationScreen({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _NavigationScreenState createState() => _NavigationScreenState();
// }

// class _NavigationScreenState extends State<NavigationScreen> {
//   int _currentIndex = 0;

//   final List<Widget> _screens = [
//     const StudentsHomeScreen(),
//      ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _currentIndex,
//         children: _screens,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_2_outlined, size: 30),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const StudentsHomeScreen(),
    ProfileScreen(),
    ContactUsScreen(),
    AboutScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor:
            Colors.black, // Change the selected item color as needed
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 30), // Adjust the icon size
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.contact_emergency, size: 30), // Adjust the icon size
            label: 'Contact us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc_outlined, size: 30), // Adjust the icon size
            label: 'About us',
          ),
        ],
      ),
    );
  }
}

// Replace these with your actual screen widgets
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
              SizedBox(height: 20.0),
              Text(
                'John Doe',
                style: GoogleFonts.montserrat(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'johndoe@gmail.com',
                style: GoogleFonts.montserrat(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'About Me',
                style: GoogleFonts.montserrat(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contact Us'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage(
                      'assets/icon.png'), // Replace 'assets/icon.png' with your actual icon image path
                ),
                SizedBox(height: 20.0),
                Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign:
                      TextAlign.center, // Align the title text to the center
                ),
                SizedBox(height: 10.0),
                Text(
                  'Address: 123 Main Street\nCity: Your City\nState: Your State\nCountry: Your Country\n\nEmail: contact@example.com\nPhone: +123 456 7890',
                  textAlign: TextAlign
                      .center, // Align the contact information text to the center
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('About'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(
                    'assets/icon.png'), // Replace 'assets/icon.png' with your actual icon image path
              ),
              SizedBox(height: 20.0),
              Text(
                'About Us',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    'This Trust was established and funded in April 1999 by its Founder Dr. Thampil Pankaj, under the CHARITABLE TRUST ACT OF KERALA. Remembering his own childhood experience of poverty and resulting hardships, and aware of the great value of some assistance he received to further his own education, Dr. Pankaj set up this Educational and Charity Trust mainly to help poor, meritorious students to pursue their higher education. He believes that there are too many bright talented young children who are unable to receive higher education because of their family\'s poor financial background. With some financial assistance for their studies, they can do better in life and also serve the overall society much better. Through this Trust and its scholarship program he hopes to help at least some of these children to get the opportunity for higher education.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
