RUSTFLAGS=-Awarnings

# --------------------------------------------------------------------
.PHONY: bench_full bench_scheme test_scheme

default: check

bench_full:
	@cd swoosh && RUSTFLAGS=-Awarnings cargo run --bin bench_full

bench_scheme:
	@cd swoosh && RUSTFLAGS=-Awarnings cargo run --bin bench_scheme

test_scheme: 
	@cd swoosh && RUSTFLAGS=-Awarnings RUST_MIN_STACK=1048576000 cargo test test_scheme -- --show-output

test: 
	@cd swoosh && RUSTFLAGS=-Awarnings RUST_MIN_STACK=1048576000 cargo test test -- --show-output
