#!/bin/zsh

echo "============================================="
echo "       256 Terminal Colors & Codes"
echo "============================================="

echo ""
echo "--- Standard Colors (0-15) ---"
for i in {0..15}; do
  printf "\e[48;5;${i}m %3d \e[0m" "$i"
  if (( (i + 1) % 8 == 0 )); then
    echo ""
  fi
done

echo ""
echo "--- 216 Color Cube (16-231) ---"
for i in {16..231}; do
  printf "\e[48;5;${i}m %3d \e[0m" "$i"
  if (( (i - 15) % 6 == 0 )); then
    echo ""
  fi
done

echo ""
echo "--- Grayscale (232-255) ---"
for i in {232..255}; do
  printf "\e[48;5;${i}m %3d \e[0m" "$i"
  if (( (i - 231) % 6 == 0 )); then
    echo ""
  fi
done
echo ""

echo ""
echo "--- Foreground Colors (text) ---"
for i in {0..15}; do
  printf "\e[38;5;${i}m color %3d \e[0m" "$i"
  if (( (i + 1) % 4 == 0 )); then
    echo ""
  fi
done
