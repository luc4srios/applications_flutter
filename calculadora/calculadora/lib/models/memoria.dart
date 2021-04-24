class Memory {
  static const operacoes = const ['%', '+', '-', '*', '/', '='];

  String _valor = '0';
  final _buffer = [0.0, 0.0];
  String _operacao;
  int _bufferIndex = 0;
  bool _wipeValue = false;
  String _lastCommand;

  void applyCommand(String comando) {
    if (_isSubstituiOperacao(comando)) {
      _operacao = comando;
      return;
    }

    if (comando == 'C') {
      _limparTudo();
    } else if (operacoes.contains(comando)) {
      _setOperacao(comando);
    } else {
      _adicionaDigito(comando);
    }

    _lastCommand = comando;
  }

  _setOperacao(String novaOperacao) {
    bool isEqualsSign = novaOperacao == '=';
    if (_bufferIndex == 0) {
      if (!isEqualsSign) {
        _operacao = novaOperacao;
        _bufferIndex = 1;
        _wipeValue = true;
      }
    } else {
      _buffer[0] = _calcula();
      _buffer[1] = 0.0;
      _valor = _buffer[0].toString();
      _valor = _valor.endsWith('.0') ? _valor.split('.')[0] : _valor;

      _operacao = isEqualsSign ? null : novaOperacao;
      _bufferIndex = isEqualsSign ? 0 : 1;
    }

    _wipeValue = true;
  }

  _adicionaDigito(String digito) {
    final isPonto = digito == '.';
    final wipeValue = (_valor == '0' && !isPonto) || _wipeValue;

    if (isPonto && _valor.contains('.') && !wipeValue) {
      return;
    }

    final emptyValue = isPonto ? '0' : '';

    final currentValue = wipeValue ? emptyValue : _valor;
    _valor = currentValue + digito;
    _wipeValue = false;

    _buffer[_bufferIndex] = double.tryParse(_valor) ?? 0;
  }

  _limparTudo() {
    _valor = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operacao = null;
    _wipeValue = false;
  }

  _isSubstituiOperacao(String comando) {
    return operacoes.contains(_lastCommand) &&
        operacoes.contains(comando) &&
        _lastCommand != '=' &&
        comando != '=';
  }

  String get valor {
    return _valor;
  }

  _calcula() {
    switch (_operacao) {
      case '+':
        return _buffer[0] + _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '*':
        return _buffer[0] * _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case '%':
        return _buffer[0] % _buffer[1];
      default:
        return [0];
    }
  }
}
