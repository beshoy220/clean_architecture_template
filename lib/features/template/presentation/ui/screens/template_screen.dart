import 'package:clean_architecture_template/core/responsiveness/responsive_layout.dart';
import 'package:clean_architecture_template/features/template/presentation/state_manager/template_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TemplateScreen extends StatelessWidget {
  const TemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late final provider = context.watch<TemplateProvider>();
    late final data = provider.templateProvider;

    return ResponsiveLayout(
      mobile: Scaffold(
        body: Column(
          children: [
            Text('I am mobile\nData: $data'),
            OutlinedButton(
              onPressed: () => provider.loadTemplateDataProvider(),
              child: Text('Refresh Data'),
            ),
          ],
        ),
      ),
      tablet: Scaffold(body: Text('I am tablet\nData: ${data?.description}')),
      // desktop: Scaffold(body: Text('I am desktop')),
    );
  }
}
