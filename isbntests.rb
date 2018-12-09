require_relative 'isbn.rb'
require 'minitest/autorun'

class Testing < Minitest::Test

    def test_1
        assert_equal(1,1)
    end
    
    # def test_2
    #     assert_equal(Array, isbn10("0-330-28498-3").class)
    # end

    # def test_isbn10_valids
    #     assert_equal("Valid", isbn10("0-330-28498-3"))
    #     assert_equal("Valid", isbn10("0-321-14653-0"))
    #     assert_equal("Valid", isbn10("2-226-05257-7"))
    #     assert_equal("Valid", isbn10("3-7965-1900-8"))
    #     assert_equal("Valid", isbn10("5-85270-001-0"))
    #     assert_equal("Valid", isbn10("5-85270-001-0"))
    #     assert_equal("Valid", isbn10("605-384-057-2"))
    #     assert_equal("Valid", isbn10("609-01-1248-8"))
    #     assert_equal("Valid", isbn10("877195869x"))
    # end

    # def test_isbn10_invalid
    #     assert_equal("Invalid", isbn10("978 0 471 48648 0"))
    #     assert_equal("Invalid", isbn10("0-321@14653-0"))
    #     assert_equal("Invalid", isbn10("877195x869"))
    #     assert_equal("Invalid", isbn10("8185990451"))
    #     assert_equal("Invalid", isbn10("89-953630-3-4"))
    #     assert_equal("Invalid", isbn10("1-9054551-17"))
    #     assert_equal("Invalid", isbn10("1-9054551-1723423"))
    #     assert_equal("Invalid", isbn10("6094-01-1248-8"))
    # end

    def test_isbn13_valids
        assert_equal("Valid", isbn13("978-0-13-149505-0"))
        assert_equal("Valid", isbn13("978 0 471 48648 0"))
    end

    def test_isbn13_invalid
        assert_equal("Invalid", isbn13("321-6-13-169305-6"))
    end

end
