.PHONY: all go rust zig run

all: run

go:
	go build -C ./go -buildmode=c-archive -ldflags="-w -s"
	cp ./go/libgo.a ./libs/

rust:
	cd ./rust && RUSTFLAGS="-Zlocation-detail=none -Zfmt-debug=none" cargo +nightly build --release \
		-Z build-std=std,panic_abort \
		-Z build-std-features="optimize_for_size,panic_immediate_abort"
	cp ./rust/target/release/librust.a ./libs/

zig:
	cd ./zig && zig build -Doptimize=ReleaseSmall
	cp ./zig/zig-out/lib/libzig.a ./libs/

run: go rust zig
	clang -c ./test/main.c -o ./test/main.o
	clang -static ./test/main.o -L./libs -lgo -lrust -lzig -o ./test/test
	./test/test
