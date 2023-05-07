import 'package:chamados/app/models/call.dart';
import 'package:chamados/app/models/call_type.dart';
import 'package:chamados/app/models/user_info_model.dart';
import 'package:flutter/material.dart';

abstract class UserService {
  UserInfoModel getLogedUserInfo(BuildContext context);
  List<UserInfoModel> getAllUsersInfo(BuildContext context);
  List<CallType> getAllCallTypes();
  List<Call> getCalls();
}

class UserServiceImpl implements UserService {

  @override
  UserInfoModel getLogedUserInfo(BuildContext context) {
    return UserInfoModel(
          id: 1,
          email: 'eddergaddini@gmail.com',
          nome: 'Edder',
          sobrenome: 'Gaddini',
          role: 'admin',
          token: '289798897789',
          habilitado: true,
          dataCriacao: DateTime.now(),
        );
  }

  @override
  List<UserInfoModel> getAllUsersInfo(BuildContext context) {
    return [
      UserInfoModel(id: 1, email: 'eddergaddini@gmail.com', nome: 'Edder', sobrenome: 'Gaddini', role: 'admin', token: '289798897789', habilitado: true, dataCriacao: DateTime.now()),
      UserInfoModel(id: 2, email: 'johndoe@gmail.com', nome: 'John', sobrenome: 'Doe', role: 'user', token: '389798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 2))),
      UserInfoModel(id: 3, email: 'janedoe@gmail.com', nome: 'Jane', sobrenome: 'Doe', role: 'admin', token: '489798897789', habilitado: false, dataCriacao: DateTime.now().subtract(Duration(days: 5))),
      UserInfoModel(id: 4, email: 'bobsmith@gmail.com', nome: 'Bob', sobrenome: 'Smith', role: 'user', token: '589798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 8))),
      UserInfoModel(id: 5, email: 'annasmith@gmail.com', nome: 'Anna', sobrenome: 'Smith', role: 'admin', token: '689798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 10))),
      UserInfoModel(id: 6, email: 'johngalt@gmail.com', nome: 'John', sobrenome: 'Galt', role: 'user', token: '789798897789', habilitado: false, dataCriacao: DateTime.now().subtract(Duration(days: 15))),
      UserInfoModel(id: 7, email: 'janegalt@gmail.com', nome: 'Jane', sobrenome: 'Galt', role: 'admin', token: '889798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 20))),
      UserInfoModel(id: 8, email: 'robertjones@gmail.com', nome: 'Robert', sobrenome: 'Jones', role: 'user', token: '989798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 25))),
      UserInfoModel(id: 9, email: 'susansmith@gmail.com', nome: 'Susan', sobrenome: 'Smith', role: 'admin', token: 'a89798897789', habilitado: false, dataCriacao: DateTime.now().subtract(Duration(days: 30))),
      UserInfoModel(id: 10, email: 'michaeljohnson@gmail.com', nome: 'Michael', sobrenome: 'Johnson', role: 'user', token: 'b89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 35))),
      UserInfoModel(id: 11, email: 'mariaoliveira@gmail.com', nome: 'Maria', sobrenome: 'Oliveira', role: 'admin', token: 'c89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 40))),
      UserInfoModel(id: 12, email: 'joaosilva@gmail.com', nome: 'João', sobrenome: 'Silva', role: 'user', token: 'd89798897789', habilitado: false, dataCriacao: DateTime.now().subtract(Duration(days: 45))),
      UserInfoModel(id: 13, email: 'carlosrodrigues@gmail.com', nome: 'Carlos', sobrenome: 'Rodrigues', role: 'admin', token: 'e89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 50))),
      UserInfoModel(id: 14, email: 'andersonsouza@gmail.com', nome: 'Anderson', sobrenome: 'Souza', role: 'user', token: 'f89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 55))),
      UserInfoModel(id: 15, email: 'joseoliveira@gmail.com', nome: 'José', sobrenome: 'Oliveira', role: 'admin', token: 'g89798897789', habilitado: false, dataCriacao: DateTime.now().subtract(Duration(days: 60))),
      UserInfoModel(id: 16, email: 'fernandacosta@gmail.com', nome: 'Fernanda', sobrenome: 'Costa', role: 'user', token: 'h89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 65))),
      UserInfoModel(id: 17, email: 'rodrigolima@gmail.com', nome: 'Rodrigo', sobrenome: 'Lima', role: 'admin', token: 'i89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 70))),
      UserInfoModel(id: 18, email: 'lucasfernandes@gmail.com', nome: 'Lucas', sobrenome: 'Fernandes', role: 'user', token: 'j89798897789', habilitado: false, dataCriacao: DateTime.now().subtract(Duration(days: 75))),
      UserInfoModel(id: 19, email: 'julianasilva@gmail.com', nome: 'Juliana', sobrenome: 'Silva', role: 'admin', token: 'k89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 80))),
      UserInfoModel(id: 20, email: 'pedroalmeida@gmail.com', nome: 'Pedro', sobrenome: 'Almeida', role: 'user', token: 'l89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 85))),
      UserInfoModel(id: 21, email: 'professor@gmail.com', nome: 'Professor', sobrenome: 'Exemplo', role: 'user', token: 'h89798897789', habilitado: true, dataCriacao: DateTime.now().subtract(Duration(days: 50)),)

    ];
  }

  @override
  List<CallType> getAllCallTypes() { return [getCallType1(), getCallType2(), getCallType3(), getCallType4(), getCallType5(), getCallType6(), ]; }

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


  @override
  List<Call> getCalls() {
    return [
      Call(id: '2', callType: getCallType2(), usuario: 'Edson', descricao: 'reunião semanal', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['edson', 'julia', 'lucas']),
      Call(id: '3', callType: getCallType4(), usuario: 'Julia', descricao: 'projeto xyz', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['julia', 'edson']),
      Call(id: '4', callType: getCallType1(), usuario: 'Lucas', descricao: 'atualização de status', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['lucas', 'edson', 'julia']),
      Call(id: '5', callType: getCallType3(), usuario: 'Pedro', descricao: 'apresentação de vendas', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['pedro', 'julia']),
      Call(id: '6', callType: getCallType5(), usuario: 'Isabela', descricao: 'discussão de orçamento', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['isabela', 'lucas']),
      Call(id: '7', callType: getCallType6(), usuario: 'Paulo', descricao: 'revisão de código', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['paulo', 'pedro']),
      Call(id: '8', callType: getCallType2(), usuario: 'Fernanda', descricao: 'reunião de equipe', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['fernanda', 'paulo', 'isabela']),
      Call(id: '9', callType: getCallType4(), usuario: 'Ricardo', descricao: 'projeto abc', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['ricardo', 'fernanda']),
      Call(id: '10', callType: getCallType1(), usuario: 'Camila', descricao: 'atualização de progresso', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['camila', 'ricardo']),
      Call(id: '11', callType: getCallType3(), usuario: 'Roberto', descricao: 'brainstorm de ideias', status: 'null', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['roberto', 'camila']),
      Call(id: '16', callType: getCallType5(), usuario: 'Eduardo', descricao: 'reunião com a equipe de marketing', status: 'agendada', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['Eduardo', 'André', 'Camila']),
      Call(id: '17', callType: getCallType2(), usuario: 'Rafaela', descricao: 'chamada para discutir o projeto X', status: 'concluída', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['Rafaela', 'Maria']),
      Call(id: '18', callType: getCallType6(), usuario: 'Gabriel', descricao: 'apresentação para os investidores', status: 'pendente', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['Gabriel', 'Roberto', 'João']),
      Call(id: '19', callType: getCallType1(), usuario: 'Fernanda', descricao: 'reunião com o time de desenvolvimento', status: 'agendada', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['Fernanda', 'Luís', 'Rodrigo']),
      Call(id: '20', callType: getCallType4(), usuario: 'Bruna', descricao: 'reunião para discutir as metas do trimestre', status: 'cancelada', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['Bruna', 'Felipe']),
      Call(id: '21', callType: getCallType3(), usuario: 'Cássia', descricao: 'chamada de suporte para cliente X', status: 'concluída', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['Cássia', 'Leonardo']),
      Call(id: '22', callType: getCallType5(), usuario: 'Carlos', descricao: 'reunião de alinhamento com o time de vendas', status: 'agendada', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['Carlos', 'Ana', 'Marcelo']),
      Call(id: '23', callType: getCallType2(), usuario: 'Vinícius', descricao: 'chamada com o parceiro comercial', status: 'pendente', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['Vinícius', 'Luisa']),
      Call(id: '24', callType: getCallType6(), usuario: 'José', descricao: 'apresentação para o conselho', status: 'agendada', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['José', 'Amanda', 'Ricardo']),
      Call(id: '25', callType: getCallType1(), usuario: 'Isabela', descricao: 'reunião com o time de marketing', status: 'concluída', dataCriacao: DateTime.now(), dataUltAtualizacao: DateTime.now(), participantes: ['Isabela', 'Thiago', 'Luana']),
    ];
  }
  
}



