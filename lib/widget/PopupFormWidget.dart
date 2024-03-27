import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore package
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package

class PopupFormWidget extends StatefulWidget {
  final Function(String recipient, String subject, String body) onSubmit;

  const PopupFormWidget({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _PopupFormWidgetState createState() => _PopupFormWidgetState();
}

class _PopupFormWidgetState extends State<PopupFormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  // void _sendEmail(String recipient, String subject, String body) async {
  //   String emailUrl = 'mailto:$recipient?subject=$subject&body=$body';
  //   if (await canLaunch((emailUrl))) {
  //     await launch((emailUrl));
  //   } else {
  //     throw 'Could not launch $emailUrl';
  //   }
  // }
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message Sent'),
          content: Text('Your message has been sent successfully.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _storeFormData() {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;
    String subject = _subjectController.text;
    String message = _messageController.text;

    // Store data in Cloud Firestore
    FirebaseFirestore.instance.collection('user_messages').add({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'subject': subject,
      'message': message,
      'timestamp': FieldValue
          .serverTimestamp(), // Optional: Timestamp when data was added
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(18.0),
      child: SizedBox(
        width: 400,
        child: Container(
          padding: EdgeInsets.all(18.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.transparent,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the popup
                        },
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      'Leave a Message',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _firstNameController,
                          decoration: InputDecoration(labelText: 'First Name'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: _lastNameController,
                          decoration: InputDecoration(labelText: 'Last Name'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _emailController,
                          decoration:
                              InputDecoration(labelText: 'Email Address'),
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: _phoneController,
                          decoration:
                              InputDecoration(labelText: 'Phone Number'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _subjectController,
                    decoration: InputDecoration(labelText: 'Subject'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a subject';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _messageController,
                    decoration: InputDecoration(labelText: 'Message'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a message';
                      }
                      return null;
                    },
                    maxLines: null,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _storeFormData(); // Store form data in Firestore
                            // String firstName = _firstNameController.text;
                            // String lastName = _lastNameController.text;
                            // String email = _emailController.text;
                            // String phone = _phoneController.text;
                            // String subject = _subjectController.text;
                            // String message = _messageController.text;

                            // String recipientEmail = 'ranadhirav08@gmail.com';
                            // String emailSubject = 'New Message: $subject';
                            // String emailBody =
                            //     'Name: $firstName $lastName\nEmail: $email\nPhone: $phone\nMessage: $message';

                            // widget.onSubmit(recipientEmail, emailSubject, emailBody);
                            // _sendEmail(recipientEmail, emailSubject, emailBody);
                            // Navigator.of(context).pop();
                            _showConfirmationDialog(); // Close the popup
                          }
                        },
                        child: Text('Send'),
                      ),
                    ],
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
