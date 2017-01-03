function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function() {
  const str = `${this.owner} loves ${this.name}.`;
  console.log(str);
  return str;
};



const cat1 = new Cat('Henry', 'Torah');
const cat2 = new Cat('Buster', 'Kevin');

cat1.cuteStatement();
cat2.cuteStatement();

Cat.prototype.cuteStatement = function() {
  const str = `Everyone loves ${this.name}.`;
  console.log(str);
  return str;
};

cat1.cuteStatement();
cat2.cuteStatement();

Cat.prototype.meow = function() {
  const str = `${this.name} goes "MEEEOW!"`;
  console.log(str);
  return str;
};

cat1.meow();
cat2.meow();

Cat.meow = function() {
  const str = `${this.name} goes "BARK bark!"`;
  console.log(str);
  return str;
};

cat1.meow();
cat2.meow();

Cat.meow();
console.log(Cat);

const cat3 = new Cat('Luke', "Skywalker");
cat3.meow();
