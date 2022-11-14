import 'package:flutter/material.dart';

import '../widget/CustomText.dart';

class ProposalDetails extends StatelessWidget {
  final String type;
  final String name;
  final String amount;
  final String date;
  const ProposalDetails({Key? key, required this.type, required this.name, required this.amount, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List people = ["derek", "test", "Frederick", "John", "Doughlas", "Edward", "Doctor", "test2", "test3", "test4"];

    Widget _voteWidget(int yesVote, int noVote) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: LinearProgressIndicator(
                  minHeight: 20,
                  color: Colors.green,
                  backgroundColor: Colors.red,
                  value: (yesVote / (yesVote + noVote)),
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${yesVote.toString()} YES'),
                  Text('${noVote.toString()} NO'),
                ],
              )
            ],
          ),
        ),

      );
    };

    return Scaffold(
      backgroundColor: Color(0xF2363940),
      appBar: AppBar(
        backgroundColor: Color(0xD9212226),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "All Proposals",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: Colors.white
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.42,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFF0E0E0E)
              ),
              padding: const EdgeInsets.all(18),
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        type,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        textColor: Colors.white,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText("Passed", textColor: Colors.white),
                          CustomText("9 months ago", textColor: Colors.white),
                        ],
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                    child: CustomText(name, fontSize: 22, fontWeight: FontWeight.w400, textColor: Color(0xFFBABBBF),),
                  ),
                  SizedBox(height: 5),
                  CustomText("TOTAL FUNDS REQUESTED", textColor: Color(0xFFE38522), fontSize: 14),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 15),
                    child: CustomText(amount, textColor: Color(0xFFE38522), fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText("PROPOSED BY", textColor: Colors.white, fontSize: 15,),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,8,8,8),
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.white38,
                                    ),
                                  ),
                                  CustomText("test.base", textColor: Colors.white, fontSize: 15,),
                                ],
                              ),
                            ],
                      ),
                   Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText("RECIPIENT", textColor: Colors.white, fontSize: 15,),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,8,8,8),
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Colors.white38,
                                  ),
                                ),
                                CustomText("0x2d81...fe41", textColor: Colors.white, fontSize: 15,),
                              ],
                            ),
                          ],
                       )
                    ],
                  ),
                  SizedBox(height: 10),
                  _voteWidget(200, 330),
                  CustomText("You have voted YES for this proposal.", textColor: Colors.white),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: CustomText("ACTIVITY", fontSize: 20, textColor: Colors.white),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF0E0E0E)
                ),
                child: SingleChildScrollView(
                  child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: people.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white38,
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(people[index] + " voted yes", textColor: Colors.white, fontSize: 15),
                                CustomText("5 months ago", textColor: Colors.white, fontSize: 15)
                              ],
                            ),
                          );
                        },
                      ),
                ),
              ),
            )
          ],
        ),
    );
  }
}
