cp -r ~/projs/esesc/conf/* ./
cp -r ~/projs/esesc/bins/* ./
riscv64-linux-gnu-g++ ./examples/Robot1/main.cpp -I  ./include/  -static -o3
