# Lambda Layer

소상공인 AI 통화 비서 - AWS Lambda Layer

## 📦 포함된 패키지

| 패키지 | 버전 | 용도 |
|--------|------|------|
| firebase-admin | 7.4.0 | Firebase 인증 |
| pymysql | 1.1.2 | MySQL 연결 |
| requests | 2.33.1 | HTTP 요청 |

## 🛠 빌드 방법

### Windows
```powershell
.\build.ps1
```

### Linux / Mac
```bash
chmod +x build.sh
./build.sh
```

빌드가 완료되면 `lambda-layer.zip` 파일이 생성됩니다.

## ☁️ AWS Lambda Layer 등록

1. AWS Console → Lambda → Layers → "Create layer"
2. 이름: `python-deps-layer`
3. `lambda-layer.zip` 업로드
4. 호환 런타임: Python 3.12

## 📝 주의사항

- Python 3.12 환경에서 빌드 권장
- Linux 환경에서 빌드한 결과를 사용하는 것이 안전 (Lambda는 Linux 환경)
- Windows에서 빌드 시 호환성 문제 발생 가능