import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:password_manager_app/password_generator.dart';
import 'package:password_manager_app/screens/manager.dart';

class PasswordGeneratorScreen extends StatefulWidget {
  const PasswordGeneratorScreen({Key? key}) : super(key: key);
  @override
  _PasswordGeneratorScreenState createState() =>
      _PasswordGeneratorScreenState();
}

class _PasswordGeneratorScreenState extends State<PasswordGeneratorScreen> {
  TextEditingController generatedPassword = new TextEditingController();
  int passLength = 12;
  bool lowerOn = true, upperOn = true, numOn = true, symOn = true;

  @override
  Widget build(BuildContext context) {
    this.generatedPassword.text = passwordGenerator(
        length: this.passLength,
        lower: this.lowerOn,
        numbers: this.numOn,
        symbols: this.symOn,
        upper: this.upperOn);

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).backgroundColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Positioned(
          //   width: MediaQuery.of(context).size.width - 50,
          //   top: 0,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     mainAxisSize: MainAxisSize.max,
          //     children: [
          //       IconButton(
          //         onPressed: () {
          //           print('button clicked');
          //           Navigator.push(context,
          //               MaterialPageRoute(builder: (context) => PWManager()));
          //         },
          //         iconSize: 18,
          //         icon: Icon(FontAwesomeIcons.list),
          //         color: Colors.white,
          //         hoverColor: Colors.amber,
          //       )
          //     ],
          //   ),
          // ),
          //TextField Label and Slider Container
          Container(
            height: MediaQuery.of(context).size.height - 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //TextField Label
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        letterSpacing: .7,
                      ),
                    ),
                    Text(
                      this.passLength.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        letterSpacing: .7,
                      ),
                    ),
                  ],
                ),
                //TextField (password display)
                Container(
                  child: TextField(
                    controller: generatedPassword,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLength: 50,
                    maxLines: 3,
                    minLines: 1,
                    decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(0)),
                  ),
                ),
                //Length Slider for passwor length
                Container(
                  width: 225,
                  child: Slider(
                    onChanged: (v) {
                      this.setState(() {
                        this.passLength = v.round();
                      });
                    },
                    activeColor: Theme.of(context).primaryColor,
                    inactiveColor: Theme.of(context).primaryColor.withAlpha(50),
                    min: 8,
                    max: 50,
                    value: this.passLength.toDouble(),
                  ),
                ),
                SizedBox(
                  height: 150,
                )
              ],
            ),
          ),
          //Controlls and settings Container (Generate, Save and Copy)
          Positioned(
            bottom: 0,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      //Save Button
                      Container(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.plus),
                          color: Colors.white,
                        ),
                      ),
                      //Generator Button
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: MaterialButton(
                          onPressed: () {
                            this.setState(() {
                              this.generatedPassword.text = passwordGenerator(
                                  length: this.passLength,
                                  lower: this.lowerOn,
                                  numbers: this.numOn,
                                  symbols: this.symOn,
                                  upper: this.upperOn);
                            });
                          },
                          child: Icon(
                            FontAwesomeIcons.cog,
                            color: Colors.white,
                            size: 20,
                          ),
                          color: Theme.of(context).accentColor,
                          height: 50,
                          minWidth: 50,
                          shape: CircleBorder(side: BorderSide.none),
                          elevation: 6,
                        ),
                      ),
                      //Copy Button
                      Container(
                        child: IconButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(
                                text: this.generatedPassword.text));
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Copied to Clipboard',textAlign: TextAlign.center,),behavior: SnackBarBehavior.floating,));
                          },
                          icon: Icon(FontAwesomeIcons.copy),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  //Settings Label
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Characters',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .7,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  //Setting Switches
                  Row(
                    children: [
                      //lowercase switch
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        child: GestureDetector(
                          onTap: () {
                            this.setState(() {
                              this.lowerOn = !this.lowerOn;
                            });
                          },
                          child: Text(
                            'a-z',
                            style: TextStyle(
                              color: this.lowerOn
                                  ? Theme.of(context).primaryColor
                                  : Colors.white.withAlpha(20),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      //uppercase switch
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        child: GestureDetector(
                          onTap: () {
                            this.setState(() {
                              this.upperOn = !this.upperOn;
                            });
                          },
                          child: Text(
                            'A-Z',
                            style: TextStyle(
                              color: this.upperOn
                                  ? Theme.of(context).primaryColor
                                  : Colors.white.withAlpha(20),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      //numbers switch
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        child: GestureDetector(
                          onTap: () {
                            this.setState(() {
                              this.numOn = !this.numOn;
                            });
                          },
                          child: Text(
                            '0-9',
                            style: TextStyle(
                              color: this.numOn
                                  ? Theme.of(context).primaryColor
                                  : Colors.white.withAlpha(20),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      //special charachters switch
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        child: GestureDetector(
                          onTap: () {
                            this.setState(() {
                              this.symOn = !this.symOn;
                            });
                          },
                          child: Text(
                            '!@#',
                            style: TextStyle(
                              color: this.symOn
                                  ? Theme.of(context).primaryColor
                                  : Colors.white.withAlpha(20),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
