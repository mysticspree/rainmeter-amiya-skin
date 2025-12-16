function Update()
  local hour = SKIN:GetMeasure('MeasureHour'):GetValue()
  if hour < 4 then return "At night" end
  if hour < 12 then return "Good morning!" end
  if hour < 16 then return "At afternoon!" end
  if hour < 21 then return "Good evening!" end
  return "At night!"
end
