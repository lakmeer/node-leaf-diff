
# Require

leaf-diff = require '../src/leaf-diff'
same      = require \assert .deep-equal


# Some data

structure-a = {
  sequence-number : 1
  controllers : [
    buttons :
      button1 : on
      button2 : off
      button3 : off
      button4 : off
    stick :
      x : 0.1234
      y : 0.6434
  ]
}

structure-b = {
  sequence-number : 2
  controllers : [
    buttons :
      button1 : off
      button2 : off
      button3 : off
      button4 : on
    stick :
      x : 0.1354
      y : 0.6244
  ]
}


# Piss-poor test suite, one test long
# Generate diffs


prev = { time : 1000, data : { x : 200, y : 200, button1 : on,  button2 : off } }
curr = { time : 1001, data : { x : 202, y : 198, button1 : off, button2 : off } }

console.log leaf-diff prev, curr

actual = leaf-diff structure-a, structure-b

expected =
  * key: 'sequenceNumber',                old: 1,      new: 2
  * key: 'controllers.0.buttons.button1', old: on,     new: off
  * key: 'controllers.0.buttons.button4', old: off,    new: on
  * key: 'controllers.0.stick.x',         old: 0.1234, new: 0.1354
  * key: 'controllers.0.stick.y',         old: 0.6434, new: 0.6244

same actual, expected

