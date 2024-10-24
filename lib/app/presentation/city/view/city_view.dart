import 'package:weather_app/common/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class CityView extends StatefulWidget {
  const CityView({super.key});

  @override
  _CityViewState createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
  String city = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(
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
                        onChanged: (String value) {
                          setState(() {
                            city = value;
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
                    Navigator.pop(context, city);
                  },
                  child: const Text(
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
