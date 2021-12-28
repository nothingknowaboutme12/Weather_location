import 'package:flutter/material.dart';
class City_Screen extends StatelessWidget {
late String Typedvalue;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/city_background.jpg'),
              fit: BoxFit.fill,

            ),

          ),
          constraints: BoxConstraints.expand(),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(

                  decoration: InputDecoration(

                    filled: true,
                    fillColor: Colors.white
                  ),
                  onChanged: (newvalue){
                    Typedvalue=newvalue;
                  },
                ),
              ),
              FlatButton(onPressed: () {
                Navigator.pop(context,Typedvalue);
              },
                color: Colors.lightBlueAccent,
                child:Text("Get Location",style: TextStyle(fontSize: 20,color: Colors.white),),)
            ],
          ),
        ),
      ),
    );
  }
}
