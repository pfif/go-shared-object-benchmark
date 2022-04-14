count := 0
go_add.so:
	go build -buildmode=c-shared -o go_add.so go_add.go

c_add.so:
	cc -shared -o c_add.so c_add.c

main_with_c:
	cc main.c c_add.so -o main_with_c

main_with_go:
	cc main.c go_add.so -o main_with_go

build: go_add.so c_add.so main_with_c main_with_go

run: build
	time ./main_with_c 10
	time ./main_with_go 10
	echo

	time ./main_with_c 100000
	time ./main_with_go 100000
	echo

	time ./main_with_c 1000000
	time ./main_with_go 1000000
	echo

	time ./main_with_c 2000000
	time ./main_with_go 2000000
