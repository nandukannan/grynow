import 'package:flutter/material.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'demoData.dart';
import 'constants.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
          slivers: <Widget> [
          SliverAppBar(
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              color: Colors.black,
              onPressed: () { Scaffold.of(context).openDrawer(); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: <Widget>[

          IconButton(
            icon: const Icon(Icons.favorite_outline_rounded),
            color: Colors.black,
        //    tooltip: 'Show Snackbar',
            onPressed: () {
              //ScaffoldMessenger.of(context).showSnackBar(
              //  const SnackBar(content: Text('This is a snackbar')));
            },
          ),/**/
          /*   */
        ],
        backgroundColor: Colors.white,
      ),
       SliverToBoxAdapter(
            child:Expanded(child: ImageCarousel()),
          ),
    SliverToBoxAdapter(
     child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
    ReusableCard(
    colour:Colors.black12,
    cardChild: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Text(
    'HEIGHT',
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.alphabetic,
    children: <Widget>[
    Text(
    'height.toString(),style: kNumberTextStyle,'
    ),
    Text(
    'cm',
    //style: kLabelTextStyle,
    )
    ],
    ),
  ]
    )
     )
        ],
     )
    )

    ]
    ),
    );
           }
}

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}
class _ImageCarouselState extends State<ImageCarousel> {
  int _currentpage=0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 1.81,
          child :Stack(
            alignment:Alignment.bottomCenter,
            children: [
              PageView.builder(
                  itemCount: demoBigImages.length,
                  onPageChanged:(value){
                    setState(() {
                      _currentpage=value;
                    });
                  },
                  itemBuilder: (context,index)=>

                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(5),
                        child: Image.asset(
              demoBigImages[index]),
                      )

      ),
              Positioned(
                bottom: defaultPadding,
               left:  defaultPadding,
                child: Row(children:List.generate(demoBigImages.length,(index)=>Padding(
                  padding:const EdgeInsets.only(left:defaultPadding/3),
                  child: IndicatorDot(isActive:index==_currentpage),
                )


                )

                ),
              ),
            ],
          )

    );
  }
}
class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    Key? key,
     required this.isActive,
  }) : super(key: key);
final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:8,
      width:20,
      decoration: BoxDecoration(
        color:isActive ? Colors.orange:Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, required this.cardChild});

  final Color colour;
  final Widget cardChild;
  //final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     // onTap: onPress,
      child: Container(
      //  height: 15,
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
