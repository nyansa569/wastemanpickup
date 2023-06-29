import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../widgets/widget.dart';
// import 'package:zoli_proj/screens/settings.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      cupertino: (_, __) => CupertinoPageScaffoldData(
        body: Card(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const InfoWidget(title: 'C trips', description: '30'),
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.black26,
                        ),
                        Positioned(
                          left: 80,
                          top: 80,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 104, 107, 106),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const InfoWidget(title: 'P trips', description: '30'),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    const InfoWidget(
                      icon: CupertinoIcons.person,
                      title: 'Name:',
                      description: 'Mr. Agyeman Takyie',
                    ),
                    _buildSpace(),
                    const InfoWidget(
                      icon: CupertinoIcons.phone,
                      title: 'Contact:',
                      description: '0557699945',
                    ),
                    _buildSpace(),
                    const InfoWidget(
                      icon: CupertinoIcons.location_circle,
                      title: 'Location:',
                      description: 'Dansoman/Accra',
                    ),
                    _buildSpace(),
                    const InfoWidget(
                      icon: CupertinoIcons.arrow_3_trianglepath,
                      title: 'Completed trips:',
                      description: '500',
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                TextButton(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.012,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign out',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              _profilePic(),
              SizedBox(height: 20),
              Column(
                children: [
                  _buildBioInfo(
                    Icons.person,
                    'Name:',
                    'Mr. Kwame Amoh Kesse',
                  ),
                  _buildSpace(),
                  _buildBioInfo(
                    Icons.phone,
                    'Contact:',
                    '0557699945',
                  ),
                  _buildSpace(),
                  _buildBioInfo(
                    Icons.location_on,
                    'Location:',
                    'Dansoman',
                  ),
                  _buildSpace(),
                  _buildBioInfo(
                    Icons.library_books,
                    'Completed trips:',
                    '500',
                  ),
                  Text('Hello world')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack _profilePic() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 70,
          // backgroundImage: AssetImage('assets/images/profileOne.jpeg'),
        ),
        Positioned(
          left: 99,
          top: 99,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 104, 107, 106),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.add_a_photo,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _buildSpace() => SizedBox(height: 20);

  Row _buildBioInfo(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            SizedBox(
              // width: 330,
              child: Text(
                value,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 24,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
