## File Modification Audit

Script PowerShell para Buscar Arquivos e Pastas Modificados Recentemente
Este script em PowerShell realiza uma busca recursiva por arquivos e pastas que foram modificados nos últimos dias em um diretório especificado. Ele gera um relatório detalhado com as informações dos itens encontrados.

Objetivo
A principal funcionalidade desse script é analisar diretórios e gerar um relatório de arquivos e pastas modificados, permitindo a rápida identificação de alterações recentes no sistema. Ideal para monitoramento e auditoria de arquivos.

Funcionalidades
Busca recursiva em diretórios e subdiretórios.
Filtra arquivos e pastas modificados nos últimos X dias (configurável).
Gera um relatório em formato .txt com informações sobre:
Nome do arquivo/pasta.
Caminho completo.
Data e hora da última modificação.
Tratamento de erros para ignorar arquivos/pastas inacessíveis.
Relatório gerado no mesmo diretório onde o script é executado.
Como Usar
Clone o repositório ou baixe o arquivo do script.
Abra o PowerShell e navegue até o diretório onde o script está localizado.
Altere a variável $rootPath para o caminho do diretório que deseja analisar (por exemplo, C:\MeusArquivos).
Configure a variável $daysToAnalyze com o número de dias que deseja analisar (por padrão, 7 dias).
Execute o script.
O relatório será salvo em um arquivo chamado Relatorio_Modificacoes.txt.

# Exemplo de Uso:
```
# Diretório a ser analisado
$rootPath = "C:\MeusArquivos"

# Número de dias para filtrar arquivos modificados recentemente
```$daysToAnalyze = 7```

# Execução do script
.\BuscarArquivosModificados.ps1
```

# Exemplo de Saída do Relatório
```
Evento           : Modificado
Nome             : Documento1.txt
Caminho Completo : C:\MeusArquivos\Documento1.txt
Data e Hora      : 2025-01-02 14:23:05

Evento           : Modificado
Nome             : Imagem.png
Caminho Completo : C:\MeusArquivos\Imagem.png
Data e Hora      : 2025-01-01 10:12:37
```
