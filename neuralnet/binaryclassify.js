"use strict"
var Circuit = function (){
  this.mulg0 = new multiplyGate();
  this.mulg1 = new multiplyGate();
  this.addg0 = new addGate();
  this.addg1 = new addGate();
};

Circuit.prototype = {
  forward: function(x,y,a,b,c) {
    this.ax = this.mulg0.forward(a,x);
    this.by = this.mulg1.forward(b,y);
    this.axpby = this.addg0.forward(this.ax, this.by);
    this.axpbypc = this.addg1.forward(this.axpby, c);
    return this.axpbypc;
  },

 backward: function(gradient_top) { //pull from above
   this.axpbypc.grad = gradient_top;
   this.addg1.backward();
   this.addg0.backward();
   this.mulg0.backward();
   this.mulg1.backward();
 }
}

var SVM = function() {
  // initial values are guesses that will be adjusted
  this.a = new Unit(1.0, 0.0);
  this.b = new Unit(-2.0, 0.0);
  this.c = new Unit(-1.0, 0.0);

  this.circuit = new Circuit();

};

SVM.prototype = {
  forward: function(x,y) {
    this.unit_out = this.circuit.forward(x, y, this.a, this.b, this.c);
    return this.unit_out;
  },
  backward: function(label) {
    this.a.grad = 0;
    this.b.grad = 0;
    this.c.grad = 0;
    //backpropagate based on the label value to encourage or discourage.
    var pull = 0.0;
    if (this.unit_out.value < 1 && label === 1) {
      pull = 1;
    }
    if (this.unit_out.value > -1 && label === -1) {
      pull = -1;
    }
   this.circuit.backward(pull);
   debugger
   // writes gradients into circuit

   // learns much quicker without regularization pull
   this.a.grad += -this.a.value;
   this.b.grad += -this.b.value;
 },
 //we have gradients that have been set according to label, so adjust value w/ STEP
  parameterUpdate: function () {
    var step_size = 0.01;
    this.a.value = (this.a.value + step_size*this.a.grad);
    this.b.value = (this.b.value + step_size*this.b.grad);
    this.c.value = (this.c.value + step_size*this.c.grad);
  },

 learnFrom: function(x,y,label) {
   this.forward(x,y);
   this.backward(label);
   this.parameterUpdate();

 }



};

var data = [[1.2, .7], [-.3,-.5], [3,.1], [-.1,-1], [-1,1.1], [2.1, -3]]
var labels = [1,-1,1,-1, -1, 1];
//create new SVM as above;
var svm = new SVM();
console.log('wow');
console.log(svm);
console.log('wow')
var evalTrainingAccuracy = function (){
  var num_correct = 0;
  for(var i =0; i < data.length; i ++) {
    var x = new Unit(data[i][0], 0.0);
    var y = new Unit(data[i][1], 0.0);
    var true_label = labels[i];
    var predicted_label = svm.forward(x,y).value > 0 ? 1 : -1;
    if (predicted_label === true_label) {
      num_correct += 1;
    }
  }
  return num_correct / data.length;
};


for (var iter = 0; iter < 400; iter++) {
  var i = Math.floor(Math.random()* data.length)
  var x = new Unit(data[i][0], 0.0);
  var y = new Unit(data[i][1], 0.0);
  var label = labels[i];
  svm.learnFrom(x,y, label)

  if(iter % 25 === 0) {
    console.log(svm)
    console.log("training accuracy at iter" + iter + ":" +  evalTrainingAccuracy() )
  }
}
