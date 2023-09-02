import 'package:csc_picker/csc_picker.dart';
import 'package:form_validation_using_bloc/utils/exports.dart';

import '../widgets/custom_form_field.dart';
import 'form_notifier.dart';

class FormPageProvider extends StatelessWidget {
  const FormPageProvider({super.key});
  @override
  Widget build(BuildContext context) {
    final state = context.watch<FormNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: Text(state.title.hintText),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: state.formKey,
          child: Column(
            children: [
              CustomFormField(
                hintText: state.name.hintText,
                inputFormatters: state.name.formatters,
                validator: (val) {
                  return state.validateName(val);
                },
              ),
              CustomFormField(
                hintText: state.email.hintText,
                validator: (val) => state.validateEmail(val),
              ),
              CustomFormField(
                hintText: state.phone.hintText,
                validator: (val) => state.validPhone(val),
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
                children: [
                  ElevatedButton(
                    onPressed: () {
                      state.validateForm();
                    },
                    child: Text(state.submit.hintText),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      state.resetForm();
                    },
                    child: Text(state.reset.hintText),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}