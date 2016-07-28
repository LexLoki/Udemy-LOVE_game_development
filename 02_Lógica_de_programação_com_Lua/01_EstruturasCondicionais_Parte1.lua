local nota

io.write("Escreva a nota da prova:")
nota = io.read()

if nota == 6.0 then
  io.write("Sua nota é 6.0.")
end

if nota > 6.0 then
  io.write("Sua nota é maior do que 6.0.")
end

if nota < 6.0 then
  io.write("Sua nota é menor do que 6.0.")
end

if nota >= 6.0 then
  io.write("Sua nota é maior ou igual do que 6.0.")
end

if nota <= 6.0 then
  io.write("Sua nota é menor ou igual do que 6.0.")
end

--Como fazer para considerar os casos abaixo de 6.0 ao mesmo tempo dos casos acima?

if nota >= 6.0 then
  io.write("Parabéns, você foi aprovado !!")
else
  io.write("Infelizmente você está reprovado nesta disciplina. :(")
end

--Como fazer para alertar meu usuário que sua nota está entre 6.0 e 7.0?

if nota > 6.0 and nota < 7.0 then
  io.write("Sua nota está entre 6.0 e 7.0.")
end

--Incluindo os extremos

if nota >= 6.0 and nota <= 7.0 then
  io.write("Sua nota está entre 6.0 e 7.0, incluindo estes.")
end

--Outros exemplos com sintaxes novas

if not nota < 6.0 and nota < 7.0 then
  io.write("Sua nota é menor do que 7.0, porém não menor do que 6.0.")
end

if nota >= 7.0 or nota <= 6.0 then
  io.write("Sua nota não está entre 6.0 e 7.0.")
end