import 'package:flutter/material.dart';

//Note that the colors are #2c7b4b(main colour) and sub colours #fdfcff and #40b26d for button
//I already added the google fonts package, use poppins
//I'M COUNTING ON YOU!!!
class RemindersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Reminders());
  }
}



// TODO: FIND A BETTER WAY TO MAKE DROPDOWN DRY AND RE-USABLE


// So I used a package for the Reminder it's a bottom-sheet package 

class Reminders extends StatefulWidget {
  @override
  _RemindersState createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  
  var _remValue;
  var _startValue;
  var _daysValue;
  var _durationValue;
  bool _val = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(leading: IconButton(icon: Icon(Icons.keyboard_backspace), onPressed: null,), elevation: 0, backgroundColor: Colors.grey[100]),
      backgroundColor: Colors.yellow,
    body: Container(
      color: Colors.grey[100],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: ListView(
            children: <Widget>[
              Form(controller: null, hint: "Drug Name"),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: DBox(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:1.5),
                        child: Row(
                          children: <Widget>[
                            PillBox(height: 50, width: 80, pill: Text('Tablet'),),
                            PillBox(height: 50, width: 80, pill: Text('Capsule'),),
                            PillBox(height: 50, width: 80, pill: Text('Drops'),),
                            PillBox(height: 50, width: 80, pill: Text('Injection'),),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Reminder Times', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                              DropdownButton(
                              items: [
                                DropdownMenuItem(
                                  value: "1",
                                  child: Text("Once"),
                                ),
                                DropdownMenuItem(
                                  value: "2",
                                  child: Text("Twice"),
                                ),
                                DropdownMenuItem(
                                  value: "3",
                                  child: Text("Thrice"),
                                ),
                                DropdownMenuItem(
                                  value: "4",
                                  child: Text("EveryDay"),
                                ),
                              ],
                              onChanged: (value){
                                setState(() {
                                  _remValue = value;
                                });
                              },
                              value: _remValue,
                              elevation: 0,
                              hint: Text("Once")
                            )
                        ],
                        ),
                      ),
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Dosage (per day)', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),)
                        ],
                        ),
                      ),
                      SizedBox(height: 55,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.av_timer),
                            Text('8:00 AM',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18))
                        ],
                        ),
                      )
                    ]
                  ,)
                ,),
              ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: DBox(
                child: Column(
                  children: <Widget>[
                         SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Start', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                            DropdownButton(
                              items: [
                                DropdownMenuItem(
                                  value: "1",
                                  child: Text("Today"),
                                ),
                                DropdownMenuItem(
                                  value: "2",
                                  child: Text("Tomorrow"),
                                ),
                              ],
                              onChanged: (value){
                                setState(() {
                                  _startValue = value;
                                });
                              },
                              value: _startValue,
                              elevation: 0,
                              hint: Text("Today")
                            )
                        ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Days', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                             DropdownButton(
                              items: [
                                DropdownMenuItem(
                                  value: "1",
                                  child: Text("Sunday"),
                                ),
                                DropdownMenuItem(
                                  value: "2",
                                  child: Text("Monday"),
                                ),
                                DropdownMenuItem(
                                  value: "3",
                                  child: Text("Tuesday"),
                                ),
                                DropdownMenuItem(
                                  value: "4",
                                  child: Text("Wednesday"),
                                ),
                                DropdownMenuItem(
                                  value: "5",
                                  child: Text("Thursday"),
                                ),
                                DropdownMenuItem(
                                  value: "6",
                                  child: Text("Friday"),
                                ),
                                DropdownMenuItem(
                                  value: "7",
                                  child: Text("Saturday"),
                                ),
                                DropdownMenuItem(
                                  value: "8",
                                  child: Text("EveryDay"),
                                ),
                              ],
                              onChanged: (value){
                                setState(() {
                                  _daysValue = value;
                                });
                              },
                              value: _daysValue,
                              elevation: 0,
                              hint: Text("EveryDay"))
                        ],
                        ),
                      ),
                      SizedBox(height: 25,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Duration', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                            DropdownButton(
                              items: [
                                DropdownMenuItem(
                                  value: "1",
                                  child: Text("1 Month"),
                                ),
                                DropdownMenuItem(
                                  value: "2",
                                  child: Text("Tomorrow"),
                                ),
                              ],
                              onChanged: (value){
                                setState(() {
                                  _durationValue = value;
                                });
                              },
                              value: _durationValue,
                              elevation: 0,
                              hint: Text("1 Month")
                            )
                        ],
                        ),
                      ),
                      SizedBox(height: 25,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Alarm', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                            Switch(
                              activeColor: Colors.green,
                              activeTrackColor: Colors.greenAccent,
                              onChanged: (val){
                                setState(() {
                                  _val = val;
                                });
                              },
                              value: _val,)
                        ],
                        ),
                      ),
                    ]
                  ,)
              ,),
            ),
            SizedBox(height: 15,),
            Button(tap: (){},)
          ],
      ),
        )
    ), 
      );
  }
}


// This would be a widget for the form 

class Form extends StatefulWidget {
  const Form({Key key, this.hint, this.controller}) : super(key: key);

  final TextEditingController controller;
  final String hint;

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(hintText: widget.hint, hintStyle: TextStyle(fontSize: 18)),
      ),
    );
  }
}

class DBox extends StatefulWidget {
  final Widget child;

  const DBox({Key key, this.child}) : super(key: key);
  @override
  _DBoxState createState() => _DBoxState();
}

class _DBoxState extends State<DBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white,),
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.height * 0.50,
      child: widget.child,
    );
  }
}


class PillBox extends StatefulWidget {

  final double height;
  final double width;
  final Text pill;

  const PillBox({Key key, this.height, this.width, this.pill}) : super(key: key);
  
  @override
  _PillBoxState createState() => _PillBoxState();
}

class _PillBoxState extends State<PillBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: widget.height, 
        width: widget.width,
        child: Center(child: widget.pill,), 
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.grey[100]),
      ),
    );
  }
}


class Button extends StatefulWidget {
  final Function tap;

  const Button({Key key, this.tap}) : super(key: key);
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.tap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green[700]),
          child: Center(child: Text("Add Schedule"),),
      ),
        ),
    );
  }
}