local function find_factorial(num)
    local total = 1
    local i = 1
        while i <= num do
            total = total * i
            i = i + 1
        end
    return total
end

local dig = 0
dig = find_factorial(3)

print(dig)