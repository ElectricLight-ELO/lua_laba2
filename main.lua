local function find_factorial(num)
    local total = 1.0
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

    local start = os.clock()
    for i = 1,170 do
        local dig = call_with_caching(i)
        print(dig)
    end
    local elapsed = os.clock() - start
    print(string.format("Время: %.6f сек", elapsed))

    --- повторный поиск с кешированием
    local start = os.clock()
    for i = 1,170 do
        local dig = call_with_caching(i)
        print(dig)
    end
    local elapsed = os.clock() - start
    print(string.format("Время: %.6f сек", elapsed))
end

-- создал для удобства точку входа
main()