import 'package:devision/src/app.dart';
import 'package:devision/tools/tool.dart';
import 'package:flutter/material.dart';

class ToolModal extends StatelessWidget {
  const ToolModal({super.key});

  Future show() {
    return showModalBottomSheet(
      context: Devision.globalContext,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Devision.cs;

    return DraggableScrollableSheet(
      expand: false,
      minChildSize: 0.1,
      initialChildSize: 0.3,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return GridView.builder(
          padding: const EdgeInsets.all(4),
          controller: scrollController,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 88,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          itemBuilder: (context, index) {
            final i = Tool.items[index];
            return Material(
              color: cs.surfaceContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: () {
                  Devision.navigator.push(
                    MaterialPageRoute(builder: (context) => i.page),
                  );
                },
                borderRadius: BorderRadius.circular(8),
                child: GridTile(
                  footer: Text(
                    i.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: cs.onSurface),
                  ),
                  child: Center(
                    child: IconTheme(
                      data: IconThemeData(
                        color: cs.onSurface,
                      ),
                      child: i.icon,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: Tool.items.length,
        );
      },
    );
  }
}
