require_relative 'isbn.rb'
require 'minitest/autorun'

class Testing < Minitest::Test

    def test_1
        assert_equal(1,1)
    end
    
    # def test_2
    #     assert_equal(Array, isbn10("0-330-28498-3").class)
    # end

    def test_isbn10_valids
        assert_equal("Valid", isbn10("0-330-28498-3"))
        assert_equal("Valid", isbn10("0-321-14653-0"))
        assert_equal("Valid", isbn10("2-226-05257-7"))
        assert_equal("Valid", isbn10("3-7965-1900-8"))
        assert_equal("Valid", isbn10("5-85270-001-0"))
        assert_equal("Valid", isbn10("5-85270-001-0"))
        assert_equal("Valid", isbn10("605-384-057-2"))
        assert_equal("Valid", isbn10("609-01-1248-8"))
        assert_equal("Valid", isbn10("877195869x"))
        assert_equal("Valid", isbn10("877195869X"))
    end

    def test_isbn10_invalid
        assert_equal("Invalid", isbn10("978 0 471 48648 0"))
        assert_equal("Invalid", isbn10("0-321@14653-0"))
        assert_equal("Invalid", isbn10("877195x869"))
        assert_equal("Invalid", isbn10("8185990451"))
        assert_equal("Invalid", isbn10("89-953630-3-4"))
        assert_equal("Invalid", isbn10("1-9054551-17"))
        assert_equal("Invalid", isbn10("1-9054551-1723423"))
        assert_equal("Invalid", isbn10("6094-01-1248-8"))
        assert_equal("Invalid", isbn10("6094-01-1248-xxxxxxx"))
        assert_equal("Invalid", isbn10("6094"))
        assert_equal("Invalid", isbn10("60943424725785234524"))
    end

    def test_isbn13_valids
        assert_equal("Valid", isbn13("978-0-13-149505-0"))
        assert_equal("Valid", isbn13("978 0 471 48648 0"))
        assert_equal("Valid", isbn13("978-0-9858751-3-8"))
        assert_equal("Valid", isbn13("9781603093255"))
        assert_equal("Valid", isbn13("978-1-60309-439-9"))
        assert_equal("Valid", isbn13("978-1-60309-406-1"))
        assert_equal("Valid", isbn13("978-1-60309-456-6"))
        assert_equal("Valid", isbn13("978-1-891830-02-0"))
        
    end

    def test_isbn13_invalid
        assert_equal("Invalid", isbn13("321-6-13-169305-6"))
        assert_equal("Invalid", isbn13("443 6 13 344305-x"))
        assert_equal("Invalid", isbn13("321-2-17-345425-6"))
        assert_equal("Invalid", isbn13("1232173444259"))
        assert_equal("Invalid", isbn13("1-9054551-1723423"))
        assert_equal("Invalid", isbn13("1-905453"))
        assert_equal("Invalid", isbn13("1"))
    end

end
