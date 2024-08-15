import 'dart:developer';

import 'package:weather_app/utilities/app_text_style.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String shaarAti = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/nature.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_city,
                      size: 24.0,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        style: AppTextStyle.textFormFieldTextStyle.copyWith(
                          color: Colors.black,
                        ),
                        onChanged: (String jazilganText) {
                          setState(() {
                            shaarAti = jazilganText;
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).buttonTheme.colorScheme!.primary,
                              width: 4,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                            borderSide: BorderSide(
                              width: 10,
                              color: Theme.of(context).buttonTheme.colorScheme!.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.of(context).pop(shaarAti);
                    Navigator.pop(context, shaarAti);
                  },
                  child: Text(
                    'Get Weather',
                    style: AppTextStyle.buttonTextStyle,
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
