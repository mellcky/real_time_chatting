import 'dart:io';

// This is a simple script to verify that the application can be built for different platforms
// It's not a traditional test, but it helps ensure there are no critical errors in the codebase

void main() async {
  print('Starting build verification...');
  
  // Test if the application can be analyzed without errors
  print('\n=== Running Flutter analyze ===');
  await _runCommand('flutter', ['analyze']);
  
  // Test if the application can be built for Android
  print('\n=== Verifying Android build ===');
  await _runCommand('flutter', ['build', 'apk', '--debug']);
  
  print('\nBuild verification completed successfully!');
}

Future<void> _runCommand(String command, List<String> arguments) async {
  print('Running: $command ${arguments.join(' ')}');
  
  final process = await Process.start(command, arguments);
  
  // Forward stdout and stderr to the console
  process.stdout.listen((data) {
    stdout.add(data);
  });
  
  process.stderr.listen((data) {
    stderr.add(data);
  });
  
  final exitCode = await process.exitCode;
  if (exitCode != 0) {
    print('Command failed with exit code $exitCode');
    exit(exitCode);
  } else {
    print('Command completed successfully');
  }
}