-- Lendo valores entrados pelo usuario: io.read

meu_nome = 'Pietro'
print('Olá, meu nome é: '..meu_nome..'. O seu é? ')
seu_nome = io.read()

print('Prazer, '..seu_nome)

print('\nPor favor, entre com um numero: ')
num_1 = io.read()
print('\nPor favor, entre com mais um numero: ')
num_2 = io.read()

print('Voce entrou com os numeros: '..num_1..' e '..num_2)
soma = num_1 + num_2
print('A soma desses numeros é: '..soma)
sub = num_1 - num_2
print('O primeiro numeros menos o segundo é: '..sub)