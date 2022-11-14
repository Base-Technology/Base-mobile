import 'package:flutter/material.dart';

class NewProposal extends StatelessWidget {
  final String proposalType;
  const NewProposal({Key? key, required this.proposalType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxLines = 5;
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          "Create Proposal",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: Colors.white
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Text("Member Proposal"),
            Text("Proposal for DAO membership"),
            SizedBox(height: 10),
            Text("TITLE"),
            TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                  hintText: "Proposal Title",
                  hintStyle: TextStyle(color: Color(0xF271767C)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 12.5),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xFFBABBBF)
                    ),
                  ),
              ),
            ),
            SizedBox(height: 10),
            Text("DESCRIPTION"),
            SizedBox(
              height: maxLines * 24.0,
              child: TextField(
                textAlign: TextAlign.left,
                maxLines: maxLines,
                decoration: InputDecoration(
                    hintText: "Proposal description here.",
                    hintStyle: TextStyle(color: Color(0xF271767C)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 12.5),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Color(0xFFBABBBF)
                      ),
                    ),
              ),
              ),
            ),
            SizedBox(height: 5),
            Text("SHARES REQUESTED"),
            TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: "0",
                hintStyle: TextStyle(color: Color(0xF271767C)),
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 12.5),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFBABBBF)
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("PAYMENT REQUESTED (WETH)"),
            TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: "0",
                hintStyle: TextStyle(color: Color(0xF271767C)),
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 12.5),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFBABBBF)
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  width: 125,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xFFEB8A23),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Cancel"
                        ),
                      ),
                    ),
                ),
                SizedBox(width: 35),
                Container(
                  height: 45,
                  width: 125,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xFFEB8A23),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                          "Create"
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
