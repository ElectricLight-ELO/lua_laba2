local function sum_digitals(...)
    local total = 0
    for _, v in ipairs({...}) do
        total = total + v
    end
    return total
end

local sum = 0
sum = sum_digitals(1, 2,3,4,2,1)

print(sum)