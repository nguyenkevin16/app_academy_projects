let fizzBuzz = function fizzBuzz(array) {
  var bucket = [];

  for (let i = 0; i < array.length; i++) {
    if ((array[i] % 3 === 0 || array[i] % 5 === 0)
      && (array[i] % 3 === 0 && array[i] % 5 === 0)) {

      bucket.push(array[i]);
    }
  }

  return bucket;
};

fizzBuzz([1,2,3,4,5]);
