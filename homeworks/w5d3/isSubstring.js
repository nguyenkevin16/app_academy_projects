let string_one = 'hello';
let string_two = 'ello';

let isSubstring = (searchString, subString) => {
  return searchString.includes(subString);
};

isSubstring(string_one, string_two);
