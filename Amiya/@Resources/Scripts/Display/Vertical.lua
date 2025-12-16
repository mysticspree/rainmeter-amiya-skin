function Update()
    UpdateDay()
    UpdateDateCharacters()
end

function UpdateDay()
    local day = SKIN:GetMeasure('MeasureDay'):GetStringValue()
    if not day or day == "" then return end

    local upperDay = string.upper(day)
    local letters = {}
    for i = 1, #upperDay do
        table.insert(letters, upperDay:sub(i, i))
    end

    local vertical = table.concat(letters, "#CRLF#")
    SKIN:Bang('!SetOption', 'MeterDay', 'Text', vertical)
end

function UpdateDateCharacters()
    local date = SKIN:GetMeasure('MeasureFullDate'):GetStringValue()
    if not date or date == "" then return end

    -- Insert line break between every character, preserve spacing between words
    local vertical = ""
    for c in date:gmatch(".") do
        if c == " " then
            vertical = vertical .. "#CRLF#"
        else
            vertical = vertical .. c .. "#CRLF#"
        end
    end

    -- Remove the final trailing CRLF
    if vertical:sub(-7) == "#CRLF#" then
        vertical = vertical:sub(1, -8)
    end

    SKIN:Bang('!SetOption', 'MeterDate', 'Text', vertical)
end
