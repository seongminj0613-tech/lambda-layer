#!/bin/bash
# Lambda Layer 빌드 스크립트 (Linux/Mac)
# 사용법: chmod +x build.sh && ./build.sh

echo "Lambda Layer 빌드 시작..."

# 1. 기존 빌드 결과 정리
rm -rf python lambda-layer.zip

# 2. python 폴더에 패키지 설치
echo "패키지 설치 중..."
pip install -r requirements.txt -t python/ --upgrade

# 3. zip 압축
echo "zip 압축 중..."
zip -r lambda-layer.zip python

# 4. 완료
echo "빌드 완료!"
ls -lh lambda-layer.zip
echo "AWS Lambda Layer로 업로드: lambda-layer.zip"