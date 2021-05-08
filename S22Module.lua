function S22Encrypt(MSG, bit)
   local resources = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", ".", "1", "2", "3", "4", "5", "6", "7", "8", "9", "-", "_", "*", "'", "^", "~", "!"}
   local finalstring = ""
   local count = 0
   MSG:gsub(".", function(c)
   for i,v in pairs(resources) do
             count = count + 1
              if v == c then
                finalstring = finalstring .. " " .. count * bit /69
                count = 0
            end
        end
   end)
   return finalstring
 end
  
  function S22Decrypt(MSG, bit)
   local resources = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", ".", "1", "2", "3", "4", "5", "6", "7", "8", "9", "-", "_", "*", "'", "^", "~", "!"}
   local finalstring = ""
   local count = 0
   local resource_idx = 0
   while MSG ~= "" do
      count = count + 1
      if count > 1000 then
         return nil, "Can not decrypt"
      end
      resource_idx = resource_idx + 1
      if resource_idx > #resources then
         resource_idx = resource_idx - #resources
         finalstring = finalstring .. " "
      end
      local code = " " .. count * bit /69
      if MSG:sub(1, #code) == code then
         MSG = MSG:sub(#code + 1)
         finalstring = finalstring .. resources[resource_idx]
         count = #resources - resource_idx
         resource_idx = 0
      end
   end
   return finalstring
end
