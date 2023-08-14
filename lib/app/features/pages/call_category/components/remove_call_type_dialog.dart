part of call_type_dashboard;

void removeCallType(BuildContext context, CallType call) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text("Deletar Tipo de Chamado"),
      content: Text("O usuário: ${call.titulo} será deletado para sempre, deseja realmente continuar?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Voltar", style: TextStyle(color: Get.theme.primaryColor),),
        ),
        TextButton(
          onPressed: () async {
            /// setState(() {
            ///   users.remove(user);
            ///   Navigator.pop(context);
            /// });
            Navigator.pop(context);
          },
          child: const Text(
            "Deletar",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    )
  );
}