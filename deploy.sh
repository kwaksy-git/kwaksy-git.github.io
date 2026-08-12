#!/usr/bin/env bash
# 부캐 포폴 재배포: 마스터(career-log) → 배포 repo → GitHub Pages
set -e
SRC="$HOME/career-log/personal-branding/portfolio/index.html"
DST="$HOME/Works/portfolio-site/index.html"
cp "$SRC" "$DST"
cd "$HOME/Works/portfolio-site"
git add -A
if git diff --cached --quiet; then echo "변경 없음 — 배포 생략"; exit 0; fi
git commit -qm "Update portfolio $(date +'%F %H:%M')"
git push -q origin main
echo "✅ 배포 완료 → https://kwaksy-git.github.io/ (반영 1~2분)"
