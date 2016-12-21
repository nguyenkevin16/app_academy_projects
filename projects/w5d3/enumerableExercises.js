Array.prototype.myEach = function(callBack) {
  for (let i = 0; i < this.length; i++) {
    callBack(this[i]);
  }

  return this;
};

// [1,2,3,4,5].myEach((el) => {
//   console.log(el * 2);
// });

Array.prototype.myMap = function(callBack) {
  const newArr = [];

  this.myEach((el) => { newArr.push(callBack(el)); });

  return newArr;
};

// console.log([1,2,3,4,5].myMap((el) => {
//   return el * 3;
// }));

Array.prototype.myInject = function(callback) {
  let acc = this[0];
  const remArr = this.slice(1, this.length);

  remArr.myEach((el) => {
    acc = callback(acc, el);
  });
  return acc;
};

console.log([1,2,3,4].myInject((a, b) => { return a + b; }));
