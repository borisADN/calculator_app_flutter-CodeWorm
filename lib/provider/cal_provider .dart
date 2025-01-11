import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalculatorProvider extends ChangeNotifier {
  final compController = TextEditingController();

  setValue(String value) {
    String str = compController.text;

    switch (value) {
      case 'C':
        compController.clear();
        break;
      case 'AC':
        compController.text = str.substring(0, str.length - 1);
        break;
      case 'X':
        compController.text += '*';
        break;
      case '=':
        compute();
        break;
      default:
        compController.text += value;
    }
    // selectionne le texte apres chaque ajout de caractere
    // utile pour la visibilite du curseur
    compController.selection = TextSelection.fromPosition(
      TextPosition(offset: compController.text.length),
    );
  }

  /// Compute the expression in the text field and replace the text with the result
  void compute() {
    String text = compController.text;
    compController.text = text.interpret().toString();
  }


  /// Methode appelee lorsque le provider est detruit. Elle est appelee
  /// automatiquement par le framework lorsque le provider est detache de
  /// l'arbre d'etats.
  ///
  /// Elle permet de liberer les ressources utilisees par le provider.
  ///
  /// Dans ce cas, on libere le controleur de texte qui a ete cree
  /// dans le constructeur.
  @override
  void dispose() {
    super.dispose();
    compController.dispose();
  }
}


