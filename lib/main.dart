import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Body Mass Index',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,

      ),
      home: MyHome(),
    );
  }
}
class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
    double sliderValueHeight=0;
    double sliderValueWeight=0;
  var val ;
  bool selected =false ;
  var text ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(  title: Text("BMI Calculator"),backgroundColor: Colors.indigo,),
        body: Column(
          children: [

            Text('Enter your Length'),
            Slider(
              value: sliderValueHeight,
              min: 0,
              max: 300,
              divisions: 300,
              label: sliderValueHeight.round().toString(),
              onChanged: (double value) {
                setState(() {
                  sliderValueHeight = value;
                });
              },


            ),
            Text('Enter your Weight'),
            Slider(
              value:sliderValueWeight,
              min: 0,
              max: 300,
              divisions: 300,
            label: sliderValueWeight.round().toString(),
              onChanged: (double value) {
                setState(() {
                  sliderValueWeight = value;
                });
              },
            ),


            ListTile(
              title: Text("Male"),
              leading: Radio(
                value: 1,
                groupValue: val,
                onChanged: (value) {
                  setState(() {
                    val = value;
                 
                  });
                },
                activeColor: Colors.green,
              ),
            ),


            ListTile(title: Text('Female'),
              leading:Radio(
                value: 2,
                groupValue: val,
                onChanged:(value){
                  setState(() {
                    val = value;

                  })
                  ;},
                activeColor: Colors.pink,

               // toggleable: true,
              ) ,
            ),

         GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
            if(selected) {
              if (sliderValueHeight != 0 && sliderValueWeight != 0 && val != null)
                text = sliderValueWeight / (sliderValueHeight * sliderValueHeight);
              else
                text = "please Enter all Data";
            }});
        },

           child: Center(
            child: AnimatedContainer(
            width: selected ? 200.0 : 500.0,
            height: selected ? 200.0 : 50.0,
            color: selected ? Colors.indigo : Colors.indigo,
            alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
             child:Column(
               children: [Flexible(child: Icon(Icons.medical_services_outlined)),
                 !selected?Text('Calculate'): Text('$text'),],
             )

          ),
        ),

      ),
        ],
        ),
      backgroundColor: Colors.white30,


    );

  }

  }


