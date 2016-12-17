// Function.prototype.curry =

const curriedSum = function(numArgs) {
  const numbers = [];
  let total = 0;

  function _curriedSum(num) {
    numbers.push(num);

    if (numbers.length === numArgs) {
      numbers.forEach((el) => { total += el; });
      return total;
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
};

// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1));

Function.prototype.curry = function(numArgs) {
  const args = [];
  // console.log(arguments);
  if (args.length === 0) {
    args.push(0);
    console.log(args.length);
    return this.curry;
  } else if (args.length <= numArgs) {
    takeArgs(numArgs);
    return this.curry;
  } else {
    return this.apply(null, args);
  }

  function takeArgs(arg) {
    args.push(arg);
  }
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1(4); // [Function]
// f1(20); // [Function]
// f1(6); // = 30
// console.log(f1);
