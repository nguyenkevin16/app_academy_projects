let fizzBuzz = function fizzBuzz(array) {
  var bucket = [];

  for (let i = 0; i < array.length; i++) {
    if (array[i] % 3 === 0 || array[i] % 5 === 0) {
      if (array[i] % 3 === 0 && array[i] % 5 === 0) { continue; }

      bucket.push(array[i]);
    }
  }

  return bucket;
};

let isPrime = function isPrime(number) {
  if (number === 2) { return true; }

  for (let i = 2; i < number; i++) {
    if (number % i === 0) { return false; }
  }

  return true;
};

let sumOfNPrimes = (n) => {
  let firstNPrimes = (num) => {
    let bucket = [];
    let i = 2;

    while (bucket.length < num) {
      if (isPrime(i)) { bucket.push(i); }
      i++;
    }

    return bucket;
  };

  var sum = 0;
  firstNPrimes(n).forEach((el) => { sum += el; });
  return sum;
};

let allOrNothing = (mod, ...others) => {

  for (let el of others) {
    if (el % mod !== 0) { return false; }
  }

  return true;
};

allOrNothing(3, 9, 12, 6);
allOrNothing(5, 1, 2, 10);
