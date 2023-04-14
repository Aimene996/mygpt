import 'package:flutter/material.dart';
import 'dart:math';

class AssistanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assistance App',
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBar(
                elevation: 0,
                centerTitle: true,
                title: Text('Assistance'),
                backgroundColor: Colors.transparent,
                actions: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/woman.png'),
                    radius: 60,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 12, right: 12),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.5),
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      'Online',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 32),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: _getRandomColor(),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  'Good morning, what task can I do for you?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                'Here are a few features:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32),
              Expanded(
                child: ListView(
                  children: [
                    _buildFeature(
                      title: 'ChatGPT',
                      description:
                          'ChatGPT is an AI-based chatbot that can answer your questions and help you with various tasks.',
                    ),
                    _buildFeature(
                      title: 'DALLE',
                      description:
                          'DALLE is an AI model that can generate high-quality images from text descriptions.',
                    ),
                    _buildFeature(
                      title: 'Smart Assistance',
                      description:
                          'Our smart assistance technology can help you automate your workflows and improve your productivity.',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.mic),
                  label: Text('Speak'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
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

  static Color _getRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  Widget _buildFeature({
    required String title,
    required String description,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
//==============================
/* import 'package:flutter/material.dart';

class AssistanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assistance App',
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Assistance'),
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/woman.png'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Online',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16, left: 16),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                ),
              ),
              child: Text(
                'Good morning, what task can I do for you?',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Here are a few features:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildFeature(
                    title: 'ChatGPT',
                    description:
                        'ChatGPT is an AI-based chatbot that can answer your questions and help you with various tasks.',
                  ),
                  _buildFeature(
                    title: 'DALLE',
                    description:
                        'DALLE is an AI model that can generate high-quality images from text descriptions.',
                  ),
                  _buildFeature(
                    title: 'Smart Assistance',
                    description:
                        'Our smart assistance technology can help you automate your workflows and improve your productivity.',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton.icon(
                icon: Icon(Icons.mic),
                label: Text('Speak'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature({required String title, required String description}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
 */