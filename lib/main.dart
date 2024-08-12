import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:google_generative_ai/google_generative_ai.dart';

void main() {
  runApp(HealthInsightApp());
}

class HealthInsightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedXpert',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void _showAboutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AboutDialog(
      applicationName: 'MedXpert',
      applicationVersion: '1.0',
      applicationLegalese: 'Developed by Athiyaman M',
    ),
  );
}

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MedXpert - Doctor AI',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.menu),
          
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              _showAboutDialog(context);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                // Implement profile navigation
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // Implement settings navigation
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Welcome to MedXpert',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Your trusted AI doctor',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HealthInputForm()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/pres.jpg', height: 150, width: 150),
                        Text('Get Prescription',
                        style:TextStyle(color: Colors.white)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      padding: EdgeInsets.all(16.0),
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement navigation or functionality for the second button
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/talk.jpg', height: 40, width: 40),
                        Text('Chat with DocAI',
                        style:TextStyle(color: Colors.white)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      padding: EdgeInsets.all(16.0),
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement navigation or functionality for the third button
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/chat.jpg', height: 40, width: 40),
                        Text('Talk with DocAI',
                        style:TextStyle(color: Colors.white)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      padding: EdgeInsets.all(16.0),
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement navigation or functionality for the fourth button
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/study.jpg', height: 40, width: 40),
                        Text('Study with DocAI',
                        style:TextStyle(color: Colors.white)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      padding: EdgeInsets.all(16.0),
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[900],
        selectedItemColor: Colors.white, // Add this line to define the 'iconTheme'
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class HealthInputForm extends StatefulWidget {
  @override
  _HealthInputFormState createState() => _HealthInputFormState();
}

class FooterBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue[900],
      selectedItemColor: Colors.white, 
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}

class _HealthInputFormState extends State<HealthInputForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String age = '';
  String gender = '';
  String language = '';
  String symptoms = '';
  String how_long_lasted = '';
  XFile? woundImage;
  XFile? xrayImage;
  XFile? tabletImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source, String imageType) async {
    final pickedFile = await _picker.pickImage(source: source);

    setState(() {
      if (imageType == 'wound') {
        woundImage = pickedFile;
      } else if (imageType == 'xray') {
        xrayImage = pickedFile;
      } else if (imageType == 'tablet') {
        tabletImage = pickedFile;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MedXpert - Patient Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Text('Enter Patient Details', 
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,              ),),
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) {
                  name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  age = value!;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Gender'),
                items: ['Male', 'Female', 'Other']
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  gender = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Language'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  language = value!;
                },
              ),

              Text('Enter Symptoms Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              TextFormField(
                decoration: InputDecoration(labelText: 'Symptoms'),
                onSaved: (value) {
                  symptoms = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'How long lasted'),
                onSaved: (value) {
                  how_long_lasted = value!;
                },
              ),
              SizedBox(height: 20),
              Text('Upload Wound Image (Optional)'),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.gallery, 'wound'),
                    child: Text('Pick Wound Image'),
                  ),
                  SizedBox(width: 10),
                  woundImage != null
                      ? Container(
                          width: 100,
                          height: 100,
                          child: Image.network(
                            woundImage!.path,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(),
                ],
              ),
              SizedBox(height: 20),
              Text('Upload Tablet Image (Optional)'),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.gallery, 'tablet'),
                    child: Text('Pick Tablet Image'),
                  ),
                  SizedBox(width: 10),
                  tabletImage != null
                      ? Container(
                          width: 100,
                          height: 100,
                          child: Image.network(
                            tabletImage!.path,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _fetchAndShowPrescription();
                  }
                },
                child: Text(
                  'Get Prescription',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _fetchAndShowPrescription() async {
    showDialog(
      context: context,
      builder: (context) => Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      String prescription = await _getPrescription();
      Navigator.pop(context);
      _showResults(prescription);
    } catch (error) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to get response: $error'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<String> _getPrescription() async {
    // Prepare the request data
    String prompt = """
    Consider yoursellf as doctor and give suggestions for the listed patient details,
    
    Name : $name
    Age : $age
    Gender : $gender
    Symptoms : $symptoms
    How long lasted : $how_long_lasted
    Wound Image: ${woundImage != null ? woundImage!.path : 'Not provided'}
    Tablet Image: ${tabletImage != null ? tabletImage!.path : 'Not provided'}

    Replay in this $language language!
    """;

    final apiKey = 'AIzaSyC1rI88meOil9sknIl1b851riX3dBto-Cc';
    final model = GenerativeModel(model: 'gemini-1.5-pro', apiKey: apiKey);
    final content = [Content.text('$prompt')];
    final response = await model.generateContent(content);

    return response.text!;
  }

  void _showResults(String summary) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SummaryPage(summary)),
    );
  }
}

class SummaryPage extends StatelessWidget {
  final String summary;

  SummaryPage(this.summary);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Summary Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(summary),
        ),
      ),
    );
  }
}
