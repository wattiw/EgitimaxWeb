import 'package:egitimax/models/common/userData.dart';
import 'package:egitimax/repositories/appRepository.dart';
import 'package:egitimax/utils/constant/appConstants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? username = Provider.of<UserData>(context).username;
    BigInt? userId = Provider.of<UserData>(context).userId;
    TextEditingController? userNameContoller=TextEditingController(text: 'info@egitimax.com');
    TextEditingController? userPasswordContoller=TextEditingController(text: 'password');
    return Center(
      child: Column(
        children: [
          TextField(
            controller: userNameContoller,
            decoration: InputDecoration(
              constraints: const BoxConstraints(
                  maxHeight: 50,
                  maxWidth: 250),
              suffixIcon: IconButton(
                tooltip: 'Clear',
                icon: Icon(
                  Icons.clear,
                  size: Theme.of(context).iconTheme.size,
                  color:
                  Theme.of(context).iconTheme.color,
                ),
                onPressed:(){
                  userNameContoller.text='';
                },
              ),
              alignLabelWithHint: true,
              filled: true,
              fillColor: Colors.transparent,
              labelText: 'User Name',
              labelStyle:
              Theme.of(context).textTheme.titleMedium,
              hintText: 'Type Username',
              hintStyle:
              Theme.of(context).textTheme.bodySmall,
              contentPadding: const EdgeInsets.all(8),
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
                gapPadding: 4, // Reduced gap padding
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
                gapPadding: 4,
              ),
            ),
            onEditingComplete: () {

            },
            onChanged: (value) {

            },
            onSubmitted: (value) {

            },
          ),
          const SizedBox(height: 5,),
          TextField(
            obscureText: true,
            controller: userPasswordContoller,
            decoration: InputDecoration(
              constraints: const BoxConstraints(
                  maxHeight: 50,
                  maxWidth: 250),
              suffixIcon: IconButton(
                tooltip: 'Clear',
                icon: Icon(
                  Icons.clear,
                  size: Theme.of(context).iconTheme.size,
                  color:
                  Theme.of(context).iconTheme.color,
                ),
                onPressed:(){
                  userPasswordContoller.text='';
                },
              ),
              alignLabelWithHint: true,
              filled: true,
              fillColor: Colors.transparent,
              labelText: 'User Password',
              labelStyle:
              Theme.of(context).textTheme.titleMedium,
              hintText: 'Type User Password',
              hintStyle:
              Theme.of(context).textTheme.bodySmall,
              contentPadding: const EdgeInsets.all(8),
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
                gapPadding: 4, // Reduced gap padding
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
                gapPadding: 4,
              ),
            ),
            onEditingComplete: () {

            },
            onChanged: (value) {

            },
            onSubmitted: (value) {

            },
          ),
          const SizedBox(height: 5,),
          Text('User: ${username??AppConstants.loggedInUserName}',style: const TextStyle(fontSize: 14),),
          const SizedBox(height: 5,),
          Text('UserId: ${userId??AppConstants.loggedInUserId}',style: const TextStyle(fontSize: 14),),
          const SizedBox(height: 5,),
          ElevatedButton(
            onPressed: () async {
              await getUserData(userNameContoller, userPasswordContoller);
              Provider.of<UserData>(context, listen: false).setUsernameAndId(AppConstants.loggedInUserName,BigInt.parse(AppConstants.loggedInUserId.toString()));
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  Future<void> getUserData(TextEditingController userNameContoller, TextEditingController userPasswordContoller) async {
       AppRepository appRepository=AppRepository();

    var user =await appRepository.getUser(userNameContoller.text,BigInt.zero);

    if(user!=null && user!.tblUserMain!=null &&  user!.tblUserMain!.userPassword==userPasswordContoller.text)
      {
        AppConstants.loggedInUserName='${user!.tblUserMain!.name??''} ${user!.tblUserMain!.surname??''} ';
        AppConstants.loggedInUserId=user!.tblUserMain!.id;
      }
  }
}
