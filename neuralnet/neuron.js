var forwardMultiplyGate = function(x, y) {
  return x * y;
};

// look at effect of small change in x and y on output
// var x = -2, y = 3;
// var tweak_amount = 0.01;
// var best_out = -Infinity;
// var best_x = x, best_y = y
//
// for (var k = 0; k < 100; k++) {
//   var x_try = x + tweak_amount * (Math.random() * 2 -1);
//   var y_try = y + tweak_amount * (Math.random() * 2 -1);
//   var out = forwardMultiplyGate(x_try,y_try);
//   // tweak_amount = tweak_amount * k;
//   if (best_out < out) {
//      best_out = out;
//      best_x = x_try;
//      best_y = y_try;
//   };
//  console.log(best_out, best_x, best_y);
// }
// LOOK AT DERIVATE AT A GIVEN POINT
var x = -2, y = 3;
var out = forwardMultiplyGate(x,y); // -6
var h = 0.0001;

//computes derivative
var xph = x + h;
var out2 = forwardMultiplyGate(xph, y);
var x_derivative = (out2 - out) / h;

var yph = y + h;
var out3 = forwardMultiplyGate(x, yph);
var y_derivative = (out3 - out)/ h;


// console.log(x_derivative, y_derivative);

//STEP UP ON THE function
var step_size = 0.01;
x = x + step_size*(x_derivative);
y = y + step_size*(y_derivative);
var out_new = forwardMultiplyGate(x,y)
// console.log(out_new)

// USING the gradient

x = -2;
y = 3;

out = forwardMultiplyGate(x,y);
var x_gradient = y;
var y_gradient = x;
step_size = 0.01;
x = x + step_size* x_gradient;
y = y + step_size* y_gradient;
var out_new= forwardMultiplyGate(x,y)
// console.log(out_new)
//MOVING UP TO 3 GATES
var forwardAddGate = function(a, b) {
  return a + b;
};

var forwardCircuit = function(x, y, z) {
  return forwardMultiplyGate(z, forwardAddGate(x,y));
};

var z = -4;
x = -2;
y = 5;

var q = forwardAddGate(x, y);
var f = forwardMultiplyGate(q, z)

var derivative_f_wrt_z = q;
var derivative_f_wrt_q = z;

var derivative_q_wrt_x = 1;
var derivative_q_wrt_y = 1;

var derivative_f_wrt_x = derivative_f_wrt_q *derivative_q_wrt_x;
var derivative_f_wrt_y = derivative_f_wrt_q * derivative_q_wrt_y;


var gradient_f_wrt_xyz = [derivative_f_wrt_x, derivative_f_wrt_y, derivative_f_wrt_z]
console.log(gradient_f_wrt_xyz)
x = x + step_size * derivative_f_wrt_x;
console.log(x)
y = y + step_size * derivative_f_wrt_y;
console.log(y)
z = z + step_size * derivative_f_wrt_z;
console.log(z)

q = forwardAddGate(x,y);
f = forwardMultiplyGate(q,z);
console.log(f)

// CREATE a wire with a forward value and a backwards value
