require_relative 'isbn.rb'
require 'minitest/autorun'

class Testing < Minitest::Test

    def test_1
        assert_equal(1,1)
    end
    
    def test_2
        assert_equal(Array, isbn10(0-330-28498-3).class)
    end
end