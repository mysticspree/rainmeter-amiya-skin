function Update()
  local artist = SKIN:GetMeasure("MeasureArtist"):GetStringValue()
  local state = SKIN:GetMeasure("MeasureState"):GetValue()

  if state == 2 then
    SKIN:Bang('!SetOption MeterStatus Text "PLAYER | 一時停止中"')
    SKIN:Bang('!HideMeter MeterArtist')
  elseif artist == nil or artist == "" then
    SKIN:Bang('!SetOption MeterStatus Text "PLAYER | 閉じました"')
    SKIN:Bang('!HideMeter MeterArtist')
  else
    SKIN:Bang('!SetOption MeterArtist Text "ARTIST I   ' .. artist .. '"')
    SKIN:Bang('!SetOption MeterStatus Text "再生中"')
    SKIN:Bang('!ShowMeter MeterArtist')
  end

  SKIN:Bang('!UpdateMeter *')
  SKIN:Bang('!Redraw')
  return ""
end
