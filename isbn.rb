def isbn10(numbers)
    counter = 1 #counter
    final = Array.new #new array
    checknumber = Array.new #new array
    ary = Array.new #new array
    numbers = numbers.gsub("-", "").gsub(" ", "").each_char.to_a #removing - and white spaces
     numbers.each do |v| #loop 
       ary.push(v.gsub("x", "10").to_i) #pushing each char into new array as an integer and if v is x convert x to 10
     end
     checknumber.push(ary[9]) #storing last number to check later
     ary.delete_at(9) # array with 10th digit removed
     ary.each do |v| #loop
          final.push(v * counter) #push each digit times the counter into final array
          counter += 1 #counter goes up with each index 1,2,3,4,5,6,7,8,9 respectivly
     end
    final = final.sum%11 #sum of all indexs modul 11
    if final == checknumber[0] # conditional for if final is equal to the stored digit
      p "Valid"
    else
      p "Invalid"
    end
end