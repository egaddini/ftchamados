part of home_screen;

class MenuDrawer extends StatefulWidget {

  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {

  late UserInfoModel? logedUser;
  bool _isAdmin = false;
  bool isLoading = true;

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    logedUser = await LocalStorageServices().getUser();
    setState(() {
      _isAdmin = logedUser!.isAdmin();
    });
    _setLoading();
  }

  void _setLoading() {
    setState(() {
      isLoading = isLoading ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child:  isLoading ? buildLoadingIndicator() : ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Pallete.gradient3
            ),
            accountEmail: Text(logedUser!.email.toString()),
            accountName: Text(logedUser!.nome.toString()),
            currentAccountPicture: CircleAvatar(
              child: Text(logedUser!.email.toString().substring(0,2)),
            ),
            
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text("Minha conta"),
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => EditUserPage(logedUser!)))
                  .then((newContact) {
                if (newContact != null) {
                  //messageResponse(context, newContact.name + " a sido modificado...!");
                  //Logica para alterar usuario logado :D
                }
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.message_outlined),
            title: const Text("Chat"),
            onTap: () {
              Navigator.pop(context);
              //Navegar para outra página
            },
          ),
          ListTile(
            title: const Text("Meus Chamados"),
            leading: const Icon(IconData(0xf2ef, fontFamily: 'MaterialIcons')),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'user-call');
            },
          ),          
          Visibility(
            visible: _isAdmin,
            child: ExpansionTile(
              title: const Text('Painel do Administrador'),
              leading: const Icon(Icons.admin_panel_settings_outlined),
              children: [
                ExpansionTile(
                  title: const Text('Chamados'),
                  leading: const Icon(IconData(0xf2ef, fontFamily: 'MaterialIcons')),
                  children: [                
                    ListTile(
                      title: const Text("Dashboard"),
                      leading: const Icon(Icons.bar_chart_outlined),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, 'call');
                      },
                    ),
                    ListTile(
                      title: const Text("Categorias"),
                      leading: const Icon(Icons.note_add_outlined),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, 'call-type');
                      },
                    ),                    
                  ],
                ),
                ListTile(
                  leading: const Icon(Icons.safety_divider),
                  title: const Text("Usuarios"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'users');
                  },
                ),              
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              //_authRepo.logout();
              Navigator.popAndPushNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }
}
