.PHONY: all csharp go rust zig

all: csharp go rust zig

csharp:
	-mkdir ./libs
	dotnet publish ./csharp/csharp.csproj -r linux-x64
	cp ./csharp/bin/Release/net9.0/linux-x64/native/libcsharp.a ./libs/

go:
	go build -C ./go -buildmode=c-archive -ldflags="-w -s"
	cp ./go/libgo.a ./libs/

rust:
	cd ./rust && cargo build --release
	cp ./rust/target/release/librust.a ./libs/

zig:
	cd ./zig && zig build -Doptimize=ReleaseSmall
	cp ./zig/zig-out/lib/libzig.a ./libs/

