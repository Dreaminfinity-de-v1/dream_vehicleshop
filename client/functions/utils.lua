function DrawTxt(text, x, y, size)
	SetTextFont(0)
	SetTextProportional(1)
	SetTextScale(0.0, (size or 1.0) + 0.0)
	SetTextDropshadow(1, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end