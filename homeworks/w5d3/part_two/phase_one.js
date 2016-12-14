let printCallback = (array) => {
  array.forEach((el) => console.log(el));
};

let titleize = (names, cb) => {
  let new_array = names.map(function(name) {
    return `Mx. ${name} Jingleheimer Schmidt`;
  });

  cb(new_array);
};

// titleize(["Mary", "Brian", "Leo"], printCallback);

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  return console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function() {
  this.height += 12;
};

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function() {
  let trick = this.tricks[Math.floor(Math.random() * this.tricks.length)];
  return console.log(`${this.name} is ${trick}`);
};

// let bobo = new Elephant("bobo", 12, ["runs in circles"]);
