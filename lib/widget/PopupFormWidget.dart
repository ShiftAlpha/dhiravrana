import 'package:flutter/material.dart';
import 'package:dhiravrana/constants.dart'; // Import your constants file

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

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                Text(
                  'Leave a Message',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email Address'),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
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
                SizedBox(height: 10),
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
                          String firstName = _firstNameController.text;
                          String lastName = _lastNameController.text;
                          String email = _emailController.text;
                          String phone = _phoneController.text;
                          String subject = _subjectController.text;
                          String message = _messageController.text;

                          // Implement email sending logic here
                          // Example: sendEmail(firstName, lastName, email, phone, subject, message);

                          widget.onSubmit(email, subject, message);
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
    );
  }
}
