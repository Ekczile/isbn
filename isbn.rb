def isbn10(numbers)
    numbers = numbers.to_s
    numbers = numbers.gsub("-", "").each_char.to_a
    p numbers
end