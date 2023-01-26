import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/config/app_data.dart' as appData;

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.email,
            icon: Icons.email,
            label: "E-mail",
          ),
          CustomTextField(
            readOnly: true,
            icon: Icons.person,
            label: "Nome",
            initialValue: appData.user.name,
          ),
          CustomTextField(
            readOnly: true,
            icon: Icons.phone,
            label: "Celular",
            initialValue: appData.user.phone,
          ),
          CustomTextField(
            readOnly: true,
            icon: Icons.file_copy,
            label: "CPF",
            initialValue: appData.user.cpf,
          ),
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.green),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: const Text("Atualizar senha"),
            ),
          ),
        ],
      ),
    );
  }
}
