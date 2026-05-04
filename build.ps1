# Lambda Layer 빌드 스크립트 (Windows)
# 사용법: PowerShell에서 .\build.ps1 실행

Write-Host "Lambda Layer 빌드 시작..." -ForegroundColor Cyan

# 1. 기존 빌드 결과 정리
if (Test-Path "python") { Remove-Item -Recurse -Force "python" }
if (Test-Path "lambda-layer.zip") { Remove-Item -Force "lambda-layer.zip" }

# 2. python 폴더에 패키지 설치
Write-Host "패키지 설치 중..." -ForegroundColor Yellow
pip install -r requirements.txt -t python/ --upgrade

# 3. zip 압축
Write-Host "zip 압축 중..." -ForegroundColor Yellow
Compress-Archive -Path "python" -DestinationPath "lambda-layer.zip"

# 4. 완료
$size = (Get-Item "lambda-layer.zip").Length / 1MB
Write-Host "빌드 완료! 파일 크기: $([math]::Round($size, 2)) MB" -ForegroundColor Green
Write-Host "AWS Lambda Layer로 업로드: lambda-layer.zip" -ForegroundColor Green