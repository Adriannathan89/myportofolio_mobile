import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

const _baseUrl = 'http://test.local';

const _projectJson = {
  'id': 'f1c6b0a2-0000-4000-8000-000000000001',
  'title': 'Portfolio',
  'description': 'Django + Flutter',
  'tech_stack': 'Flutter, Django',
  'project_url': 'https://example.com',
  'project_image_url': '',
};

ApiClient _clientWith(http.Client mock) =>
    ApiClient(client: mock, baseUrl: _baseUrl);

void main() {
  group('getProjects', () {
    test('parses the project list', () async {
      final mock = MockClient((request) async {
        expect(request.method, 'GET');
        expect(request.url.toString(), '$_baseUrl/api/v1/projects/');
        return http.Response(jsonEncode([_projectJson]), 200);
      });

      final projects = await _clientWith(mock).getProjects();

      expect(projects, hasLength(1));
      expect(projects.single.title, 'Portfolio');
      expect(projects.single.id, _projectJson['id']);
    });

    test('throws ApiException on a non-2xx response', () async {
      final mock = MockClient((_) async => http.Response('boom', 500));

      expect(
        () => _clientWith(mock).getProjects(),
        throwsA(
          isA<ApiException>().having((e) => e.statusCode, 'statusCode', 500),
        ),
      );
    });
  });

  group('createProject', () {
    test(
      'sends Token auth, JSON body without id, and returns the created project',
      () async {
        late http.Request captured;
        final mock = MockClient((request) async {
          captured = request;
          return http.Response(jsonEncode(_projectJson), 201);
        });

        final created = await _clientWith(mock).createProject(
          const Project(
            id: 'should-not-be-sent',
            title: 'Portfolio',
            description: 'Django + Flutter',
            techStack: 'Flutter, Django',
            projectUrl: 'https://example.com',
          ),
          token: 'secret-token',
        );

        expect(captured.method, 'POST');
        expect(captured.url.toString(), '$_baseUrl/api/v1/projects/');
        expect(captured.headers['Authorization'], 'Token secret-token');
        expect(
          captured.headers['Content-Type'],
          'application/json; charset=UTF-8',
        );

        final body = jsonDecode(captured.body) as Map<String, dynamic>;
        expect(body.containsKey('id'), isFalse);
        expect(body['tech_stack'], 'Flutter, Django');

        expect(created.id, _projectJson['id']);
      },
    );

    test('throws ApiException when the server rejects the request', () async {
      final mock = MockClient(
        (_) async => http.Response('{"detail":"Unauthorized"}', 401),
      );

      expect(
        () => _clientWith(mock).createProject(
          const Project(
            title: 'x',
            description: 'x',
            techStack: 'x',
            projectUrl: 'https://example.com',
          ),
          token: 'bad',
        ),
        throwsA(
          isA<ApiException>().having((e) => e.statusCode, 'statusCode', 401),
        ),
      );
    });
  });

  group('obtainToken', () {
    test(
      'posts credentials to /api/v1/auth/token/ and returns the token',
      () async {
        late http.Request captured;
        final mock = MockClient((request) async {
          captured = request;
          return http.Response(jsonEncode({'token': 'abc123'}), 200);
        });

        final token = await _clientWith(mock).obtainToken('alice', 'pw');

        expect(captured.url.toString(), '$_baseUrl/api/v1/auth/token/');
        expect(jsonDecode(captured.body), {
          'username': 'alice',
          'password': 'pw',
        });
        expect(token, 'abc123');
      },
    );

    test('throws ApiException for wrong credentials', () async {
      final mock = MockClient(
        (_) async => http.Response('{"non_field_errors":[]}', 400),
      );

      expect(
        () => _clientWith(mock).obtainToken('alice', 'wrong'),
        throwsA(
          isA<ApiException>().having((e) => e.statusCode, 'statusCode', 400),
        ),
      );
    });
  });

  group('logout', () {
    test('posts to /api/v1/auth/logout/ with Token auth', () async {
      late http.Request captured;
      final mock = MockClient((request) async {
        captured = request;
        return http.Response('', 204);
      });

      await _clientWith(mock).logout(token: 'abc123');

      expect(captured.url.toString(), '$_baseUrl/api/v1/auth/logout/');
      expect(captured.headers['Authorization'], 'Token abc123');
    });
  });
}
