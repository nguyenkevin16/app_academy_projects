// Mystery Scoping with var, let, const
//
// Test out each of following functions in Node. What does each log to
// the console? Do any of them throw errors? See if you can figure out why.

// Functionally scoped variable declarations (var) persist down
function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// Constant variable declarations are block-scoped like 'let'
// i.e. Only exist in the scope of the block its defined
function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// throws error because it tries to redeclare the same variable name
function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// works as intended
// let block-scopes variables so they only exist where they were defined
function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// Trying to redeclare an already declared variable x throws an error
function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}




let madlib = function(verb, adjective, noun) {
  return `We shall ${verb} the ${adjective} ${noun}`;
};





let string_one = 'hello';
let string_two = 'ello';

let isSubstring = (searchString, subString) => {
  return searchString.includes(subString);
};

isSubstring(string_one, string_two);
