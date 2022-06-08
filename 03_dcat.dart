import 'dart:convert';
import 'dart:io';

//命令行程序(https://dart.cn/tutorials/server/cmdline#overview-of-the-dcat-app-code)
import 'package:args/args.dart';

const lineNumber = 'line-number';

void main(List<String> args) {
  exitCode = 0;
  final parser = ArgParser()..addFlag(lineNumber, negatable: false, abbr: 'n');
  ArgResults argResults = parser.parse(args);
  final paths = argResults.rest;
  dcat(paths, showLineNumbers: argResults[lineNumber] as bool);
}

Future<void> dcat(List<String> paths, {bool showLineNumbers = false}) async {
  if (paths.isEmpty) {
    print('type exit to quit.');
    while (true) {
      stdout.write('>>>');
      String? line = stdin.readLineSync();
      print('${line}\n');

      if (line?.toLowerCase() == 'exit') {
        //修改终止条件
        print('bye.');
        break;
      }
    }
  } else {
    for (final path in paths) {
      var lineNumber = 1;
      final lines = utf8.decoder
          .bind(File(path).openRead())
          .transform(const LineSplitter());
      try {
        await for (final line in lines) {
          if (showLineNumbers) {
            stdout.write('${lineNumber++}');
          }
          stdout.writeln(line);
        }
      } catch (_) {
        await _handleError(path);
      }
    }
  }
}

Future<void> _handleError(String path) async {
  if (await FileSystemEntity.isDirectory(path)) {
    stderr.writeln('Error:$path is a dirictory.');
  } else {
    exitCode = 2;
  }
}
