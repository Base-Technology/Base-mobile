import 'package:acy_ipay/Chat/new_proposal.dart';
import 'package:acy_ipay/Chat/proposal_details.dart';
import 'package:acy_ipay/Homepage/wallet_page.dart';
import 'package:acy_ipay/widget/CustomText.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:acy_ipay/Constant/proposals_data.dart';
import '../DAO/model/dao_proposal_card.dart';

class ProposalMain extends StatefulWidget {
  const ProposalMain({Key? key}) : super(key: key);

  @override
  State<ProposalMain> createState() => _ProposalMainState();
}

class _ProposalMainState extends State<ProposalMain> {
  List _newProposalList = [
    {'no': 1, 'keyword': 'MEMBERSHIP PROPOSAL'},
    {'no': 2, 'keyword': 'FUNDING PROPOSAL'},
    {'no': 3, 'keyword': 'WHITELIST A NEW TOKEN'},
    {'no': 4, 'keyword': 'SWAP TOKENS FOR LOOT OR SHARES'},
    {'no': 5, 'keyword': 'GUILD KICK'},
    {'no': 6, 'keyword': 'SIGNAL PROPOSAL'},
  ];
  List<DropdownMenuItem<Object?>> _dropdownTestItems = [];

  @override
  void initState() {
    _dropdownTestItems = buildDropdownTestItems(_newProposalList);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<DropdownMenuItem<Object?>> buildDropdownTestItems(List _newProposalList) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in _newProposalList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }

  onChangeDropdownTests(selectedTest) {
    var temp = selectedTest['keyword'];
    if (temp == 'MEMBERSHIP PROPOSAL'){
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NewProposal(proposalType: temp,)));
      }
     else if(temp == 'FUNDING PROPOSAL') {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NewProposal(proposalType: temp,)));
      }
     else{
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WalletPage()));
     }
  }


  @override
  Widget build(BuildContext context) {
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
        actions: [
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFFEB8A23),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: DropdownBelow(
                itemWidth: 250,
                itemTextstyle: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                boxTextstyle: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
                boxPadding: EdgeInsets.fromLTRB(35, 10, 35, 0),
                boxWidth: 250,
                boxHeight: 35,
                icon: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                ),
                hint: Text('NEW PROPOSAL'),
                items: _dropdownTestItems,
                onChanged: onChangeDropdownTests,
              ),
            )
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              ...prop.map(
                      (proposal) => GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProposalDetails(type: proposal["type"], name: proposal["name"], amount: proposal["amount"], date: proposal["date"])));
                        },
                          child: DaoCard(type: proposal["type"], name: proposal["name"], amount: proposal["amount"], date: proposal["date"])
                      )
              ),
            ],
          )
      ),
    );
  }
}
