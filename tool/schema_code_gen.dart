import 'dart:io';
import 'dart:convert' show JSON;

// TODO: wrap at 80 chars (reuse dartfmt?).
// TODO: also generate validation code.

// gmosx: Lazy hack but does the job.
String _toCamelCase(String str, {bool startWithLowerCase: false}) {
  final parts = str.toLowerCase().split("_");
  for (int i = startWithLowerCase ? 1 : 0; i < parts.length; i++){
    parts[i] = "${parts[i].substring(0, 1).toUpperCase()}${parts[i].substring(1)}";
  }
  return parts.join();
}

// gmosx: Lazy hack but does the job.
String _toSnakeCase(String str) {
  final parts = [];
  var matches = new RegExp(r'[A-Z]').allMatches(str).toList();
  var i = 0;
  for (; i < matches.length - 1; i++) {
    parts.add(str.substring(matches[i].start, matches[i+1].start));
  }
  parts.add(str.substring(matches[i].start));
  return parts.map((p) => p.toLowerCase()).join("_");
}

/**
 * This tool generates the API domain classes from the JSON schema.
 */
class CodeGenerator {
  String generate(Map schema) {
    final properties = schema['properties'];
    final sb = new StringBuffer();

    sb.writeln("part of ripple_rest;\n");

    sb.writeln("// This file is generated automatically from the JSON schema, do *not* edit!\n");

    sb.writeln("/**");
    sb.writeln(" * ${schema['description'].trim()}.");
    sb.writeln(" */");
    sb.writeln("class ${schema['title']} {");

    properties.forEach((name, spec) {
      sb.writeln("\t/** ${spec['description']}. */");
      sb.writeln("\t${_compilePropertyType(name, spec)} ${_toCamelCase(name, startWithLowerCase: true)};\n");
    });

    sb.writeln("\t${schema['title']}.fromMap(Map map) {");
    properties.forEach((name, spec) {
      sb.writeln("\t\t${_toCamelCase(name, startWithLowerCase: true)} = ${_compileFromProperty(name, spec)};");
    });
    sb.writeln("\t}");

    sb.writeln();

    sb.writeln("\tMap toMap() => {");
    var arr = [];
    properties.forEach((name, spec) {
      arr.add("\t\t'$name': ${_compileToProperty(name, spec)}");
    });
    sb.writeln(arr.join(",\n"));
    sb.writeln("\t};");

    sb.writeln("}");
    return sb.toString();
  }

  String _compilePropertyType(String name, Map spec) {
    if (spec.containsKey('\$ref')) {
      switch (spec['\$ref']) {
        case 'Currency':
        case 'FloatString':
        case 'RippleAddress':
        case 'URL':
        case 'Hash128':
        case 'Hash256':
        case 'UINT32':
          return "String /*${spec['\$ref']}*/";

//        case 'UINT32':
//          return 'int /*${spec['\$ref']}*/';

        case 'Timestamp':
          return "DateTime";

        default:
          return spec['\$ref'];
      }
    } else {
      switch (spec['type']) {
        case 'UINT32':
          return "int /*${spec['type']}*/";

        case 'boolean':
          return "bool";

        case 'array':
          return "List<${spec['items']['\$ref']}>";

        default:
          return "String";
      }
    }
  }

  String _compileFromProperty(String name, Map spec) {
    if (spec.containsKey('\$ref')) {
      switch (spec['\$ref']) {
        case 'UINT32':
          // TODO: investigate if this is *really* needed!
          // TODO: this is a hack-fix for UINT32 ambiguity.
          return "map['$name'].toString()";

        case 'Timestamp':
          return "DateTime.parse(map['$name'])";

        case 'Amount':
          return "new Amount.fromMap(map['$name'])";
      }
    }
    return "map['$name']";
  }

  String _compileToProperty(String name, Map spec) {
    if (spec.containsKey('\$ref')) {
      switch (spec['\$ref']) {
        case 'Timestamp':
          return "${_toCamelCase(name, startWithLowerCase: true)}.toString()";

        case 'Amount':
          return "${_toCamelCase(name, startWithLowerCase: true)}.toMap()";
      }
    }
    return _toCamelCase(name, startWithLowerCase: true);
  }
}

const SOURCE_DIR = 'schemas';
const DESTINATION_DIR = '../lib/src';

void main() {
  final gen = new CodeGenerator();

  new Directory('schemas').listSync().forEach((f) {
    final schema = JSON.decode(new File(f.path).readAsStringSync());
    if (schema.containsKey('properties')) {
      var code = gen.generate(schema);
      print("Generating ${_toSnakeCase(schema['title'])}.dart");
      new File('$DESTINATION_DIR/${_toSnakeCase(schema['title'])}.dart').writeAsStringSync(code);
    }
  });
}