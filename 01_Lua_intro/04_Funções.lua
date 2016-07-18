function dizer_ola()
	print('Olá!!')
end

dizer_ola() -- Chamando a funcao definida acima

function mostra_valor(val) -- Recebe um valor e o guarda em val
	print(val)
end

print(2)
mostra_valor(2)
a = 3
print(a)
mostra_valor(a)

function mostra_soma(a,b)
	resp = a+b
	print('Soma é: '..resp)
end

mostra_soma(3,8)

function mostra_media(a,b)
	resp = (a+b)/2
	print('Média é: '..resp)
end

mostra_media(6,9.4)