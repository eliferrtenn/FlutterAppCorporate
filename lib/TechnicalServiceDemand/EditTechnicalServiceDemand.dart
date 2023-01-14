// ignore_for_file: prefer_const_constructors, duplicate_ignore, file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pro_tekno1/Services/TechnicServiceDemandServices/TechnicServiceDemandService.dart';
import 'package:pro_tekno1/TechnicalServiceDemand/HomeTechnicalServiceDemand.dart';
import 'package:pro_tekno1/constants/constants.dart';
import 'package:pro_tekno1/models/RequestModels/TechnicalServiceDemandRequests/EditTechnicalServiceDemandRequest.dart';
import 'package:pro_tekno1/models/ResponseModels/TechnicalServiceDemandResponses/GetTechnicalServiceDemandResponse.dart';

import '../constants/generalToken.dart';
String demandTypeText='Elektrik Arızası';
String urgencyStatusText="Acil";



class EditTechnicalServiceDemandPage extends StatefulWidget {
  int id;
  EditTechnicalServiceDemandPage({super.key,required this.id});

  @override
  State<EditTechnicalServiceDemandPage> createState() =>
      _EditTechnicalServiceDemandPageState();
}

class _EditTechnicalServiceDemandPageState
    extends State<EditTechnicalServiceDemandPage> {
  GeneralToken generalToken = GeneralToken();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final siteNameController = TextEditingController();
  final apartmantNameController = TextEditingController();
  final apartmantFloorController = TextEditingController();
  final apartmantNoController = TextEditingController();
  final contactInformController = TextEditingController();

  @override
  void initState() {
         TechnicServiceDemandService.GetTechnicDemandService(widget.id).then((response) {
      setState(() {
             GetTechnicalServiceDemandResponse model=response;
             titleController.text=model.data!.title.toString();
             descriptionController.text=model.data!.description.toString();
             siteNameController.text=model.data!.siteName.toString();
             apartmantNameController.text=model.data!.apartmentName.toString();
             apartmantFloorController.text=model.data!.apartmentFloor.toString();
             apartmantNoController.text=model.data!.apartmentNo.toString();
             contactInformController.text=model.data!.contactInform.toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var items = [
      'Elektrik Arızası',
      'Su Arızası',
      'Mobilya',
      'Diğer',
    ];
    var urgencyStatus = [
      'Acil',
      'Çok Acil',
      'Acil Değl',
    ];
    final double loginHeight = (MediaQuery.of(context).size.height / 14);
    final double inputWidth = (MediaQuery.of(context).size.width / 2) * 1.7;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: loginHeight / 2,
          ),
          Row(
            children: [
              TextButton(
                  style: ButtonStyle(alignment: Alignment(0, -1)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          opaque: true,
                          type: PageTransitionType.leftToRight,
                          alignment: Alignment.bottomCenter,
                          duration: Constants.pageDuration,
                          child: HomeTechnicalServicePage(resultMesssage:"",),
                          isIos: true,
                        ));
                  },
                  child: Icon(Icons.arrow_back_ios_new_rounded,
                      size: 20, color: Color.fromARGB(255, 253, 148, 0)))
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: loginHeight / 2,
              ),
              Container(
                width: inputWidth,
                decoration:BoxDecoration(
                     border: Border.all(color: Colors.grey,width: 2),
                     borderRadius:BorderRadius.all(Radius.circular(25)),
                ),
                child: Center(
                  child: DropdownButton(
                    value: demandTypeText,
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        demandTypeText=newValue!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: loginHeight / 3,
              ),
              Container(
                width: inputWidth,
                decoration:BoxDecoration(
                     border: Border.all(color: Colors.grey,width: 2),
                     borderRadius:BorderRadius.all(Radius.circular(25)),
                ),
                child: Center(
                  child: DropdownButton(
                    value: urgencyStatusText,
                    items: urgencyStatus.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        urgencyStatusText=newValue!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: loginHeight / 3,
              ),
              SizedBox(
                width: inputWidth,
                child: TextFormField(
                  key: formKey,
                  controller: titleController,
                  style: Constants.formFieldStyleCreate,
                  decoration: InputDecoration(
                    contentPadding: Constants.inputcontentPadding,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 201, 201, 201),
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.transparent,
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 92, 92, 92),
                    ),
                    labelText: 'Başlık',
                    hintText: 'Başlık',
                    border: Constants.generalInputBorder,
                    focusedBorder: Constants.generalInputBorder,
                    enabledBorder: Constants.generalInputBorder,
                    errorBorder: Constants.generalInputBorder,
                    disabledBorder: Constants.generalInputBorder,
                    errorStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              SizedBox(
                height: loginHeight / 3,
              ),
              SizedBox(
                width: inputWidth,
                child: TextFormField(
                  maxLines: 8, 
                  controller: descriptionController,
                  style: Constants.formFieldStyleCreate,
                  decoration: InputDecoration(
                    contentPadding: Constants.inputcontentPadding,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 201, 201, 201),
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.transparent,
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 92, 92, 92),
                    ),
                    labelText: 'Açıklama',
                    hintText: 'Açıklama',
                    border: Constants.generalInputBorder,
                    focusedBorder: Constants.generalInputBorder,
                    enabledBorder: Constants.generalInputBorder,
                    errorBorder: Constants.generalInputBorder,
                    disabledBorder: Constants.generalInputBorder,
                    errorStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
              SizedBox(
                height: loginHeight / 3,
              ),
           
              SizedBox(
                width: inputWidth,
                child: TextFormField(
                  controller: siteNameController,
                  style: Constants.formFieldStyleCreate,
                  decoration: InputDecoration(
                    contentPadding: Constants.inputcontentPadding,
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Color.fromARGB(255, 201, 201, 201),
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.transparent,
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 92, 92, 92),
                    ),
                    labelText: 'Site Adı',
                    hintText: 'Site Adı',
                    border: Constants.generalInputBorder,
                    focusedBorder: Constants.generalInputBorder,
                    enabledBorder: Constants.generalInputBorder,
                    errorBorder: Constants.generalInputBorder,
                    disabledBorder: Constants.generalInputBorder,
                    errorStyle: TextStyle(color: Color.fromARGB(255, 72, 71, 71)),
                  ),
                ),
              ),
              SizedBox(
                height: loginHeight/3,
              ),                  
              SizedBox(
                width: inputWidth,
                child: TextFormField(
                  controller: apartmantNameController,
                  style: Constants.formFieldStyleCreate,
                  decoration: InputDecoration(
                    contentPadding: Constants.inputcontentPadding,
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Color.fromARGB(255, 201, 201, 201),
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.transparent,
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 92, 92, 92),
                    ),
                    labelText: 'Apartman Adı/No',
                    hintText: 'Apartman Adı/No',
                    border: Constants.generalInputBorder,
                    focusedBorder: Constants.generalInputBorder,
                    enabledBorder: Constants.generalInputBorder,
                    errorBorder: Constants.generalInputBorder,
                    disabledBorder: Constants.generalInputBorder,
                    errorStyle: TextStyle(color: Color.fromARGB(255, 72, 71, 71)),
                  ),
                ),
              ),
              SizedBox(
                height: loginHeight/3,
              ),
                       
              SizedBox(
                width: inputWidth,
                child: TextFormField(
                  controller: apartmantFloorController,
                  style: Constants.formFieldStyleCreate,
                  decoration: InputDecoration(
                    contentPadding: Constants.inputcontentPadding,
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Color.fromARGB(255, 201, 201, 201),
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.transparent,
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 92, 92, 92),
                    ),
                    labelText: 'Kat',
                    hintText: 'Kat',
                    border: Constants.generalInputBorder,
                    focusedBorder: Constants.generalInputBorder,
                    enabledBorder: Constants.generalInputBorder,
                    errorBorder: Constants.generalInputBorder,
                    disabledBorder: Constants.generalInputBorder,
                    errorStyle: TextStyle(color: Color.fromARGB(255, 72, 71, 71)),
                  ),
                ),
              ),
              SizedBox(
                height: loginHeight/3,
              ),                     
              SizedBox(
                width: inputWidth,
                child: TextFormField(
                  controller: apartmantNoController,
                  style: Constants.formFieldStyleCreate,
                  decoration: InputDecoration(
                    contentPadding: Constants.inputcontentPadding,
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Color.fromARGB(255, 201, 201, 201),
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.transparent,
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 92, 92, 92),
                    ),
                    labelText: 'Daire Ad/No',
                    hintText: 'Daire Ad/No',
                    border: Constants.generalInputBorder,
                    focusedBorder: Constants.generalInputBorder,
                    enabledBorder: Constants.generalInputBorder,
                    errorBorder: Constants.generalInputBorder,
                    disabledBorder: Constants.generalInputBorder,
                    errorStyle: TextStyle(color: Color.fromARGB(255, 72, 71, 71)),
                  ),
                ),
              ),
              SizedBox(
                height: loginHeight/3,
              ),
                                   
              SizedBox(
                width: inputWidth,
                child: TextFormField(
                  maxLines:4,
                  controller: contactInformController,
                  style: Constants.formFieldStyleCreate,
                  decoration: InputDecoration(
                    contentPadding: Constants.inputcontentPadding,
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Color.fromARGB(255, 201, 201, 201),
                    ),
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.transparent,
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 92, 92, 92),
                    ),
                    labelText: 'İletişim Bilgileri',
                    hintText: 'İletişim Bilgileri',
                    border: Constants.generalInputBorder,
                    focusedBorder: Constants.generalInputBorder,
                    enabledBorder: Constants.generalInputBorder,
                    errorBorder: Constants.generalInputBorder,
                    disabledBorder: Constants.generalInputBorder,
                    errorStyle: TextStyle(color: Color.fromARGB(255, 72, 71, 71)),
                  ),
                ),
              ),
              SizedBox(
                height: loginHeight/3,
              ),
              Container(
                width: (MediaQuery.of(context).size.width / 2) * 1.3,
                height: loginHeight,
                decoration: Constants.buttonDecoration,
                child: ElevatedButton(
                  style: Constants.raisedButtonStyle,
                  onPressed: loginVerifySubmit,
                  child: Text('Kaydet', style: Constants.buttonStyle),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  void loginVerifySubmit() async {
    EditTechnicalServiceDemandRequest? request =
        EditTechnicalServiceDemandRequest();
    request.id=widget.id;
    request.demandType = demandTypeText;
    request.demandUrgencyStatus = urgencyStatusText;
    request.title = titleController.text;
    request.description = descriptionController.text;
    request.siteName = siteNameController.text;
    request.apartmentName = apartmantNameController.text;
    request.apartmentFloor = apartmantFloorController.text;
    request.apartmentNo = apartmantNameController.text;
    request.contactInform = contactInformController.text;

    var loginResponse = TechnicServiceDemandService.EditTechnicalServiceDemand(request);

    loginResponse.then((data) {
      if (data.isSuccess == true) {
        Navigator.push(
            context,
            PageTransition(
              opaque: true,
              isIos: true,
              type: PageTransitionType.leftToRight,
              alignment: Alignment.bottomCenter,
              duration: Constants.pageDuration,
              child: HomeTechnicalServicePage(resultMesssage: data.message.toString(),),
            ));
      } else if (data.isSuccess == false) {
        return 'Güncellenemedi lütfen tekrar deneyin';
      }
    });
  }



}
