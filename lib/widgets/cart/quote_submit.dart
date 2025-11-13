import 'package:bhf_mobile_app/common/config.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:dio/dio.dart';

class QuoteSubmit extends StatefulWidget {
  const QuoteSubmit({
    super.key,
    required this.quoteArray,
    required this.onClose,
  });

  final List<int> quoteArray;
  final VoidCallback onClose;

  @override
  State<QuoteSubmit> createState() => _QuoteSubmitState();
}

class _QuoteSubmitState extends State<QuoteSubmit> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  String? _errorMessage;
  List<Map<String, String>> addressList = [
    {'key': 'Select Address', 'value': ''},
  ];
  String? selectedAddressId;
  final List<Map<String, String>> constructionTypes = [
    {'key': 'Select Construction Type', 'value': ''},
    {'key': 'Residential', 'value': 'Residential'},
    {'key': 'Commercial', 'value': 'Commercial'},
  ];

  @override
  void initState() {
    super.initState();
    _loadAddresses();
  }

  Future<void> _loadAddresses() async {
    try {
      var dio = Dio();
      var token = AppConstant.token;
      var userId = AppConstant.userId;
      final response = await dio.get(
        '${AppConstant.baseUrl}/address/user/$userId',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      final data = response.data;
      if (data['success'] == true) {
        List addresses = data['data']['addresses'] ?? [];
        List<Map<String, String>> addressOptions = [
          {'key': 'Select Address', 'value': ''},
        ];
        for (var e in addresses) {
          addressOptions.add({
            'key':
                '${e['house_no']},${e['area']},${e['city']},${e['state']}-${e['pincode']}',
            'value': e['id'].toString(),
          });
        }
        setState(() {
          addressList = addressOptions;
        });
      }
    } catch (e) {
      print('Error fetching addresses: $e');
    }
  }

  Future<void> _submitQuote() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final formData = _formKey.currentState!.value;

      // final data = {
      //   'user_id': AppConstant.userId,
      //   'phone': formData['phone'],
      //   'email': formData['email'],
      //   'type_of_construction': formData['type_of_construction'],
      //   'cart_item_ids': widget.quoteArray,
      //   'address_id': formData['address_id'],
      // };

      final data = {
        "user_id": AppConstant.userId,
        "phone": formData["phone"].toString(),
        "email": formData["email"].toString(),
        "type_of_construction": formData["type_of_construction"].toString(),
        "cart_item_ids": widget.quoteArray.map((e) => e.toString()).toList(),
        "address_id": formData["address_id"].toString(),
      };

      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      try {
        var dio = Dio();
        var token = AppConstant.token; // get token from storage
        final response = await dio.post(
          '${AppConstant.baseUrl}/quote',
          data: data,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          ),
        );


        if (response.data['success'] == true) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Quote Sent Successfully')));
          Future.delayed(Duration(seconds: 2), () {
            widget.onClose();
          });
        } else {
          setState(() {
            _errorMessage =
                response.data['message'] ?? 'Failed to submit quote';
          });
        }
      } catch (e) {
        print('error: $e');
        if (e is DioException) {
          print("error Response data: ${e.response?.data}");
        }
        setState(() {
          _errorMessage = 'An error occurred while submitting the quote';
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _errorMessage = 'Please fill out all fields correctly.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        height:
            MediaQuery.of(context).size.height *
            0.95, // almost full screen height
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 48), // dummy to center title
                const Text(
                  'Submit Quote',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(icon: Icon(Icons.close), onPressed: widget.onClose),
              ],
            ),
            Expanded(
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'email',
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: 'Email is required',
                        ),
                        FormBuilderValidators.email(
                          errorText: 'Email is required',
                        ),
                      ]),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    FormBuilderTextField(
                      name: 'phone',
                      decoration: InputDecoration(labelText: 'Phone'),
                      validator: FormBuilderValidators.required(
                        errorText: 'Phone is required',
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    FormBuilderDropdown<String>(
                      name: 'type_of_construction',
                      decoration: InputDecoration(
                        labelText: 'Construction Type',
                      ),
                      validator: FormBuilderValidators.required(
                        errorText: 'Please select construction type',
                      ),
                      items: constructionTypes
                          .map(
                            (ct) => DropdownMenuItem(
                              value: ct['value'],
                              child: Text(ct['key']!),
                            ),
                          )
                          .toList(),
                    ),
                    FormBuilderDropdown<String>(
                      name: 'address_id',
                      decoration: InputDecoration(labelText: 'Address'),
                      validator: FormBuilderValidators.required(
                        errorText: 'Address is required',
                      ),
                      items: addressList
                          .map(
                            (item) => DropdownMenuItem(
                              value: item['value'],
                              child: Text(item['key']!),
                            ),
                          )
                          .toList(),
                    ),
                    if (_errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          _errorMessage!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    const SizedBox(height: 20),
                    _isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: widget.quoteArray.isEmpty
                                ? null
                                : _submitQuote,
                            child: Text(
                              widget.quoteArray.isEmpty
                                  ? 'Please select items to get a quote'
                                  : 'Submit to get best Quote',
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
