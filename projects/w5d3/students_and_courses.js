function Student(first, last) {
  this.first = first;
  this.last = last;
  this.courses = [];
}

Student.prototype.name = function() {
  return `${this.first} ${this.last}`;
};

Student.prototype.courses = function() {
  return this.courses;
};

Student.prototype.enroll = function(course) {
  if (!this.courses.includes(course)) {
    this.courses.push(course);
    course.addStudent(this);
  }
};

Student.prototype.courseLoad = function() {
  const cLoad = {};

  this.courses.forEach((course) => {
    if (cLoad[course.department]) {
      cLoad[course.department] += course.credits;
    } else {
      cLoad[course.department] = course.credits;
    }
  });
  return cLoad;
};

function Course(name, department, credits, days, time) {
  this.name = name;
  this.department = department;
  this.credits = credits;
  this.enrolledStudents = [];
  this.days = days;
  this.time = time;
}

Course.prototype.addStudent = function(student) {
  this.enrolledStudents.push(student);
};

Course.prototype.students = function() {
  return this.enrolledStudents;
};

Course.prototype.conflictsWith = function(otherCourse) {
  let hasConflict = false;

  this.days.forEach((day) => {
    if (otherCourse.days.includes(day) && otherCourse.time === this.time) {
      hasConflict = true;
      return;
    }
  });

  return hasConflict;
};

const s = new Student('Buster', 'Douglas');
const c = new Course('Boxing', 'P.E.', 3, ['Mon', 'Tue', 'Thur'], 3);
const c2 = new Course('Rugby', 'P.E.', 9000, ['Wed', 'Fri'], 3);
const c3 = new Course('Rowing', 'P.E.', 100, ['Mon', 'Fri'], 3);
s.enroll(c);
s.enroll(c2);
