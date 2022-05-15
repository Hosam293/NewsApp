import 'package:flutter/material.dart';
import 'package:skynews/Constants.dart';
import 'package:skynews/view/Widgets/DefCard.dart';

import '../../Services/APIS.dart';
import 'CateScreen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGround,
        body: Padding(
          padding:  EdgeInsets.only(left: 10.0,top: MediaQuery.of(context).size.height/20,right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Text(
                  'Choose your news',
                style: TextStyle(
                  color: textColor,
                  fontSize: fonttitel,
                  fontWeight: FontWeight.w800
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'categories',
                style: TextStyle(
                    color: textColor,
                    fontSize: fontSubTitel,
                    fontWeight: FontWeight.w800
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                height: 50.0,
                child: ListView.separated(separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 5.0,
                ),
                  itemBuilder: (BuildContext context, int index) =>Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: newsColor[index],
                    ),
                    // clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: MaterialButton(onPressed: ()
                    {
                      Navigator.push(context,
                        MaterialPageRoute (
                          builder: (BuildContext context) =>  CateScreen( textNews: '${newsText[index]}',),
                        ),);
                    },

                      height: 50.0,
                      child: Text(
                        '${newsText[index]}',
                        style: TextStyle(
                            color: black,
                            fontSize: fontlarge,
                            fontWeight: FontWeight.w800
                        ),
                      ),


                    ),
                  ),
                  itemCount: newsText.length,
                  scrollDirection: Axis.horizontal,


                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: FutureBuilder(
                  future: APIS.fetchArticles(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
                  {
                    return (snapshot.hasData)? ListView.separated(separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10.0,),
                      itemBuilder: (BuildContext context, int index) => DefCard(title:'${snapshot.data[index].title}', urlToImage: '${snapshot.data[index].urlToImage}', url: '${snapshot.data[index].url}',),
                      itemCount: snapshot.data.length,

                    ): Center(child: CircularProgressIndicator());

                  },


                )
              )

            ],
          ),
        ),

      ),
    );
  }
}
