# Servidor HTTP ultraligero nativo de PowerShell (sin dependencias)
$port = 3000
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()

Write-Host "=====================================================" -ForegroundColor Green
Write-Host " Servidor local activo en: http://localhost:$port/" -ForegroundColor Cyan
Write-Host " Presiona Ctrl+C en esta ventana para cerrar." -ForegroundColor Yellow
Write-Host "=====================================================" -ForegroundColor Green

Start-Process "http://localhost:$port/index.html"

$baseDir = $PSScriptRoot

$mimeTypes = @{
    ".html" = "text/html; charset=utf-8"
    ".css"  = "text/css; charset=utf-8"
    ".js"   = "application/javascript; charset=utf-8"
    ".jpg"  = "image/jpeg"
    ".jpeg" = "image/jpeg"
    ".png"  = "image/png"
    ".svg"  = "image/svg+xml"
    ".mp4"  = "video/mp4"
}

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $rawUrl = $request.Url.LocalPath
        if ($rawUrl -eq "/") { $rawUrl = "/index.html" }
        $filePath = Join-Path $baseDir ($rawUrl.TrimStart("/").Replace("/", [IO.Path]::DirectorySeparatorChar))

        if (Test-Path $filePath -PathType Leaf) {
            $ext = [IO.Path]::GetExtension($filePath).ToLower()
            $response.ContentType = if ($mimeTypes.ContainsKey($ext)) { $mimeTypes[$ext] } else { "application/octet-stream" }
            $response.AddHeader("Cache-Control", "public, max-age=86400")
            
            $bytes = [IO.File]::ReadAllBytes($filePath)
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $response.StatusCode = 404
            $buffer = [Text.Encoding]::UTF8.GetBytes("Archivo no encontrado")
            $response.ContentLength64 = $buffer.Length
            $response.OutputStream.Write($buffer, 0, $buffer.Length)
        }
        $response.OutputStream.Close()
    }
} finally {
    $listener.Stop()
}
