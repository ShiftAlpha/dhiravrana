import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package

class PopupFormWidget extends StatefulWidget {
  final Function(String recipient, String subject, String body)
      onSubmit; // Define onSubmit callback

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

  void _sendEmail(String recipient, String subject, String body) async {
    String emailUrl = 'mailto:$recipient?subject=$subject&body=$body';
    if (await canLaunch(emailUrl)) {
      await launch(emailUrl);
    } else {
      throw 'Could not launch $emailUrl';
    }
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
                  SizedBox(height: 10),
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
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _messageController,
                    decoration: InputDecoration(labelText: 'Message\n\n'),
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
                            String firstName = _firstNameController.text;
                            String lastName = _lastNameController.text;
                            String email = _emailController.text;
                            String phone = _phoneController.text;
                            String subject = _subjectController.text;
                            String message = _messageController.text;

                            String recipientEmail = 'ranadhirav08@gmail.com';
                            String emailSubject = 'New Message: $subject';
                            String emailBody =
                                'Name: $firstName $lastName\nEmail: $email\nPhone: $phone\nMessage: $message';

                            // Call onSubmit function with email parameters
                            widget.onSubmit(
                                recipientEmail, emailSubject, emailBody);
                            _sendEmail(recipientEmail, emailSubject,
                                emailBody); // Send email
                            Navigator.of(context).pop(); // Close the popup
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
