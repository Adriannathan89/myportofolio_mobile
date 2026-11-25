import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/models/project.dart';

void main() {
  group('Project JSON', () {
    test('fromJson maps snake_case keys and defaults a null image url', () {
      final project = Project.fromJson({
        'id': 'abc-123',
        'title': 'Portfolio',
        'description': 'Django + Flutter',
        'tech_stack': 'Flutter, Django',
        'project_url': 'https://example.com',
        'project_image_url': null,
      });

      expect(project.id, 'abc-123');
      expect(project.techStack, 'Flutter, Django');
      expect(project.projectUrl, 'https://example.com');
      expect(project.projectImageUrl, '');
    });

    test('toJson omits id and uses snake_case keys', () {
      const project = Project(
        id: 'abc-123',
        title: 'Portfolio',
        description: 'Django + Flutter',
        techStack: 'Flutter',
        projectUrl: 'https://example.com',
      );

      final json = project.toJson();

      expect(json.containsKey('id'), isFalse);
      expect(json['tech_stack'], 'Flutter');
      expect(json['project_url'], 'https://example.com');
      expect(json['project_image_url'], '');
    });
  });
}
