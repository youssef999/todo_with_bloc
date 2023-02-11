

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/layouts/goals/edit_goal.dart';
import 'package:todo_app/layouts/home_layout.dart';
import 'package:todo_app/tr2/local_keys.dart';
import 'package:todo_app/widgets/Custom_Text.dart';

import 'add_goals.dart';



  class ShowGoalsScreen extends StatefulWidget {


  String lang,cat;

   ShowGoalsScreen(this.lang,this.cat, {Key? key}) : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<ShowGoalsScreen> {

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();


  @override
  Widget build(BuildContext context) {


    final box=GetStorage();
    String email=box.read('email')??'x';

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.lightBlue,
          elevation: 0,
          leading: InkWell(child: const Icon(Icons.arrow_back_ios,color:Colors.white),
          onTap:(){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                   HomeLayout('')));
          },
          ),
        ),
        body: Container(
          height: 1400,
          color: Colors.white,
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('goals')
                      .where('email', isEqualTo: email)
                      .where('cat', isEqualTo: widget.cat)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: Text('Loading'));
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Text('Loading...');
                      default:
                        if (snapshot.data!.docs.isEmpty){
                          return const Center(
                              child:Custom_Text(
                                fontSize:21,
                                text:"No Data",
                                alignment:Alignment.center,
                              )
                          );
                        }else{
                          return GridView.builder(
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.0,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 1,
                              ),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot posts =
                                snapshot.data!.docs[index];
                                String cat='';

                                final taskTime = DateTime.parse(posts['date']);
                                final date2 = DateTime.now();
                                final difference = date2.difference(taskTime).inDays;

                                if(posts['cat']=='day' && widget.lang=='Goals'){
                                  cat='Day Goal';
                                }

                                if(posts['cat']=='day' && widget.lang=='الاهداف'){
                                  cat='هدف يومي';
                                }

                                if(posts['cat']=='week' && widget.lang=='Goals'){
                                  cat='Week Goal';
                                }

                                if(posts['cat']=='week' && widget.lang=='الاهداف'){
                                  cat='هدف اسبوعي';
                                }

                                if(posts['cat']=='month' && widget.lang=='Goals'){
                                  cat='Month Goal';
                                }
                                if(posts['cat']=='month' && widget.lang=='الاهداف'){
                                  cat='هدف شهري';
                                }

                                if(posts['cat']=='year' && widget.lang=='Goals'){
                                  cat='Year Goal';
                                }
                                if(posts['cat']=='year' && widget.lang=='الاهداف'){
                                  cat='هدف سنوي ';
                                }

                                return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Card(
                                            color:Colors.white70,
                                            child:Row(
                                              children: [
                                                const SizedBox(width:10,),

                                                Padding(
                                                  padding: const EdgeInsets.only(top:6.0),
                                                  child: Column(
                                                    children: [
                                                      Custom_Text(text: posts['day']??"",
                                                        alignment:Alignment.center,
                                                        font: FontWeight.bold,
                                                        fontSize:13,
                                                        color:Colors.black,),
                                                      const SizedBox(height:4,),
                                                      Custom_Text(text: posts['month']??"",
                                                          alignment:Alignment.center,
                                                          fontSize:12,
                                                          color:Colors.black),

                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(width:7,),
                                            const Custom_Text(text: "|",fontSize:27,color:Colors.black,),
                                                // Column(
                                                //   children:const [
                                                //
                                                //     Custom_Text(text: "|",fontSize:20,color:Colors.black,)
                                                //   ]
                                                // )


                                                const SizedBox(width:6,),
                                                Padding(
                                                  padding: const EdgeInsets.all(3.0),
                                                  child: Column(
                                                    children: [
                                                      Custom_Text(text: posts['day2']??"",
                                                        alignment:Alignment.center,
                                                        fontSize:14,
                                                        color:Colors.black,),
                                                      const SizedBox(height:4,),
                                                      Custom_Text(text: difference.toString(),
                                                        alignment:Alignment.center,
                                                        fontSize:14,
                                                        color:Colors.black,),

                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(width:7,),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height:5,),
                                          InkWell(
                                            child: Card(
                                              color: Colors.white,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft: Radius
                                                            .circular(10),
                                                        topRight:
                                                        Radius.circular(
                                                            10),
                                                        bottomLeft:
                                                        Radius.circular(
                                                            10),
                                                        bottomRight:
                                                        Radius.circular(
                                                            10)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: const Offset(0,
                                                            3), // changes position of shadow
                                                      ),
                                                    ]),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      width: 420,
                                                      height: 28,
                                                      child: Image.asset(
                                                          'assets/goal.jpg',
                                                          fit: BoxFit.scaleDown),
                                                    ),
                                                    const SizedBox(height: 3),
                                                    Column(
                                                      children: [
                                                         SizedBox(
                                                           width:120,
                                                           height:25,
                                                           child: Center(
                                                             child: Text(
                                                               (posts['goal']),
                                                               style: const TextStyle(
                                                                   color: Colors.black,
                                                                   fontSize: 9,
                                                                   fontWeight: FontWeight.bold),
                                                             maxLines:2,
                                                             ),
                                                           ),),
                                                        const SizedBox(
                                                          height: 2,
                                                        ),
                                                        Container(
                                                          padding:const EdgeInsets.all(4),
                                                          height:23,
                                                          child: Text(

                                                            (posts['notes']),
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .grey,
                                                                fontSize: 9,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                            maxLines: 2,

                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 2,
                                                        ),
                                                        Text(
                                                          (cat),
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .blue,
                                                              fontSize: 10,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            onTap: () {

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) =>
                                                  EditGoals(
                                                    cat:posts['cat'] ,
                                                    goal: posts['goal'],
                                                    notes: posts['notes'],
                                                  )
                                                  ));



                                            },
                                          ),

                                        ],
                                      ),
                                    );
                              });
                        }
                    }
                  }),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){


            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                AddGoalsScreen(
                        cat:widget.cat
                    )));



          },
          backgroundColor:Colors.lightBlue,
          child: const Icon(Icons.add,color:Colors.white,),

        )

    );
  }
}
