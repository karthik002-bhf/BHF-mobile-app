import 'package:bhf_mobile_app/common/config.dart';
import 'package:bhf_mobile_app/screens/adress_create_form_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// Dummy Address List model
class Address {
  String id;
  String name;
  String phone;
  String houseNo;
  String area;
  String landmark;
  String city;
  String state;
  String pincode;

  Address({
    required this.id,
    required this.name,
    required this.phone,
    required this.houseNo,
    required this.area,
    required this.landmark,
    required this.city,
    required this.state,
    required this.pincode,
  });
}

class AddressListScreen extends StatefulWidget {
  const AddressListScreen({super.key});

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  List<Address> addresses = [
    Address(
      id: '1',
      name: 'John Doe',
      phone: '1234567890',
      houseNo: '123A',
      area: 'MG Road',
      landmark: 'Near Park',
      city: 'Bengaluru',
      state: 'Karnataka',
      pincode: '560001',
    ),
    // Other addresses
  ];

  bool isLoadingAddress = false;
  Address? fetchedAddress;

  Future<void> fetchAddressById(String userId, String addressId) async {
    setState(() {
      isLoadingAddress = true;
      fetchedAddress = null;
    });

    try {
      final dio = Dio();
      final response = await dio.get(
        '${AppConstant.baseUrl}/address/user/${AppConstant.userId}',
        options: Options(
          headers: {'Authorization': 'Bearer ${AppConstant.token}'},
        ),
      );
      final data = response.data;

      if (data['success'] == true) {
        final addr = data['data']['address'];
        fetchedAddress = Address(
          id: addr['id'].toString(),
          name: addr['name'] ?? '',
          phone: addr['phone'] ?? '',
          houseNo: addr['house_no'] ?? '',
          area: addr['area'] ?? '',
          landmark: addr['landmark'] ?? '',
          city: addr['city'] ?? '',
          state: addr['state'] ?? '',
          pincode: addr['pincode']?.toString() ?? '',
        );
      }
    } catch (e) {
      print('GetAddressError: $e');
      // optionally show error snackbar/toast
    } finally {
      setState(() {
        isLoadingAddress = false;
      });
    }
  }

  void showAddressForm({Address? editAddress}) async {
    if (editAddress != null) {
      await fetchAddressById('USER_ID_HERE', editAddress.id);
      if (fetchedAddress == null) {
        // Could not fetch data, do not open form or show error
        return;
      }
    }

    showDialog(
      context: context,
      builder: (context) {
        if (isLoadingAddress) {
          return Center(child: CircularProgressIndicator());
        }
        return AlertDialog(
          content: SizedBox(
            width: double.maxFinite,
            child: AddressCreateForm(
              data: editAddress != null
                  ? {
                      'name': fetchedAddress!.name,
                      'phone': fetchedAddress!.phone,
                      'house_no': fetchedAddress!.houseNo,
                      'area': fetchedAddress!.area,
                      'landmark': fetchedAddress!.landmark,
                      'city': fetchedAddress!.city,
                      'state': fetchedAddress!.state,
                      'pincode': fetchedAddress!.pincode,
                    }
                  : null,
              update: editAddress != null,
              onSuccess: () {
                Navigator.of(context).pop();
                setState(() {
                  // Refresh address list from backend if needed
                });
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Addresses'),
        actions: [
          IconButton(
            onPressed: () {
              showAddressForm();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () => showAddressForm(),
              child: Text('Add New Address'),
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: addresses.length,
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (context, index) {
                final addr = addresses[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(border: Border.all()),
                  child: ListTile(
                    title: Text('${addr.houseNo}, ${addr.area}, ${addr.city}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${addr.name}'),
                        Text('Phone: ${addr.phone}'),
                        Text('Landmark: ${addr.landmark}'),
                        Text('State: ${addr.state}, Pincode: ${addr.pincode}'),
                      ],
                    ),
                    trailing: TextButton(
                      child: Text('Edit'),
                      onPressed: () {
                        showAddressForm(editAddress: addr);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
