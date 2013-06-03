grunt = require("grunt")

#
#  ======== A Handy Little Nodeunit Reference ========
#  https://github.com/caolan/nodeunit
#
#  Test methods:
#    test.expect(numAssertions)
#    test.done()
#  Test assertions:
#    test.ok(value, [message])
#    test.equal(actual, expected, [message])
#    test.notEqual(actual, expected, [message])
#    test.deepEqual(actual, expected, [message])
#    test.notDeepEqual(actual, expected, [message])
#    test.strictEqual(actual, expected, [message])
#    test.notStrictEqual(actual, expected, [message])
#    test.throws(block, [error], [message])
#    test.doesNotThrow(block, [error], [message])
#    test.ifError(value)
#
exports.chalkboard =
  setUp: (done) ->

    # setup here if necessary
    done()

  compile_fixture: (test) ->
    test.expect 1
    actual   = grunt.file.read "tmp/fixture.md"
    expected = grunt.file.read "test/actual.md"
    test.equal actual, expected, "should compile the same markdown"
    test.done()