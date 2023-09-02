import 'package:csc_picker/csc_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:form_validation_using_bloc/bloc/event.dart';
import 'package:form_validation_using_bloc/bloc/model/form_item.dart';
import 'package:form_validation_using_bloc/bloc/state.dart';
import 'package:form_validation_using_bloc/utils/exports.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_form_field.dart';
import '../bloc.dart';

class BlocFormScreen extends StatelessWidget {
  const BlocFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation using BLoC',),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<FormBloc, AppFormState>(builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: state.formKey,
            child: Column(
              children: [
                CustomFormField(
                  hintText: 'Name',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z]+|\s"),
                    )
                  ],
                  onChange: (val) {
                    BlocProvider.of<FormBloc>(context)
                        .add(NameChanged(name: BlocFormItem(value: val!)));
                  },
                  validator: (val) {
                    return state.name.error;
                  },
                ),
                CustomFormField(
                  hintText: 'Email',
                  onChange: (val) {
                    BlocProvider.of<FormBloc>(context)
                        .add(EmailChanged(email: BlocFormItem(value: val!)));
                  },
                  validator: (val) {
                    return state.email.error;
                  },
                ),
                CustomFormField(

                  hintText: 'Phone',
                  onChange: (val) {
                    BlocProvider.of<FormBloc>(context)
                        .add(PhoneChanged(phone: BlocFormItem(value: val!)));
                  },
                  validator: (val) {
                    return state.phone.error;
                  },
                ),

                CSCPicker(
                  layout: Layout.vertical,
                  flagState: CountryFlag.DISABLE,
                  onCountryChanged: (country){},
                  onStateChanged: (state){},
                  onCityChanged: (city){},
                  countryDropdownLabel: "*Country",
                  stateDropdownLabel: "*State",
                  cityDropdownLabel: "*City",
                ),

                const SizedBox(height: 30),
                Row(

                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(

                      onPressed: () {
                        BlocProvider.of<FormBloc>(context)
                            .add(const FormSubmitEvent());
                      },
                      child: const Text('SUBMIT'),

                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<FormBloc>(context)
                            .add(const FormResetEvent());
                      },
                      child: const Text('RESET'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}