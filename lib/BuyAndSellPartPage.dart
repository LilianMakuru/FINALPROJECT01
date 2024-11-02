import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class BuyAndSellPartPage extends StatefulWidget {
  @override
  _BuyAndSellPartPageState createState() => _BuyAndSellPartPageState();
}

class _BuyAndSellPartPageState extends State<BuyAndSellPartPage> {
  TextEditingController partNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController contactInfoController = TextEditingController();

  String conditionValue = 'Used'; // Default value for condition dropdown
  List<String> posts = []; // List to store posts

  String? errorMessage; // Variable to hold error message
  File? _image; // Variable to hold the selected image

  final ImagePicker _picker = ImagePicker(); // ImagePicker instance

  Future<void> _chooseImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery, // Or use ImageSource.camera for capturing
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post a Part for Sale'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: partNameController,
                    decoration: InputDecoration(
                      labelText: 'Part Name',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(
                        value: 'Used',
                        child: Text('Used'),
                      ),
                      DropdownMenuItem(
                        value: 'New',
                        child: Text('New'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        conditionValue = value.toString();
                      });
                    },
                    value: conditionValue,
                    decoration: InputDecoration(
                      labelText: 'Condition',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: contactInfoController,
                    decoration: InputDecoration(
                      labelText: 'Contact Information',
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: _chooseImage,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[300],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                        child: Text(
                          'Choose Image/Video',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (_image != null) // Show the chosen image
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Image.file(
                        _image!,
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  SizedBox(height: 20),
                  if (errorMessage != null)
                    Text(
                      errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      // Add logic to submit form data
                      String partName = partNameController.text;
                      String description = descriptionController.text;
                      String contactInfo = contactInfoController.text;

                      // Check if any required field is empty
                      if (partName.isEmpty || description.isEmpty || contactInfo.isEmpty) {
                        setState(() {
                          errorMessage = 'Please fill in all required fields.';
                        });
                        return; // Stop further execution
                      }

                      // Clear error message
                      setState(() {
                        errorMessage = null;
                      });

                      // Validate and submit data (add your logic here)

                      // For demonstration purposes, add the post to the list
                      posts.add('Part Name: $partName, Description: $description, Condition: $conditionValue, Contact Information: $contactInfo');

                      // Clear form fields
                      partNameController.clear();
                      descriptionController.clear();
                      contactInfoController.clear();
                      _image = null; // Clear the selected image

                      // Navigate to a new page to display posts
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DisplayPostsPage(posts: posts),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: Text(
                      'Post',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DisplayPostsPage extends StatelessWidget {
  final List<String> posts;

  DisplayPostsPage({required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(posts[index]),
          );
        },
      ),
    );
  }
}
