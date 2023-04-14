//
// /// new try
//
//
//
//
//
//
//
// TextField(
// onChanged: (String v){
// controller.email=v;
// },
// ),
// TextField(
// onChanged: (String v){
// controller.password=v;
// print(v);
// },
// ),
// TextField(
//
//
//
//
// onChanged: (String v){
// controller.name=v;
// print(v);
// },
// ),
//
//
// SizedBox(height: 10.h,),
//
//
//
// GetBuilder<registercontroller>(
// init: registercontroller(),
// builder: (controller)=>
// ExtractedButton(onpressed: ()async{
//
// await controller.signup();
// // var ss= await controller.model?.data!.email;
// // print(ss);
//
// },
// text: 'Register',),),
// Future signup( )async {
//   try {
//     final response = await http.post(
//         Uri.parse('http://178.128.138.57/api/auth/register/user?name=$name&email=$email&password=$password&mobile=01120747447')
//         , //string is not asubtype of URI
//         // body: {
//         //   'email': email,
//         //   'password': password,
//         //   'name' : name,
//         // }
//     );
//
//     print(response.statusCode);
//     if (response.statusCode== 200) {
//        var data=jsonDecode(response.body.toString());
//        print(data);
//        print(data['token']);
//
//
//
//        await CacheHelper.saveDataToSharedPrefrence('token', data['token'])
//            .then((value)=>Get.offAll(Signupprofile(name:data['name'].toString(),email:'ddddd',mobile:'903993993', password:'fffff',)));
//        print('Created Account successfully');
//
//
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }