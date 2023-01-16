import 'package:flutter/material.dart';

class Tnc extends StatelessWidget {
  const Tnc({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Terms of Use"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
             crossAxisAlignment:CrossAxisAlignment.start ,
            children: const [
              SizedBox(height: 10,),
                Text('''This Terms of Use govern your use of the website, Materials, Your Content and the services offered through ScoreTab. For the purpose of these Terms of Use, wherever the context so require "you" or "your" or "user" shall mean any natural or legal person who has agreed to become a member of the Site by registering on the Site as registered user or browses the Site. Your access or use of the Site is subject to the terms and conditions of use as set out here (Terms of Use) and the Privacy Policy made available.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 15,),
               Text('''Please note that by accessing or using the Site you agree to be bound by the Terms of Use and the Terms of Use is a legally binding agreement between you and us SCORETAB INDIA PRIVATE LIMITED, the owner of the Site ("Company").''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 15,),
               Text("USER REGISTRATION",
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
                SizedBox(height: 15,),
              Text('''You may use the Site without registration however, to participate in certain activities of the Site you may be required to create an account or you can login through your Facebook account or any other third party service account permitted by the Site. In the event you wish to create an account with us you may do so by completing the registration process. You agree to a) provide true, accurate, correct and complete information as prompted by the applicable registration form b) maintain and update true, accurate, correct and complete information provided by you during the registration process. You may be required to choose a password and user name. You are solely responsible for maintaining the confidentiality of your password and account.''',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
               SizedBox(height: 15,),
               Text('''If at any time Company believes that your account and password is being misused in any manner, or that the information provided by you during the registration process is not true, inaccurate or incomplete the Company reserves the right to cancel your account and block your access to Site.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
                SizedBox(height: 15,),
               Text('''You are entirely responsible for any and all activities that occur under your account. You agree to notify the Company of any unauthorised use of your account or any breach of security. Company will not be liable for any loss that you may incur as a result of someone else using your password or account or your failure to comply with this section.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
                SizedBox(height: 15,),
               Text('''By registering for an account with us you give us permission to send you mailers on different promotions, deals or offers running on the platform and content published or upcoming including but not limited to articles and videos. From the said mailers you can at any time unsubscribe and opt out of receiving such mails after which you will not be sent such mailers.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
                 SizedBox(height: 15,),
               Text("USE OF THE SITE",
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
                SizedBox(height: 15,),
               Text('''All materials provided on this site, including but not limited to all information, materials, functions text, logos, designs, graphics, images, sounds, software, documents, products and services (collectively, the "Materials"), and the selection, arrangement and display thereof, are the copyrighted works of the Company/or its vendors or suppliers. All Materials herein and all Company software are proprietary to Company and protected by worldwide copyright and other intellectual property laws. Except as stated herein, none of the Materials may be modified, copied, reproduced, distributed, republished, downloaded, displayed, sold, compiled, posted or transmitted in any form or by any means, including but not limited to, electronic, mechanical, photocopying, recording or other means, without the prior express written permission of the Company.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
                SizedBox(height: 15,),
               Text('''Company hereby grants you the right to access and use the Site only for your personal and non-commercial use. You may not use the Site for commercial purposes or in any way that is unlawful, or harms us or any other person or entity, as determined in our sole discretion.You may post/share links/images/text content on the site on social platforms like Facebook, Twitter, Google+, Pinterest, with appropriate link-back to the original source''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
                SizedBox(height: 15,),
               Text('''When the Site provides for the download of particular Material including a software, you may download such Material or software to a computer or mobile device (as applicable) for your personal, non-commercial use only, provided that you (a) keep intact all copyright and other proprietary notices, (b) make no modifications to, and do not rent, lease, loan, sell, distribute, copy (except to create a single copy for your own back-up purposes), or create any derivative works based on the Site or the Material including the software, in whole or in part, and (c) transfer any Material or software or any part thereof to any other computer or mobile device. Any commercial or business use of the Site or any Material including the Software is expressly prohibited.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
                SizedBox(height: 15,),
               Text('''Except as expressly provided above, nothing contained herein shall be construed as conferring, by implication, estoppel or otherwise, any license or right under any patent, trademark or copyright of the Company.You acknowledge and agree that nothing in these terms of use shall have the effect of transferring the ownership of any copyrights, trademarks, service marks, trade names or other proprietary rights in the Site or Material or any part thereof to you or any third party.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
               SizedBox(height: 15,),
               Text("PROHIBITED USE",
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
              SizedBox(height: 15,),
               Text('''As a condition of your use of the Site, you will not use the Site for any purpose that is unlawful or prohibited by these Terms of Use or by any domestic or international laws, statutes, ordinances and regulations. Your use of site is your sole responsibility.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 15,),
               Text('''You shall not, display, upload, modify, publish, transmit, update or share any information on the Site, that - ''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 10,),
               Text('\u2022 belongs to another person and to which the user does not have any right;', 
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
               SizedBox(height: 10,),
               Text('\u2022 is defamatory, obscene, pornographic, paedophilic, invasive of another’s privacy, including bodily privacy, insulting or harassing on the basis of gender, libellous, racially or ethnically objectionable, relating or encouraging money laundering or gambling, or otherwise inconsistent with or contrary to the laws in force;', 
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
               SizedBox(height: 10,),
               Text('\u2022 is harmful to child;', 
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
               SizedBox(height: 10,),
               Text('\u2022 infringes any patent, trademark, copyright or other proprietary rights;', 
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
               SizedBox(height: 10,),
               Text('\u2022 violates any law for the time being in force;', 
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
               SizedBox(height: 10,),
               Text('\u2022 deceives or misleads the addressee about the origin of the message or knowingly and intentionally communicates any information which is patently false or misleading in nature but may reasonably be perceived as a fact;', 
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
               SizedBox(height: 10,),
               Text('\u2022 impersonates another person;', 
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
               SizedBox(height: 10,),
               Text('\u2022 threatens the unity, integrity, defence, security or sovereignty of India, friendly relations with foreign States, or public order, or causes incitement to the commission of any cognisable offence or prevents investigation of any offence or is insulting other nation;', 
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
               SizedBox(height: 10,),
               Text('\u2022 contains software virus or any other computer code, file or program designed to interrupt, destroy or limit the functionality of any computer resource;', 
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
               SizedBox(height: 10,),
               Text('\u2022 is patently false and untrue, and is written or published in any form, with the intent to mislead or harass a person, entity or agency for financial gain or to cause any injury to any person', 
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 15,),
               Text("USE OF PUBLIC FORUM",
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
              SizedBox(height: 15,),
               Text('''Certain sections or pages of the Site contain a provision hereinafter referred to as ("Public Forum") for the users to post or upload comments, feedback, data, links, videos, audios, graphics, images, messages and other material ("User Content"). Through the Public Forum you can communicate with other users of the Site''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 15,),
               Text('''You are entirely responsible for all the User Content that you upload, post, email, transmit or otherwise make available on the Public Forum. You understand that such User Content can be viewed by other users of the Site and therefore you shall exercise due care to ensure that such User Content does not offend or abuse other users of the Site. Company does not control the User Content posted on the Public Forum and, as such, does not guarantee the accuracy, integrity or quality of such User Content. You understand that by using the Site, you may be exposed to User Content that is offensive, indecent or objectionable. Under no circumstances will Company be liable in any way for any User Content, including, but not limited to, for any errors or omissions in any User Content, or for any loss or damage of any kind incurred as a result of the use of any User Content posted, emailed, transmitted or otherwise made available on the Site.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 15,),
               Text('''When you post or upload Your Content on the Site, you grant Company (and its licensees, distributors, agents, representatives and other authorised users), the rights a perpetual, royalty-free, non-exclusive, and irrevocable right and license to reproduce, prepare derivative works based upon, distribute, perform or display such User Content, in whole or in part, in any form, media or technology known or hereafter developed.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 15,),
               Text('''User Content posted by you shall be subject to relevant laws and may be disabled, or and may be subject to investigation under appropriate laws. You agree that the Company may disclose or preserve User Content if required to do so by law or in the good faith belief that such preservation or disclosure is reasonably necessary to: (a) comply with legal process; (b) respond to claims that any User Content violates the rights of third-parties; or (c) protect the rights, property, or personal safety of the Company and the public. Furthermore, if you are found to be in non-compliance with the laws and regulations, these Terms of Use, or the Privacy Policy of the Site, we may terminate your account/block your access to the Site and we reserve the right to remove any of User Content that is non-compliant with these Terms of Use.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 15,),
               Text('''You agree that Company has no liability or responsibility for the storage or deletion of any User Content and reserves the right to change its general practices and limits at any time in its sole discretion, with or without notice.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
             SizedBox(height: 15,),
               Text("COPYRIGHT AND TRADEMARKS",
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
              SizedBox(height: 15,),
               Text('''Unless otherwise stated, copyright and all intellectual property rights in all Materials on the Site (including but not limited to text, audio, video or graphical images, or technology, the look and feel of the Site), trademarks and logos appearing on this Site are the property of the Company and are owned and controlled by us or by other parties that have licensed their material to us. Materials on the Site are solely for your personal, non-commercial use. You must not copy, reproduce, republish, upload, post, transmit or distribute such material in any way, including by e-mail or other electronic means and whether directly or indirectly and you must not assist any other person to do so. Without the prior written consent of the owner, modification of the Materials, use of the Materials on any other web site or networked computer environment or use of the Materials for any purpose other than personal, non-commercial use is a violation of the copyrights, trademarks and other proprietary rights, and is prohibited. Any use for which you receive any remuneration, whether in money or otherwise, is a commercial use for the purposes of this clause. You agree not to use any framing techniques to enclose any trademark or logo or other proprietary information of Company or remove, conceal or obliterate any copyright or other proprietary notice or any credit-line or date-line on other mark or source identifier included on the Site, including without limitation, the size, colour, location or style of all proprietary marks. Any infringement shall be vigorously defended and pursued to the fullest extent permitted by law.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
               SizedBox(height: 15,),
               Text("DISCLAIMER",
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
              SizedBox(height: 15,),
               Text('''The Site, all the Materials and products (including but not limited to software) and any services, included on or otherwise made available to you through this Site are gathered from a variety of sources and are intended solely as general information and provided on "as is" and "as available" basis without any representation or warranties, express or implied except otherwise specified in writing. They do not constitute advice and should not be relied upon in making (or refraining from making) any decision. Any specific advice or replies to queries in any part of the Site is/are the personal opinion of such experts/consultants/persons and does not constitute or indicate our endorsement, representation or warranty of such information and are not subscribed to by this Site. Without prejudice to the forgoing paragraph, Company does not warrant that:''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 10,),
               Text('\u2022 The Site will be constantly available, or available at all; or', 
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 10,),
               Text('\u2022 The information on the Site is complete, legal, true, accurate or non-misleading.', 
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 15,),
               Text("LINKS",
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
              SizedBox(height: 15,),
               Text('''Company may establish on the Site a hypertext link to a third party website from time to time. Such link is provided for information and convenience of the users and does not state or imply any sponsorship or endorsement of third party website by Company. Company has no control over such third party website and your use of such third party website or any offsite dealings with such third parties is at your own risk.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 15,),
               Text("USE OF GOOGLE ANALYTICS",
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
              SizedBox(height: 15,),
               Text('''The Site uses Google Analytics, a web analytics service provided by Google, Inc. ("Google"). Google Analytics uses "cookies", which are text files placed on your computer, to help the website analyse how users use the site. The information generated by the cookie about your use of the Site (including your IP address) will be transmitted to and stored by Google. Google will use this information for the purpose of evaluating your use of the Site, compiling reports on website activity for website operators and providing other services relating to website activity and Internet usage. Google may also transfer this information to third parties where required to do so by law, or where such third parties process the information on Google's behalf. By using this website, you consent to the processing of data about you by Google in the manner and for the purposes set out above.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
               SizedBox(height: 15,),
               Text("ADVERTISING MATERIAL",
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
              SizedBox(height: 15,),
               Text('''Some part of the Site may contain advertising information or promotion material or other material submitted to Company by third parties. Responsibility for ensuring that the material submitted for inclusion on Site complies with applicable law is exclusively on the party providing the information/material. Your correspondence or business dealings with, or participation in promotions of advertisers or including payment and delivery of related goods or services, and any other terms, conditions, warranties or representations associated with such dealings, are solely between You and such advertiser. Company will not be responsible or liable for any claim, error, omission, inaccuracy in advertising material or any loss or damage of any sort incurred as the result of any such dealings or as the result of the presence of such advertisers on the Site. Company reserves the right to omit, suspend or change the position of any advertising material submitted for insertion.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
               SizedBox(height: 15,),
               Text("INTERNATIONAL USE",
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
              SizedBox(height: 15,),
               Text('''This Site is controlled and operated from within India. Company makes no representation that the Site is appropriate or available in locations outside of India. Those who choose to access the Site from other locations do so at their own risk and are responsible for compliance with applicable laws.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
                SizedBox(height: 15,),
               Text("LIMITATION OF LIABILITY",
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
              SizedBox(height: 15,),
               Text('''YOU AGREE THAT COMPANY SHALL NOT BE LIABLE FOR ANY DIRECT, SPECIAL, INCIDENTAL, INDIRECT OR CONSEQUENTIAL DAMAGES OF ANY KIND IN CONNECTION WITH THIS AGREEMENT OR YOUR USE OF SITE, EVEN IF COMPANY HAS BEEN INFORMED IN ADVANCE OF THE POSSIBILITY OF SUCH DAMAGES.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
                SizedBox(height: 15,),
               Text("INDEMNITY",
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
              SizedBox(height: 15,),
               Text('''You agree to indemnify, defend and hold Company, its officers, directors, employees, affiliates or representatives harmless from any claim or action (including legal expenses) arising out your use of the Site, your breach of the Terms of Use and violation of any third party intellectual property rights or privacy.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 15,),
               Text("APPLICABLE LAW",
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
              SizedBox(height: 15,),
               Text('''This Agreement shall be governed by and interpreted and construed in accordance with the laws of India. The place of jurisdiction shall be exclusively in Bangalore. Notwithstanding the foregoing, we reserve the right to pursue any action or claim against you in any court of competent jurisdiction which we believe is the most appropriate to seek any relief.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 15,),
               Text("ENTIRE AGREEMENT",
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
              SizedBox(height: 15,),
               Text('''The Terms of Use and Privacy Policy, as amended from time to time, constitute the entire agreement between you and Company. If any provision of these Terms of use is considered unlawful, void, or for any reason unenforceable, then that provision shall be deemed severable from these Terms of Use and shall not affect the validity and enforceability of any remaining provisions.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 15,),
               Text("CHANGES OF TERMS OF USE",
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
              SizedBox(height: 15,),
               Text('''We reserve the right, to modify these Terms of Use at any time. Any changes to Terms of Use will be posted on the Site and your continued use of the Site following a posting of changes is your agreement to the changes and you are bound by the then-current version of these Terms of Use. If any changes to these Terms of Use are unacceptable to you, you must discontinue use of the Site. We reserve the right to suspend or deny, in our sole discretion, your access to all or any portion of the Site, including for any violation of any provision of these Terms of Use. We also reserve the right to change the Site without notice to you, at any time.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 15,),
               Text("RELATIONSHIP",
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
              SizedBox(height: 15,),
               Text('''None of the provisions of the Terms of Use shall be deemed to constitute a partnership or agency between you and Company and you shall have no authority to bind Company in any manner, whatsoever. If you are registering on the Site as a business entity, you represent that you have the authority to bind the entity to this Agreement.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
              SizedBox(height: 15,),
               Text("TERMINATION",
                style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500), ),
              SizedBox(height: 15,),
               Text('''We reserve the right, at our discretion, to immediately, with or without notice, suspend or terminate your registration, the Terms of Use, and/or your access to all or a portion of the Site and/or remove any registration information or User Content from the Site, for any reason. Upon termination or expiration of the Terms of Use, your obligations and Company's rights and disclaimers survive, but your right to use the Site immediately ceases. Any express waiver or failure to exercise promptly any right under the Terms of Use will not create a continuing waiver or any expectation of non-enforcement.''',
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
            
            ],
          ),
        ),
      )
    );
  }
 }



