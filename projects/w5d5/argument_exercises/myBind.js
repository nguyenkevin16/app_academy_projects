Function.prototype.myBind = function() {
  let bindArgs = Array.prototype.slice.call(arguments, 1, arguments.length);
  let context = arguments[0];

  let that = this;
  return function() {
    that.apply(context, bindArgs.concat(Array.prototype.slice.call(arguments)));
  };
};

// Function.prototype.myBind = function (first, ...bindArgs) {
//   return (...callArgs) => {
//     this.apply(first, bindArgs.concat(callArgs));
//   };
// };

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

console.log(Function.prototype.myBind);

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "me"
markov.says.myBind(breakfast)("meow", "a tree");
// Breakfast says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(breakfast, "meow")("Markov");
// Breakfast says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(breakfast);
notMarkovSays("meow", "me");
// Breakfast says meow to me!
// true
