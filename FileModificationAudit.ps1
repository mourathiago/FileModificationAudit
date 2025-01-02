# Este script em PowerShell realiza uma varredura recursiva no diretório especificado, para identificar arquivos e pastas que foram modificados num periodo.

# Definir o diretório raiz para buscar os arquivos (pode ser alterado conforme necessário)
$rootPath = "A:\"  # Caminho principal para análise
$daysToAnalyze = 7  # Número de dias para filtrar arquivos e pastas modificados recentemente

# Obter a pasta onde o script está sendo executado
$currentScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$reportPath = Join-Path -Path $currentScriptPath -ChildPath "Relatorio_Modificacoes.txt"

# Data limite para filtrar os arquivos e pastas
$dateLimit = (Get-Date).AddDays(-$daysToAnalyze)

# Inicializar um array para armazenar os resultados
$result = @()

# Função para buscar recursivamente arquivos e pastas modificados
Write-Host "Buscando arquivos e pastas modificados a partir de $dateLimit no diretório $rootPath..."

Get-ChildItem -Path $rootPath -Recurse -Force -ErrorAction SilentlyContinue | ForEach-Object {
    try {
        # Verificar se o item foi modificado após a data limite
        if ($_.LastWriteTime -ge $dateLimit) {
            # Adicionar ao array com formato customizado
            $result += @"
Evento           : Modificado
Nome             : $($_.Name)
Caminho Completo : $($_.FullName)
Data e Hora      : $($_.LastWriteTime.ToString('yyyy-MM-dd HH:mm:ss'))

"@
        }
    } catch {
        # Ignorar erros, como acesso negado
        Write-Host "Erro ao acessar $_.FullName. Ignorando..."
    }
}

# Verificar se houve resultados
if ($result.Count -gt 0) {
    # Salvar os resultados no relatório
    $result | Out-File -FilePath $reportPath -Encoding UTF8
    Write-Host "Relatório gerado com sucesso: $reportPath"
} else {
    Write-Host "Nenhum arquivo ou pasta modificado nos últimos $daysToAnalyze dias foi encontrado no diretório $rootPath."
}
