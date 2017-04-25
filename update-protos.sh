#!/usr/bin/env bash
# Download the protos directly from dgraph repository

rm -rf ./github.com/

mkdir -p ./github.com/dgraph-io/dgraph/protos/facetsp
curl https://raw.githubusercontent.com/dgraph-io/dgraph/release/v0.7.5/protos/facetsp/facets.proto \
> ./github.com/dgraph-io/dgraph/protos/facetsp/facets.proto

mkdir -p ./github.com/dgraph-io/dgraph/protos/graphp
curl https://raw.githubusercontent.com/dgraph-io/dgraph/release/v0.7.5/protos/graphp/graphresponse.proto \
> ./github.com/dgraph-io/dgraph/protos/graphp/graphresponse.proto

mkdir -p ./github.com/dgraph-io/dgraph/protos/taskp
curl https://raw.githubusercontent.com/dgraph-io/dgraph/release/v0.7.5/protos/taskp/task.proto \
> ./github.com/dgraph-io/dgraph/protos/taskp/task.proto

mkdir -p ./github.com/dgraph-io/dgraph/protos/typesp
curl https://raw.githubusercontent.com/dgraph-io/dgraph/release/v0.7.5/protos/typesp/types.proto \
> ./github.com/dgraph-io/dgraph/protos/typesp/types.proto

mkdir -p ./github.com/dgraph-io/dgraph/protos/workerp
curl https://raw.githubusercontent.com/dgraph-io/dgraph/release/v0.7.5/protos/workerp/payload.proto \
> ./github.com/dgraph-io/dgraph/protos/workerp/payload.proto