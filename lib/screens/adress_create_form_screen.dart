import 'package:flutter/material.dart';

class AddressCreateForm extends StatefulWidget {
  final Map<String, String>? data;
  final bool update;
  final Function? onSuccess;

  const AddressCreateForm({super.key, 
    this.data,
    this.update = false,
    this.onSuccess,
  });

  @override
  _AddressCreateFormState createState() => _AddressCreateFormState();
}

class _AddressCreateFormState extends State<AddressCreateForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController houseNoController;
  late TextEditingController areaController;
  late TextEditingController landmarkController;
  late TextEditingController cityController;
  late TextEditingController stateController;
  late TextEditingController pincodeController;

  String message = '';
  bool isSuccess = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.data?['name'] ?? '');
    phoneController = TextEditingController(text: widget.data?['phone'] ?? '');
    houseNoController = TextEditingController(text: widget.data?['house_no'] ?? '');
    areaController = TextEditingController(text: widget.data?['area'] ?? '');
    landmarkController = TextEditingController(text: widget.data?['landmark'] ?? '');
    cityController = TextEditingController(text: widget.data?['city'] ?? '');
    stateController = TextEditingController(text: widget.data?['state'] ?? '');
    pincodeController = TextEditingController(text: widget.data?['pincode'] ?? '');
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    houseNoController.dispose();
    areaController.dispose();
    landmarkController.dispose();
    cityController.dispose();
    stateController.dispose();
    pincodeController.dispose();
    super.dispose();
  }

  void submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      isLoading = true;
      message = '';
    });

    final formData = {
      'name': nameController.text.trim(),
      'phone': phoneController.text.trim(),
      'house_no': houseNoController.text.trim(),
      'area': areaController.text.trim(),
      'landmark': landmarkController.text.trim(),
      'city': cityController.text.trim(),
      'state': stateController.text.trim(),
      'pincode': pincodeController.text.trim(),
    };

    try {
      // TODO: Implement API call with formData (POST for create, PUT for update)
      // For demonstration, simulate delay
      await Future.delayed(Duration(seconds: 2));

      setState(() {
        isSuccess = true;
        message = widget.update ? 'Address Updated Successfully' : 'Address Created Successfully';
        isLoading = false;
      });
      if (widget.onSuccess != null) {
        widget.onSuccess!();
      }
      if (!widget.update) {
        _formKey.currentState?.reset();
      }
    } catch (error) {
      setState(() {
        isSuccess = false;
        message = 'Failed to ${widget.update ? 'update' : 'create'} address';
        isLoading = false;
      });
    }
  }

  String? validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  String? validatePincode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pincode is required';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Pincode must be a number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              widget.update ? 'Update Address' : 'Create Address',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) => validateNotEmpty(value, 'Name'),
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
              validator: (value) => validateNotEmpty(value, 'Phone'),
            ),
            TextFormField(
              controller: houseNoController,
              decoration: InputDecoration(labelText: 'Flat, House no., Building, Company, Apartment'),
              validator: (value) => validateNotEmpty(value, 'House Number'),
            ),
            TextFormField(
              controller: areaController,
              decoration: InputDecoration(labelText: 'Area, Street, Sector, Village'),
              validator: (value) => validateNotEmpty(value, 'Area'),
            ),
            TextFormField(
              controller: landmarkController,
              decoration: InputDecoration(labelText: 'Landmark'),
              validator: (value) => validateNotEmpty(value, 'Landmark'),
            ),
            TextFormField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'City'),
              validator: (value) => validateNotEmpty(value, 'City'),
            ),
            TextFormField(
              controller: stateController,
              decoration: InputDecoration(labelText: 'State'),
              validator: (value) => validateNotEmpty(value, 'State'),
            ),
            TextFormField(
              controller: pincodeController,
              decoration: InputDecoration(labelText: 'Pincode'),
              keyboardType: TextInputType.number,
              validator: validatePincode,
            ),
            SizedBox(height: 12),
            if (message.isNotEmpty)
              Container(
                padding: EdgeInsets.all(8),
                color: isSuccess ? Colors.green[300] : Colors.red[300],
                child: Text(
                  message,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: isLoading ? null : submitForm,
              child: isLoading
                  ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                  : Text(widget.update ? 'Update Address' : 'Add Address'),
            )
          ],
        ),
      ),
    );
  }
}
