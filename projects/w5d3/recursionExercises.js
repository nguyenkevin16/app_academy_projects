function range(start, end) {
  if (start > end) { return []; }

  return [start].concat(range(start + 1, end));
}

// console.log(range(6, 5));

function sumArr(array) {
  if (array.length === 0) { return 0; }
  if (array.length === 1) { return array[0]; }

  return array[0] + sumArr(array.slice(1, array.length));
}

// console.log(sumArr(range(1, 5)));
// console.log(sumArr([]));

function expOne(base, exp) {
  if (exp < 0) { return 1 / expOne(base, -exp); }
  if (exp === 0) { return 1; }

  return base * expOne(base, exp - 1);
}

// console.log(expOne(2, -1));

function expTwo(base, exp) {
  if (exp < 0) { return 1 / expTwo(base, -exp); }
  if (exp === 0) { return 1; }
  if (exp === 1) { return base; }

  if (exp & 1) {
    return base * Math.pow(expTwo(base, (exp - 1) / 2), 2);
  } else {
    return Math.pow(expTwo(base, exp / 2), 2);
  }
}

// console.log(expTwo(2, 2));
// console.log(expTwo(2, 6));
// console.log(expTwo(2, 7));

function fibIt(n) {
  const fibArr = [1, 1];

  while (fibArr.length < n) {
    fibArr.push(fibArr[fibArr.length - 2] + fibArr[fibArr.length - 1]);
  }

  return fibArr;
}

// console.log(fibIt(10));

function fibRec(n) {
  if (n <= 0) { return []; }
  if (n === 1) { return [1]; }
  if (n === 2) { return [1, 1]; }

  const fibArr = fibRec(n-1);
  return fibArr.concat(fibArr[fibArr.length - 2] + fibArr[fibArr.length - 1]);
}

// console.log(fibRec(9));

function bSearch(array, target) {
  if (array.length === 0) { return -1; }
  if (array.length === 1 && array[0] !== target) { return -1; }

  const mid = Math.floor(array.length / 2);
  if (array[mid] === target) {
    return mid;
  } else if(array[mid] > target) {
    return bSearch(array.slice(0, mid), target);
  } else {
    const rightHalf = bSearch(array.slice(mid + 1, array.length), target);

    if (rightHalf === -1) { return -1; }
    return mid + 1 + bSearch(array.slice(mid + 1, array.length), target);
  }
}

// console.log(bSearch([1, 2, 3], 1));
// console.log(bSearch([2, 3, 4, 5], 3));
// console.log(bSearch([2, 4, 6, 8, 10], 6));
// console.log(bSearch([1, 3, 4, 5, 9], 5));
// console.log(bSearch([1, 2, 3, 4, 5, 6], 6) );
// console.log(bSearch([1, 2, 3, 4, 5, 6], 0));
// console.log(bSearch([1, 2, 3, 4, 5, 7], 6));

function makeChange(total, coinsArr) {
  if (total <= 0) { return []; }

  for (let i = 0; i < coinsArr.length; i++) {
    if (total >= coinsArr[i]) {
      total -= coinsArr[i];
      return [coinsArr[i]].concat(makeChange(total, coinsArr.slice(i, coinsArr.length)));
    }
  }
}

function makeBetterChange(total, coinsArr) {
  if (total <= 0) { return []; }
  let bestChange = makeChange(total, coinsArr);

  for (let i = 1; i < coinsArr.length; i++) {
    let nextBestChange = makeChange(total, coinsArr.slice(i, coinsArr.length));
    if (bestChange.length > nextBestChange.length) {
      bestChange = nextBestChange;
    }
  }

  return bestChange;
}

// function makeRecChange(total, coinsArr) {
//   if (total <= 0) { return []; }
//   let bestChange = makeChange(total, coinsArr);
//
//   function recChange() {
//
//   }
// }

// console.log(makeBetterChange(53, [25, 10, 5, 1]));
// console.log(makeBetterChange(14, [10, 7, 1]));
// console.log(makeBetterChange(24, [10, 7, 1]));

function mergeSort(array) {
  if (array.length < 2) { return array; }

  const mid = Math.floor(array.length / 2);
  if (mid === 0) { mid += 1; }
  let left = mergeSort(array.slice(0, mid));
  let right = mergeSort(array.slice(mid, array.length));

  console.log(left);
  console.log(right);

  const retArr = [];

  while (left.length !== 0 || right.length !== 0) {
    if (left[0] < right[0]) {
      retArr.concat(left.shift);
    } else {
      retArr.concat(right.shift);
    }
  }

  return retArr.concat(left).concat(right);
}

console.log(mergeSort([3,4,6,7,3]));
