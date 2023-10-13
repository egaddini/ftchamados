part of call_status;

void callStatusFlowDialog() {
  showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
            titlePadding: const EdgeInsets.all(8),
            title: AppBar(
              title: const Text('Status Flow'),
              forceMaterialTransparency: true,
            ),
            content: const SizedBox(
              width: 600,
              child: CallStatusFlow(),
            ),
          ));
}

List<NodeInput> flowChart = [
  NodeInput(id: "start", next: [EdgeInput(outcome: "process")]),
  // NodeInput(id: "documents", next: [EdgeInput(outcome: "process")]),
  NodeInput(id: "process", next: [EdgeInput(outcome: "decision")]),
  NodeInput(
      id: "decision",
      size: const NodeSize(width: 100, height: 100),
      next: [EdgeInput(outcome: "processA")]),
  NodeInput(id: "processA", next: [EdgeInput(outcome: "end")]),
  // NodeInput(id: "processB", next: [EdgeInput(outcome: "end")]),
  NodeInput(id: "end", next: []),
];

enum FlowStepType { start, documents, decision, process, end }

class FlowStep {
  final String text;
  final FlowStepType type;

  FlowStep({required this.text, required this.type});
}

Map<String, FlowStep> data = {
  "start": FlowStep(text: "Aberto", type: FlowStepType.start),
  // "documents": FlowStep(text: "Em Triagem", type: FlowStepType.documents),
  "process": FlowStep(text: "Em Triagem", type: FlowStepType.process),
  "running": FlowStep(text: "Em Andamento", type: FlowStepType.process),
  "decision":
      FlowStep(text: "Aguardando Informações", type: FlowStepType.decision),
  "processA": FlowStep(text: "Resolvido", type: FlowStepType.process),
  // "processB": FlowStep(text: "Process B", type: FlowStepType.process),
  "end": FlowStep(text: "Finalizado", type: FlowStepType.end),
};

class CallStatusFlow extends StatefulWidget {
  const CallStatusFlow({Key? key}) : super(key: key);
  @override
  CallStatusFlowState createState() => CallStatusFlowState();
}

class CallStatusFlowState extends State<CallStatusFlow> {
  _buildNode(NodeInput node) {
    final info = data[node.id]!;
    switch (info.type) {
      case FlowStepType.start:
        return Start(data: info);
      case FlowStepType.documents:
        return Document(data: info);
      case FlowStepType.decision:
        return Decision(data: info);
      case FlowStepType.process:
        return Process(data: info);
      case FlowStepType.end:
        return End(data: info);
    }
  }

  @override
  Widget build(BuildContext context) {
    final list = flowChart;

    return Center(
      child: DirectGraph(
        list: list,
        defaultCellSize: const Size(150.0, 100.0),
        cellPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        contactEdgesDistance: 0,
        orientation: MatrixOrientation.Vertical,
        nodeBuilder: (BuildContext context, NodeInput node) =>
            Padding(padding: const EdgeInsets.all(5), child: _buildNode(node)),
        minScale: 0.1,
        maxScale: 1,
      ),
    );
  }
}

class Start extends StatelessWidget {
  final FlowStep data;

  const Start({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.green),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: Colors.greenAccent,
      ),
      child: Center(
        child: Text(
          data.text,
          style: Get.theme.textTheme.titleMedium,
        ),
      ),
    );
  }
}

class Document extends StatelessWidget {
  final FlowStep data;

  const Document({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 3),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.grey,
      ),
      child: Center(
        child: Text(
          data.text,
          style: Get.theme.textTheme.titleMedium,
        ),
      ),
    );
  }
}

class Process extends StatelessWidget {
  final FlowStep data;

  const Process({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.orange),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.orangeAccent,
      ),
      child: Center(
        child: Text(
          data.text,
          style: Get.theme.textTheme.titleMedium,
        ),
      ),
    );
  }
}

class Decision extends StatelessWidget {
  final FlowStep data;

  const Decision({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.rotate(
          angle: pi / 4,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
                color: Colors.deepOrangeAccent,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: Colors.orangeAccent,
            ),
          ),
        ),
        SizedBox(
          child: Center(
            child: Text(
              data.text,
              style: Get.theme.textTheme.titleMedium,
            ),
          ),
        )
      ],
    );
  }
}

class End extends StatelessWidget {
  final FlowStep data;

  const End({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.red),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: Colors.redAccent,
      ),
      child: Center(
        child: Text(
          data.text,
          style: Get.theme.textTheme.titleMedium,
        ),
      ),
    );
  }
}
