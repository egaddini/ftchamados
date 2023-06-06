
import 'package:chamados/app/models/call_type.dart';
import 'package:chamados/app/models/user_info_model.dart';

abstract class UserService {
  UserInfoModel getLogedUserInfo();
  List<UserInfoModel> getAllUsersInfo();
  List<CallType> getAllCallTypes();
  Future<void> addCallType(CallType newCall);
}

class UserServiceImpl implements UserService {

  @override
  UserInfoModel getLogedUserInfo() {
    return UserInfoModel(id: 1, email: 'eddergaddini@gmail.com', nome: 'Edder', sobrenome: 'Gaddini', role: 'admin', token: '289798897789', habilitado: true, dataCriacao: DateTime.now().toString(),);
  }

  

  @override
  List<UserInfoModel> getAllUsersInfo() {
    return [
      UserInfoModel(id: 1, email: 'eddergaddini@gmail.com', nome: 'Edder', sobrenome: 'Gaddini', role: 'admin', token: '289798897789', habilitado: true, dataCriacao: DateTime.now().toString()),
      UserInfoModel(id: 2, email: 'johndoe@gmail.com', nome: 'John', sobrenome: 'Doe', role: 'user', token: '389798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 2)).toString()),
      UserInfoModel(id: 3, email: 'janedoe@gmail.com', nome: 'Jane', sobrenome: 'Doe', role: 'admin', token: '489798897789', habilitado: false, dataCriacao: DateTime.now().subtract(Duration(days: 5)).toString()),
      UserInfoModel(id: 4, email: 'bobsmith@gmail.com', nome: 'Bob', sobrenome: 'Smith', role: 'user', token: '589798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 8)).toString()),
      UserInfoModel(id: 5, email: 'annasmith@gmail.com', nome: 'Anna', sobrenome: 'Smith', role: 'admin', token: '689798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 10)).toString()),
      UserInfoModel(id: 6, email: 'johngalt@gmail.com', nome: 'John', sobrenome: 'Galt', role: 'user', token: '789798897789', habilitado: false, dataCriacao: DateTime.now().subtract(Duration(days: 15)).toString()),
      UserInfoModel(id: 7, email: 'janegalt@gmail.com', nome: 'Jane', sobrenome: 'Galt', role: 'admin', token: '889798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 20)).toString()),
      UserInfoModel(id: 8, email: 'robertjones@gmail.com', nome: 'Robert', sobrenome: 'Jones', role: 'user', token: '989798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 25)).toString()),
      UserInfoModel(id: 9, email: 'susansmith@gmail.com', nome: 'Susan', sobrenome: 'Smith', role: 'admin', token: 'a89798897789', habilitado: false, dataCriacao: DateTime.now().subtract(Duration(days: 30)).toString()),
      UserInfoModel(id: 10, email: 'michaeljohnson@gmail.com', nome: 'Michael', sobrenome: 'Johnson', role: 'user', token: 'b89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 35)).toString()),
      UserInfoModel(id: 11, email: 'mariaoliveira@gmail.com', nome: 'Maria', sobrenome: 'Oliveira', role: 'admin', token: 'c89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 40)).toString()),
      UserInfoModel(id: 12, email: 'joaosilva@gmail.com', nome: 'João', sobrenome: 'Silva', role: 'user', token: 'd89798897789', habilitado: false, dataCriacao: DateTime.now().subtract(Duration(days: 45)).toString()),
      UserInfoModel(id: 13, email: 'carlosrodrigues@gmail.com', nome: 'Carlos', sobrenome: 'Rodrigues', role: 'admin', token: 'e89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 50)).toString()),
      UserInfoModel(id: 14, email: 'andersonsouza@gmail.com', nome: 'Anderson', sobrenome: 'Souza', role: 'user', token: 'f89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 55)).toString()),
      UserInfoModel(id: 15, email: 'joseoliveira@gmail.com', nome: 'José', sobrenome: 'Oliveira', role: 'admin', token: 'g89798897789', habilitado: false, dataCriacao: DateTime.now().subtract(Duration(days: 60)).toString()),
      UserInfoModel(id: 16, email: 'fernandacosta@gmail.com', nome: 'Fernanda', sobrenome: 'Costa', role: 'user', token: 'h89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 65)).toString()),
      UserInfoModel(id: 17, email: 'rodrigolima@gmail.com', nome: 'Rodrigo', sobrenome: 'Lima', role: 'admin', token: 'i89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 70)).toString()),
      UserInfoModel(id: 18, email: 'lucasfernandes@gmail.com', nome: 'Lucas', sobrenome: 'Fernandes', role: 'user', token: 'j89798897789', habilitado: false, dataCriacao: DateTime.now().subtract(Duration(days: 75)).toString()),
      UserInfoModel(id: 19, email: 'julianasilva@gmail.com', nome: 'Juliana', sobrenome: 'Silva', role: 'admin', token: 'k89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 80)).toString()),
      UserInfoModel(id: 20, email: 'pedroalmeida@gmail.com', nome: 'Pedro', sobrenome: 'Almeida', role: 'user', token: 'l89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 85)).toString()),
      UserInfoModel(id: 21, email: 'professor@gmail.com', nome: 'Professor', sobrenome: 'Exemplo', role: 'user', token: 'h89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 50)).toString(),)

    ];
  }

  UserInfoModel getUserInfoModelById(int id) {
    return getAllUsersInfo().firstWhere((userInfo) => userInfo.id == id, orElse: () => UserInfoModel(id: 1, email: 'eddergaddini@gmail.com', nome: 'Edder', sobrenome: 'Gaddini', role: 'admin', token: '289798897789', habilitado: true, dataCriacao: DateTime.now().toString()),);
  }

  @override
  List<CallType> getAllCallTypes() {
      if(call.isEmpty) {
        call.addAll([getCallType1(), getCallType2(), getCallType3(), getCallType4(), getCallType5(), getCallType6(), ]);
      }
      return call;
     }

  List<CallType> call = [];

  @override
  Future<void> addCallType(CallType newCall) async {
    call.add(newCall);
    print(newCall.descricao);
  }

  CallType getCallType1() {
    return CallType(id: 1, sigla: 'TEC', setor: 'Tecnologia', titulo: 'Formatar computador', prioridade: 'URGENTE', descricao: 'Para caso seu computador tenha problemas ou esteja com virus.');
  }
  CallType getCallType2() {
    return CallType(id: 2, sigla: 'TEC', setor: 'Tecnologia', titulo: 'Formatar calculadora', prioridade: 'SEM PRIORIDADE', descricao: 'Para caso sua calculadora apresente problemas.');
  }
  CallType getCallType3() {
    return CallType(id: 3, sigla: 'TEC', setor: 'Tecnologia', titulo: 'Erro visual na aplicação X.', prioridade: 'LEVE', descricao: 'Para caso seja identificado erro visual em algum componente da aplicação X.');
  }
  CallType getCallType4() {
    return CallType(id: 4, sigla: 'INF', setor: 'Infraestrutura', titulo: 'Teclado Novo', prioridade: 'MÉDIA', descricao: 'Solicitação de periférico.');
  }
  CallType getCallType5() {
    return CallType(id: 5, sigla: 'INF', setor: 'Infraestrutura', titulo: 'Problema na catraca de acesso a empresa', prioridade: 'URGENTE', descricao: 'Problema relacionado ao acesso a empresa.');
  }
  CallType getCallType6() {
    return CallType(id: 6, sigla: 'GEN', setor: 'Todos', titulo: 'Chamado', prioridade: 'A VERIFICAR', descricao: 'Para criar chamado de problemas\necessidades que não tenham sido cadastradas.');
  }

  
}



