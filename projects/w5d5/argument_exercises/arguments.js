function sum () {
  let total  = 0;
  for (let i = 0; i < arguments.length; i++) {
    total += arguments[i];
  }
  return total;
}

function sum2(...nums) {
  let total  = 0;
  for (let i = 0; i < nums.length; i++) {
    total += nums[i];
  }
  return total;
}
