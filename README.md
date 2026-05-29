# ☁️ lambda-layer

> 소상공인 AI 통화 요약 서비스의 **AWS Lambda Layer** — Python 의존성 패키징

[📖 메인 README](https://github.com/seongminj0613-tech/business-ai-assistant) 

[모니터링 대시보드](http://15.165.17.218:3000/public-dashboards/97b5462a12b54bf9b827b07eeee699f4)

[🌐 웹 데모](https://dk1k75g0ji3vw.cloudfront.net) 

[📱 APK 다운로드](https://drive.google.com/file/d/1jJNRF2CCVcCKSpdIPUODjWL6F5exxJ-T/view?usp=sharing) 

[🐍 Backend 레포](https://github.com/seongminj0613-tech/ai-call-assistant)

---

## 🎯 역할

본 레포는 [백엔드 Lambda 함수](https://github.com/seongminj0613-tech/ai-call-assistant)에서 사용하는 **공통 Python 의존성을 Lambda Layer로 패키징**합니다.

Lambda 함수 코드와 의존성을 분리하면:
- 배포 패키지 크기 감소 → 콜드 스타트 단축
- 의존성 업데이트 시 함수 코드 재배포 불필요
- 여러 Lambda 함수에서 동일 레이어 공유 가능

---

## 📦 포함된 패키지

| 패키지 | 버전 | 용도 |
|--------|------|------|
| `firebase-admin` | 7.4.0 | Firebase Custom Token 발급 + ID Token 검증 |
| `pymysql` | 1.1.2 | RDS MySQL 연결 |
| `requests` | 2.33.1 | CLOVA Speech / OpenAI / Kakao API 호출 |

> Python 표준 라이브러리(`boto3`, `json` 등)는 Lambda 런타임에 기본 포함되므로 본 레이어에서 제외.

---

## 🛠 빌드 방법

### Windows (PowerShell)
```powershell
.\build.ps1
```

### Linux / macOS
```bash
chmod +x build.sh
./build.sh
```

빌드 완료 시 프로젝트 루트에 `lambda-layer.zip`이 생성됩니다.

---

## ☁️ AWS Lambda Layer 등록

1. AWS Console → **Lambda → Layers** → **Create layer**
2. 이름: `python-deps-layer`
3. `lambda-layer.zip` 업로드
4. 호환 런타임: **Python 3.12**
5. 호환 아키텍처: **x86_64**

등록 후 Lambda 함수에서 **Layers → Add a layer**로 연결.

---

## ⚠️ 빌드 환경 주의사항

- **Python 3.12**에서 빌드 권장 (Lambda 런타임과 일치)
- **Linux 환경 빌드를 권장**합니다. Lambda는 Amazon Linux 환경에서 실행되므로, 네이티브 확장 모듈(예: C 확장)이 포함된 패키지는 Linux에서 빌드해야 호환성이 보장됩니다.
- Windows에서 빌드 시 일부 패키지(예: `cryptography`)에서 ABI 불일치로 import 에러가 발생할 수 있습니다. 이 경우 Docker 또는 WSL2 Linux 환경에서 빌드하세요.

---

## 🔗 관련 저장소

| 저장소 | 설명 |
|--------|------|
| [business-ai-assistant](https://github.com/seongminj0613-tech/business-ai-assistant) | 📖 메인 통합 문서 |
| [ai-call-assistant](https://github.com/seongminj0613-tech/ai-call-assistant) | 🐍 Backend (이 레이어를 사용) |
| [ai-call-assistant-web](https://github.com/seongminj0613-tech/ai-call-assistant-web) | 🌐 Web |
| [call-recorder-android](https://github.com/seongminj0613-tech/call-recorder-android) | 📱 Android |
| **이 저장소** (`lambda-layer`) | ☁️ Lambda Layer (이 레포) |

---

## 📄 라이선스

부트캠프 학습 프로젝트입니다. 코드 참고·학습 목적의 열람은 자유이나, 본 서비스의 아키텍처·디자인·문서를 무단으로 상업적 목적에 재이용하지 않기를 부탁드립니다.
