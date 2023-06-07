# Swoosh: Practical Lattice-Based Non-Interactive Key Exchange
This is the artifact for the "Swoosh: Practical Lattice-Based Non-Interactive Key Exchange" paper.

## Contents
The artifact is structured as follows:
- `/swoosh`: optimized Rust implememtation of Passive-Swoosh 
  - `/src/aesenc-int.c`: Romain Dolbeau's AES256-CTR implementation from SUPERCOP20221122
- `/security`
  - `swoosh_estimator.py`: Sage script for estimating the security of Passive-Swoosh using lattice-estimator
  - `/estimator`:  the lattice-estimator version used for the security estimates of Passive-Swoosh

## Contributions
The main contributions of this artifact are:
- Optimized implememtation of Passive-Swoosh, a Lattice-based Non-Interactive Key Exchange
- Sage script to estimate security of Passive-Swoosh

## Installing Rust & Sage
To install Rust & Sage run the following commands in the artifact directory:

```
apt-get install sagemath  # on macOS: brew install sage
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
pip install -r security/requiments.txt
```

For more information on Rust installation see: https://www.rust-lang.org/tools/install.
For more information on Sage installation see: https://doc.sagemath.org/html/en/installation.

**Remarks:** please note that Rust should be at least on verion 1.59. For this work, Rust
             version 1.62 was used.

Alternatively, this artifact contains a Dockerfile which sets up a container with Rust and
Sage along with the contents of the artifact.
For information on the installation of Docker see https://docs.docker.com/get-docker/.
To setup Rust and Sage using Docker run:

```
docker build -t swoosh .
docker run -it swoosh
```

to build and run the container.

**Remarks:** please note that running benchmarks inside a container will impact the measurements.

## Benchmarking
Requirements: Rust compiler
The `code/swoosh` directory contains the Rust implementation of Passive-Swoosh.
To run the full benchmark (key generation, key derivation, internal functions) execute
the following command:
```
make bench_full
```

To run only the benchmarks for Passive-Swoosh execute the following command:
```
make bench_scheme
```

Additionally, the unit tests for the scheme can be run with:
```
make test
```

which will run all the tests.
And:

```
make test_scheme
```
which will a basic correctness test for the scheme.

To change the number of iterations for each benchmark, change the value of
`pub const NRUNS: usize = 10000;` in `swoosh/src/util.rs`.


## Security Estimate
Requirements: Sage

The `security` directory contains the lattice-estimator Sage module as well as a Sage
script (`swoosh_estimator.py`) that estimates the security of Passive-Swoosh with the
estimator.
To run this estimates use the following command:
```
sage swoosh_estimator.py
```
