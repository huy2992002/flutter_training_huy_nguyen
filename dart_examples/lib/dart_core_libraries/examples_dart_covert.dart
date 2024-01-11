//import library dart:convert
import 'dart:convert';
void main(List<String> args) {
  //Encoders and decoders for converting between different data representations, including JSON and UTF-8.
  var encoded = utf8.encode('Îñţérñåţîöñåļîžåţîờñ'); //[195, 142, 195, 177, 197, 163, 195, 169, 114, 195, 177, 195, 165, 197, 163, 195, 174, 195, 182, 195, 177, 195, 165, 196, 188, 195, 174, 197, 190, 195, 165, 197, 163, 195, 174, 225, 187, 157, 195, 177]
  var decoded = utf8.decode([
    195, 142, 195, 177, 197, 163, 195, 169, 114, 195, 177, 195, 165, 197,
    163, 195, 174, 195, 182, 195, 177, 195, 165, 196, 188, 195, 174, 197,
    190, 195, 165, 197, 163, 195, 174, 225, 187, 157, 195, 177]); // Îñţérñåţîöñåļîžåţîờñ

  print(encoded);
  print(decoded);  
}

