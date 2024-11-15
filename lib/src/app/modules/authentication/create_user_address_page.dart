import 'package:flutter/material.dart';
import 'package:procraft/src/app/modules/authentication/register_user_page.dart';

class CreateUserAddressPage extends StatefulWidget {
  const CreateUserAddressPage({super.key});

  @override
  State<CreateUserAddressPage> createState() => _CreateUserAddressPageState();
}

class _CreateUserAddressPageState extends State<CreateUserAddressPage> {
  final addressFormKey = GlobalKey<FormState>();

  String country = "";
  String state = "";
  String city = "";
  String street = "";
  String addressNumber = "";
  String zipCode = "";

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: addressFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(label: Text('País')),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Por favor, informe o país onde você mora.";
                  }
                  return null;
                },
                onChanged: (value) => country = value,
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text('UF')),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Por favor, informe o estado onde você mora.";
                  }
                  return null;
                },
                onChanged: (value) => state = value,
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text('Cidade')),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Por favor, informe a cidade onde você mora.";
                  }
                  return null;
                },
                onChanged: (value) => city = value,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(label: Text('CEP')),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Por favor, informe o cep da sua localidade.";
                  }
                  return null;
                },
                onChanged: (value) => zipCode = value,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      decoration: const InputDecoration(label: Text('Rua')),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Por favor, informe a rua onde você.";
                        }
                        return null;
                      },
                      onChanged: (value) => street = value,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(label: Text('N°')),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "N° inválido.";
                        }
                        return null;
                      },
                      onChanged: (value) => addressNumber = value,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.sizeOf(context).width, 54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });

                  if (addressFormKey.currentState!.validate()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RegisterUserPage(address: {
                          "street": street,
                          "city": city,
                          "state": state,
                          "zipCode": zipCode,
                          "country": country,
                        }),
                      ),
                    );
                  }
                  setState(() {
                    loading = false;
                  });
                },
                child: loading ? const CircularProgressIndicator() : const Text("Próximo"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
