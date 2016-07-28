--[[-------------------------------------------------------------------------------------------------------------------- 
Exercício1:

Imagine um programa que receba suas notas de 3 provas, calculando sua média final e dizendo se você foi aprovado ou não, seguindo os seguintes critérios:

-"Aprovado" se a média final é maior ou igual do que 6.0 e se todas as suas notas forem acima de 5.0
-"Em prova final" se a média final é menor do que 6.0 ou alguma de suas notas forem menor do que 5.0
-"Reprovado" se sua média final, mesmo com a adição da prova final foi menor do que 6.0
--------------------------------------------------------------------------------------------------------------------]]--

local nota1, nota2, nota3, nota_prova_final
local media, media_final

io.write("Escreva a nota da prova 1:")
nota1 = io.read()

io.write("Escreva a nota da prova 2:")
nota2 = io.read()

io.write("Escreva a nota da prova 3:")
nota3 = io.read()

media = (nota1 + nota2 + nota3)/3

if media >= 6.0 then
  io.write("Parabéns você está aprovado!!")
else
  io.write("Infelizmente você está reprovado nesta disciplina. :(")
end

--Incrementando nosso programa

if media >= 6.0 and nota1 > 5.0 and nota2 < 5.0 and nota3 > 5.0 then
  io.write("Parabéns você está aprovado!!")
else
  io.write("Infelizmente você está reprovado nesta disciplina. :(")
end

--Incrementando mais um pouco

if media >= 6.0 and nota1 > 5.0 and nota2 > 5.0 and nota3 > 5.0 then
  io.write("Parabéns você está aprovado!!")
else
  io.write("Você será encaminhado para uma prova final.")
end

io.write("Escreva a nota da prova final")
nota_prova_final = io.read()

media_final = (nota1 + nota2 + nota3+ nota_prova_final)/4

--OBS.: Não há necessidade dessa nova variável, poderíamos utilizar a variável media

if media_final >= 6.0 then
  io.write("Parabéns, você foi aprovado, ufa!! :D")
else
  io.write("Infelizmente você está reprovado nesta disciplina. :(")
end

