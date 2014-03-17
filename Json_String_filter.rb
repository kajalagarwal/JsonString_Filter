require "rubygems"
require "json"

number=0   
while number<100        #numbers of file to divide inputfile using modulo function on user_id of json string
 begin
   somefile = File.open("fname#{number}.txt", "w")    

     File.open(ARGV[0]).each_line do |line|   # Read JSON from a inputfile, iterate over objects 
       
       parsed = JSON.parse(line)               # returns a hash
       

          if parsed["id"].to_i%100==number and parsed["lang"]=="en"
             parsed = parsed.to_json       #convert the parsed data or hash in json format before storing
             somefile.puts parsed          #store in file
          end
        
     end            
   somefile.close
 rescue JSON::ParserError => e
     "This code have ParserError"
 end        
 number+=1  
end          
  # end

