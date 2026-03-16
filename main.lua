local function find_factorial(num)
    local total = 1
    local i = 1
        while i <= num do
            total = total * i
            i = i + 1
        end
    return total
end



-- тестирую работу словарей
local map = {}
local function call_with_caching(digit)
    if map[digit] ~= nil then
        return map[digit]
    end

    local factr_digit = find_factorial(digit) 
    map[digit] = factr_digit
    return factr_digit
end

local function main()

    local dig = 0
    dig = find_factorial(3)

    map["apple"] = 5
    map["banana"] = 10


    if map["banana"] ~= nil then
        print("есть")
        print(map["banana"])
    end
end

-- создал для удобства точку входа
main()