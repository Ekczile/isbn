require 'csv'


def isbn10(numbers)
    counter = 1 #counter
    final = Array.new #new array
    checknumber = Array.new #new array
    ary = Array.new #new array
    numbers = numbers.tr("a-w", "").tr("y-z", "").gsub("-", "").gsub(" ", "").each_char.to_a #removing - and white spaces
    if numbers.length > 10 #conditional if numbers length is greater than 10 to return invalid
      return "Invalid"
    end
    numbers.each do |v| #loop 
      ary.push(v.gsub("x", "10").gsub("X", "10").to_i) #pushing each char into new array as an integer and if v is x convert x to 10
    end
    checknumber.push(ary[9]) #storing last number to check later
    ary.delete_at(9) # array with 10th digit removed
    ary.each do |v| #loop
      final.push(v * counter) #push each digit times the counter into final array
      counter += 1 #counter goes up with each index 1,2,3,4,5,6,7,8,9 respectivly
    end
    final = final.sum % 11 #sum of all indexs modul 11
    if final == checknumber[0] # conditional for if final is equal to the stored digit
      return "Valid"
    else
      return "Invalid"
    end
end

def isbn13(numbers)
  counter = 1
  ary = Array.new
  checknumber = Array.new
  final = Array.new
  numbers = numbers.tr("a-w", "").tr("y-z", "").gsub("-", "").gsub(" ", "").each_char.to_a
  if numbers.length > 13 #conditional if numbers length is greater than 13 to return invalid
    return "Invalid"
  end
  numbers.each do |v| #loop
    ary.push(v.gsub("x", "10").to_i) #pushing each char into new array as an integer and if v is x convert x to 10
  end
  checknumber.push(ary[12]) #storing last number to check later
  ary.delete_at(12) #array with 13th digit removed
  ary.each do |v| #loop
    if counter.odd?
      final << v * 1
      counter += 1
    else
      final << v * 3
      counter += 1 
    end
  end
  final = final.sum % 10 #sum of array mod 10
  final = 10 - final #10 - result of final sum mod 10
  final = final % 10 #final mod 10 agian
  if final == checknumber[0] # conditional for if final is equal to the stored digit
    return "Valid"
  else
    return "Invalid"
  end
end

def makefile(file)
isbnarray = Array.new
isbn = CSV.read(file, "r")
isbn.each do |row|
  newrow = row[1].to_s.tr("a-w", "").tr("y-z", "").gsub("-", "").gsub(" ", "").gsub("\""," ").gsub("\]", "").gsub("\[", "")
    if row.length == 10
      isbnarray.push([row[1], isbn10(newrow)])
    else
      isbnarray.push([row[1], isbn13(newrow)])
    end
  end
  CSV.open("isbnverified.csv", "wb") do |csv|
    isbnarray.each do |v|
     csv << v
    end
  end
end
 
makefile("isbn.csv")