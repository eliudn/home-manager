local client = client

client.connect_signal("focus", function(c)
    c.border_color = "#FFFFFF" -- Cambia el color del borde de la ventana activa
    c.border_width = 2 -- Cambia el ancho del borde de la ventana activa
end)

client.connect_signal("unfocus", function(c)
    c.border_color = "#000000" -- Restaura el color del borde de las ventanas inactivas
    c.border_width = 1 -- Restaura el ancho del borde de las ventanas inactivas
end)
