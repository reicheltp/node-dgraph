const grpc = require('grpc');

// load proto
const protos = grpc.load('./protos/graphp/graphresponse.proto');
const { Dgraph, Request, NQuad, Mutation, Value } = protos.graphp;

// create new client instance
const dgraph = new Dgraph('localhost:8080', grpc.credentials.createInsecure());

// set mutation
let setReq = new Request();
setReq.mutation = new Mutation();

// a string nquad
let nqName = new NQuad();
nqName.subject = 'paul';
nqName.predicate = 'name';
nqName.objectValue = new Value().set('str_val', 'Paul Reichelt');
nqName.objectType = 10;

// a float nquad
let nqAge = new NQuad();
nqAge.subject = 'paul';
nqAge.predicate = 'size';
nqAge.objectValue = new Value().set('double_val', 1.85);
nqAge.objectType = 3;

// add all the mutations
setReq.mutation.set.push(nqName);
setReq.mutation.set.push(nqAge);

// run set and if successful then run query
dgraph.run(setReq, (err, res) => {
  if(err){
    console.log(err);
    return;
  }

  // query data
  let queryReq = new Request();
  queryReq.query = "query { me(id:paul) { name, size } }";

  dgraph.run(queryReq, (err, res) => {
    // get me
    let me = res.n[0].children[0];

    // list all properties
    me.properties.forEach(function (prop) {
      console.log(prop.prop + ": " + prop.value[prop.value.val]);
    });
  });

});

