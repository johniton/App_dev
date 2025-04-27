import 'package:flutter/material.dart';
import 'package:frontend/ai_response.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'web/assets/.env');

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuthScreen(), debugShowCheckedModeBanner: false);
  }
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> register() async {
    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: emailController.text,
        password: passwordController.text,
      );
      print("Registered: ${response.user?.email}");
    } catch (e) {
      print("Registration error: $e");
    }
  }

  Future<void> login() async {
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      final session = response.session;

      if (session != null) {
        final token = session.accessToken;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        print("Login failed: session is null");
      }
    } catch (error) {
      print("Login error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter + Express + Supabase')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: login, child: const Text('Login')),
            ElevatedButton(onPressed: register, child: const Text('Register')),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController taskcontroller = TextEditingController();
  List<Map<String, dynamic>> tasks = [];

  @override
  void initState() {
    super.initState();
    loadTasksOnStart();
  }

  void loadTasksOnStart() async {
    final token = await getToken();
    print("🔐 Token: $token");
    if (token != null) {
      await fetchTasks(token);
    }
  }

  Future<void> signOut() async {
    await Supabase.instance.client.auth.signOut();
    Navigator.pop(context);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<void> createTask(String token) async {
    final url = Uri.parse('http://localhost:3000/tasks');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'title': taskcontroller.text}),
    );

    if (response.statusCode == 200) {
      taskcontroller.clear();
      await fetchTasks(token);
    } else {
      print("Error creating task: ${response.body}");
    }
  }

  Future<void> fetchTasks(String token) async {
    final url = Uri.parse('http://localhost:3000/tasks');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        tasks =
            data
                .map((task) => {'id': task['id'], 'title': task['title']})
                .toList();
      });
    } else {
      print("Error fetching tasks: ${response.body}");
    }
  }

  Future<void> updateTask(String token, int taskId, String newTitle) async {
    final url = Uri.parse('http://localhost:3000/tasks/$taskId');
    final response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'title': newTitle}),
    );

    if (response.statusCode == 200) {
      await fetchTasks(token);
    } else {
      print("Error updating task: ${response.body}");
    }
  }

  Future<void> deleteTask(String token, int taskId) async {
    final url = Uri.parse('http://localhost:3000/tasks/$taskId');
    final response = await http.delete(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      await fetchTasks(token);
    } else {
      print("Error deleting task: ${response.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: signOut)],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: taskcontroller,
              decoration: InputDecoration(
                hintText: "Enter task title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final token = await getToken();
              if (token != null) {
                await createTask(token);
              }
            },
            child: Text("Create Task"),
          ),
          list(),
        ],
      ),
    );
  }

  Expanded list() {
    return Expanded(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(), // Smooth iOS-like scrolling
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('My Tasks'),
              background: Image.network(
                'https://picsum.photos/800/400',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final task = tasks[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text(task['title']),
                        subtitle: Text('Task ID: ${task['id']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () async {
                                final token = await getToken();
                                final editController = TextEditingController(
                                  text: task['title'],
                                );
                                final newTitle = await showDialog<String>(
                                  context: context,
                                  builder:
                                      (context) => AlertDialog(
                                        title: Text("Edit Task"),
                                        content: TextField(
                                          controller: editController,
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed:
                                                () => Navigator.pop(
                                                  context,
                                                  editController.text,
                                                ),
                                            child: Text("Save"),
                                          ),
                                        ],
                                      ),
                                );
                                if (newTitle != null && token != null) {
                                  await updateTask(token, task['id'], newTitle);
                                }
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                final token = await getToken();
                                if (token != null) {
                                  await deleteTask(token, task['id']);
                                }
                              },
                            ),
                          ],
                        ),

                        onTap: () async {
                          final geminiResponse =
                              await GeminiService.generateResponse(
                                // task['title'],
                                '''
Please provide the following details in bullet points for the task : ${task['title']}:
- Title: 
- Deadline: 
- Priority: 
- Description: 
i want minimum 200 to 250 words
title should be max 10 words 
priority should me at max 3 words
majority should be the description
''',
                              );

                          if (geminiResponse != null) {
                            final parsedData = parseResponse(geminiResponse);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => AiResponse(data: parsedData),
                              ),
                            );
                          }
                        },
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 500.ms)
                    .slideX(begin: 0.3, duration: 400.ms),
              );
            }, childCount: tasks.length),
          ),
        ],
      ),
    );
  }
}

// Map<String, String> parseResponse(String response) {
//   final Map<String, String> result = {};

//   final RegExp regExp = RegExp(
//     r'(?<=^|\s)(\w+):\s*(.*?)(?=\n\s*[\*\-]|\s*$)',
//     dotAll: true,
//   );
//   final matches = regExp.allMatches(response);

//   for (final match in matches) {
//     final key = match.group(1)?.trim();
//     final value = match.group(2)?.trim();

//     if (key != null && value != null) {
//       result[key] = value;
//     }
//   }

//   return result;
// }
Map<String, String> parseResponse(String response) {
  final Map<String, String> result = {};

  // Split the response by '~'
  final List<String> parts = response.split('~');

  // Define keys in order
  final List<String> keys = ['Title', 'Deadline', 'Priority', 'Description'];

  for (int i = 0; i < parts.length && i < keys.length; i++) {
    final value = parts[i].trim();

    if (value.isNotEmpty) {
      result[keys[i]] = value;
    }
  }

  return result;
}

class GeminiService {
  static const String _apiKey =
      'AIzaSyC6k6C4bd6uFGFaUx77SXrhWImHcX3rYaY'; // Replace with your API Key

  static final GenerativeModel _model = GenerativeModel(
    model: 'gemini-1.5-pro', // Use the correct model
    apiKey: _apiKey,
  );

  // Static method to generate response
  static Future<String?> generateResponse(String prompt) async {
    try {
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      if (response.text != null) {
        // Clean the response before returning
        print(response.text);
        return (response.text!);
      } else {
        return null;
      }
    } catch (e) {
      print('Error generating response: $e');
      return null;
    }
  }

  static String cleanResponse(String response) {
    if (response.isEmpty) return response;

    return response
        .replaceAll(RegExp(r'\*'), '')
        .replaceAll(RegExp(r"""[^\w\s,.?!:;'"()/&-]"""), '')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }
}
