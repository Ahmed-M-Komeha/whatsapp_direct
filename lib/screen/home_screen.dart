import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/screen/widgets/custom_button.dart';
import 'package:whatsapp/screen/widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController msgController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  var phoneNumber = "";
  var msg = '';
  var code = '+20';

  void openWhats() {
    setState(() {
      var url = 'https://wa.me/$code$phoneNumber?text=$msg';
      launchUrl(Uri.parse(url));
      msgController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp Direct'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              const SizedBox(
                height: 28,
              ),
              CustomTextField(
                onChanged: (value) {
                
                    msg = value.toString();
              
                },
                controller: msgController,
                onPressed: () {
                  msgController.clear();
                },
                hintText: 'Enter your message (Optional)',
                icon: FontAwesomeIcons.xmark,
                maxLines: 3,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                validator: (val) {
                  if (val?.isEmpty ?? true) {
                    return 'Number is required';
                  } else {
                    return null;
                  }
                },
                suffixIcon: CountryCodePicker(
                  boxDecoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(16)),

                  onChanged: (value) {
                    code = value.toString();
                  },
                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  initialSelection: 'EG',

                  favorite: ['+20', 'EG'],
                  // optional. Shows only country name and flag
                  showCountryOnly: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                  // optional. aligns the flag and the Text left
                  alignLeft: false,
                ),
                controller: phoneController,
                onChanged: (value) {
                  
                    phoneNumber = value;
                 
                },
                onPressed: () {
                  phoneController.clear();
                },
                keyboardType: TextInputType.phone,
                hintText: 'Enter Number',
                icon: FontAwesomeIcons.xmark,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        openWhats();
                      }
                    },
                    title: 'Send',
                    color: Colors.green,
                    icon: FontAwesomeIcons.paperPlane,
                  ),
                  CustomButton(
                    onPressed: () {
                      Share.share('https://wa.me/$code$phoneNumber');
                    },
                    title: 'Share',
                    color: Colors.teal,
                    icon: FontAwesomeIcons.link,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
