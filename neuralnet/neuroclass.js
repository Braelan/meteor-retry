"use strict"
var Unit = function(value, grad) {
  this.value = value;
  this.grad = grad;
}

var multiplyGate = function() {};

multiplyGate.prototype = {
  forward: function(u0, u1) {
    this.u0 = u0;
    this.u1 = u1;
    this.utop = new Unit(u0.value*u1.value, 0.0);
    return this.utop;
  },
  backward: function() {
    this.u0.grad += this.u1.value * this.utop.grad;
    this.u1.grad += this.u0.value * this.utop.grad;
  }

}


var addGate = function() {};
  addGate.prototype = {
    forward: function(u0, u1) {
      this.u0 = u0;
      this.u1 = u1;
      this.utop = new Unit(u0.value + u1.value, 0.0);
      return this.utop;
    },

    backward: function (){
      this.u0.grad += 1 * this.utop.grad;
      this.u1.grad += 1 * this.utop.grad;
    }
  }

  var sigmoidGate = function() {
    //helper returns sigmoid to squash aeverything between 1 and 0
    // if x is negative and large, this returns a low value close to 0
    //if x is positive, and large, this returns a value close to 1
    //presumably models an action potential
    this.sig = function(x) {return 1/(1 + Math.exp(-x));};

  };

  sigmoidGate.prototype = {
    forward: function(u0) {
      this.u0 = u0;
      this.utop = new Unit(this.sig(this.u0.value), 0.0);
      return this.utop;
    },
   // comes from a wikipedia derivation
    backward: function() {
      var s = this.sig(this.u0.value);
      this.u0.grad += (s*(1-s)) *this.utop.grad;
    }
  }
//   //inputs
//   var a = new Unit(1.0, 0.0);
//   var b = new Unit(2.0, 0.0);
//   var c = new Unit(-3.0, 0.0);
//   var x = new Unit(-1.0, 0.0);
//   var y = new Unit(3.0, 0.0);
//
//  //GATES
//  var mulg0 = new multiplyGate();
//  var mulg1 = new multiplyGate();
//   var addg0 = new addGate();
//   var addg1 = new addGate();
//  var sg0 = new sigmoidGate();
//
//
//  //forward pass
//  var s = 0;
//  var forwardNeuron = function () {
//    var ax = mulg0.forward(a,x);
//    var by = mulg1.forward(b,y);
//    var axpby = addg0.forward(ax, by);
//    var axpbypc = addg1.forward(axpby, c);
//    s = sg0.forward(axpbypc);
//  };
//  forwardNeuron();
//  // the final output for this circuit
//  console.log('circuit output' + s.value)
//
// // Backpropagation
//
// s.grad = 1.0;;
//
// sg0.backward(); // writes first gradient
// addg1.backward();
// addg0.backward();
// mulg0.backward();
// mulg1.backward();
//
// var step_size = 0.01;
// a.value += step_size*a.grad;
// b.value += step_size*b.grad;
// c.value += step_size*c.grad;
// x.value += step_size*x.grad;
//  y.value += step_size*y.grad;
//
//
// forwardNeuron();
//  console.log('circuit output after 1 backdrop' + s.value)
