Foundation = require 'art-foundation'
Atomic = Neptune.Art.Atomic
{inspect} = Foundation
{perimeter, Perimeter} = Atomic


suite "Art.Atomic.Perimeter.new", ->
  test "0", ->
    p = new Perimeter 0
    assert.equal 0, p.left
    assert.equal 0, p.right
    assert.equal 0, p.top
    assert.equal 0, p.bottom

  test "null", ->
    p = new Perimeter null
    assert.equal 0, p.left
    assert.equal 0, p.right
    assert.equal 0, p.top
    assert.equal 0, p.bottom

  test "undefined", ->
    p = new Perimeter undefined
    assert.equal 0, p.left
    assert.equal 0, p.right
    assert.equal 0, p.top
    assert.equal 0, p.bottom

  test "1, 2, 3, 4", ->
    p = new Perimeter 1, 2, 3, 4
    assert.equal 1, p.left
    assert.equal 2, p.right
    assert.equal 3, p.top
    assert.equal 4, p.bottom

  test "1, 2", ->
    p = new Perimeter 1, 2
    assert.equal 1, p.left
    assert.equal 1, p.right
    assert.equal 2, p.top
    assert.equal 2, p.bottom

  test "h:1, v:2", ->
    p = new Perimeter h:1, v:2
    assert.eq p.toObject(), left: 1, right: 1, top: 2, bottom: 2

  test "horizontal:1, vertical:2", ->
    p = new Perimeter horizontal:1, vertical:2
    assert.eq p.toObject(), left: 1, right: 1, top: 2, bottom: 2

  test "left: 1, right: 2, top: 3, bottom: 4", ->
    p = new Perimeter left: 1, right: 2, top: 3, bottom: 4
    assert.eq p.toObject(), left: 1, right: 2, top: 3, bottom: 4

  test "l: 1, r: 2, t: 3, b: 4", ->
    p = new Perimeter l: 1, r: 2, t: 3, b: 4
    assert.eq p.toObject(), left: 1, right: 2, top: 3, bottom: 4

  test "l: 1, r: 2, v: 3", ->
    p = new Perimeter l: 1, r: 2, v: 3
    assert.eq p.toObject(), left: 1, right: 2, top: 3, bottom: 3

  test "l: 1, t: 2", ->
    p = new Perimeter l: 1, t: 2
    assert.eq p.toObject(), left: 1, right: 0, top: 2, bottom: 0

  test "l: 1, r: 2, t: 3, b: 4, h: 10, v: 100", ->
    p = new Perimeter l: 1, r: 2, t: 3, b: 4, h: 10, v: 100
    assert.eq p.toObject(), left: 11, right: 12, top: 103, bottom: 104

suite "Art.Atomic.Perimeter.computed properties", ->
  test "width", ->
    p = new Perimeter l: 1, r: 2, t: 3, b: 4
    assert.eq p.width, 3

  test "height", ->
    p = new Perimeter l: 1, r: 2, t: 3, b: 4
    assert.eq p.height, 7

suite "Art.Atomic.Perimeter.interpolate", ->
  test "height", ->
    a = new Perimeter l: 1.0, r: 2.0, t: 3.0, b: 4.0
    b = new Perimeter l: 2.0, r: 3.0, t: 4.0, b: 5.0
    c = new Perimeter l: 1.5, r: 2.5, t: 3.5, b: 4.5
    a.eq b
    assert.eq c, a.interpolate b, .5
