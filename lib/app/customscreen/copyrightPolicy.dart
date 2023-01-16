

import 'package:flutter/material.dart';

class CopyrightPolicy extends StatelessWidget {
  const CopyrightPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("COPYRIGHT POLICY"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: const [
              SizedBox(height: 10,),
              Text('''The ScoreTab Application (hereinafter "Application") and its associated contents are ©SCORETAB INDIA PRIVATE LIMITED (hereinafter "ScoreTab"). The Application is the property of ScoreTab and ScoreTab grants you a limited licence to access and use the Application pursuant to its Terms of Use Agreement.ScoreTab provides its users with factual and statistical information regarding the sports. Under United States law, this factual and statistical information is not copyrightable because "[t]he sine qua non of copyright is originality." Feist Pub., Inc. v. Rural Telephone Serv. Co., Inc., 499 U.S. 340, 345 (1991). Since sports scores constitute facts, they "are not original and therefore may not be copyrighted." Id at 350. This interpretation has been confirmed by numerous federal courts around the United States. See C.B.C. Distribution & Mktg., Inc. v. Major League Baseball Advanced Media, L.P., 443 F. Supp. 2d 1077, 1102-03 (E.D. Mo. 2006) aff'd, 505 F.3d 818 (8th Cir. 2007) ("Most significantly, players' names and playing records as used in CBC's fantasy games do not involve the sine qua non of copyright-originality. CBC's fantasy games use players' names and records from baseball games; CBC does not utilize the broadcasts of games themselves; CBC utilizes factual data from the underlying games."); see also Nat'l Basketball Ass'n v. Motorola, Inc., 105 F.3d 841, 846-47 (2nd Cir. 1997) ("We believe that the lack of caselaw is attributable to a general understanding that athletic events were, and are, uncopyrightable... The fact that Congress did not extend such protection to the events themselves confirms our view that the district court correctly held that appellants were not infringing a copyright in the NBA games.").Consequently, ScoreTab will not respond to copyright claims related to ScoreTab's republication of factual or statistical information and any attempts to issue a notification of infringement related to these protected areas will be met with a lawsuit pursuant to 17 U.S.C. § 512(f), which provides that "[a]ny person who knowingly materially misrepresents... that material or activity is infringing... shall be liable for any damages, including costs and attorneys' fees, incurred by the alleged infringer... who is injured by such misrepresentation...." See 17 U.S.C. § 512(f). ScoreTab will, however, respond to specific notices of copyright infringement that comply with the Digital Millennium Copyright Act. ScoreTab may expeditiously remove copyright infringing materials from its Application, regardless of its liability, upon receipt of a notice that complies with the terms of the Digital Millennium Copyright Act's § 512, located at 17 U.S.C. §512(c)(3). ScoreTab, upon removal of any materials that are alleged to be infringing, will make a good faith attempt to notify the owner or uploader of the materials so that they may respond with a counter-notification under 17 U.S.C. § 512(g)(3). If you believe that content hosted on the Application infringes upon your copyright rights, please follow the Digital Millennium Copyright Act steps outlined below: If you are a copyright owner, or the authorized agent of a copyright owner, and you believe that content hosted on the Application infringes upon your copyright rights, you may submit a notification pursuant to the Digital Millennium Copyright Act by providing our registered Copyright Agent with the following information in writing: A physical or electronic signature of a person authorized to act on behalf of the owner of an exclusive right that is allegedly infringed; '''
              ,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
               SizedBox(height: 15,),
               Text('''Identification of the copyrighted work claimed to have been infringed, or, if multiple works have been allegedly infringed, a specific list of such works and their specific location on the Application; Identification of the material that is claimed to be infringing or to be the subject of infringing activity and that is to be removed or access to which is to be disabled and information reasonably sufficient to permit ScoreTab to locate the material; Information reasonably sufficient to permit ScoreTab to contact you, such as an address, telephone number, fax number, and, if available, an email address; A statement that you have a good faith belief that the use of the material in the manner complained of is not authorized by the copyright owner, its agent, or the law; and A statement that the information in the notification is accurate, and, under penalty of perjury, that you are authorized to act on behalf of the owner of an exclusive right that is allegedly infringed. ScoreTab will maintain a designated Copyright Agent, who will receive notifications of alleged infringement. You recognize that if you fail to comply with the requirements of the Digital Millennium Copyright Act's notification requirements, your DMCA notice may not be processed. Notices of infringement may be sent to raghu@scoretab.com''' ,
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 15,),
               Text("Counter-Notification",
              style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
              SizedBox(height: 15,),
               Text('''If you believe that content has been removed from the Application in error, you may file a  counter-notification with ScoreTab's designated Copyright Agent that complies with the requirements of 17 U.S.C. § 512(g)(2) and (g)(3) outlined below. Upon receipt of a counter-notification complying with the requirements of 17 U.S.C. § 512, ScoreTab may return the allegedly infringing content to the Application.A counter-notification must include: Identification of the specific materials that have been removed from the Application; Your name, address, telephone number, and email address; A statement that, under penalty of perjury, you have a good-faith belief that the material was removed or disabled as a result of mistake or misidentification of the material; A statement that you consent to federal district court jurisdiction in the district in which your address is located or, if your address is outside of the United States, that you consent to jurisdiction in any district in which ScoreTab may be found and that you will accept service of process from the person who provided notification or their agent; and Your physical or electronic signature.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), )
            ],
          ),
        ),
      )
    );
  }
}
