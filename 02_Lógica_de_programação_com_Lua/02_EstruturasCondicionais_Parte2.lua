--[[---------------------------------------------------------------------------------------------------------------------Imaginemos agora que a media final seja associada a um conceito de A até F, seguindo o seguinte padrão:

Nota	Classificação em números
A :	9-10
B :	8- 8,9
C :	6- 7,9
D :	4,9- 5,9
E :	4, - 4,8
F :	Abaixo de 4
---------------------------------------------------------------------------------------------------------------------]]--

if media_final >= 9.0 then
  io.write("Seu conceito é A, meus parabéns!!")
else
  if media_final >= 8.0 and media_final <= 8.9 then
    io.write("Seu conceito é A, meus parabéns!!")
  end
end

--Antes de continuarmos, deixe-me apresentá-los uma maneira de melhorarmos esta sintaxe

if media_final >= 9.0 then
  io.write("Seu conceito é A, meus parabéns!!")
elseif media_final >= 8.0 and media_final <= 8.9 then
  io.write("Seu conceito é B, meus parabéns!!")
end

--Muito melhor!! Agora, completemos esta sequência de condições:

if media_final >= 9.0 then
  io.write("Seu conceito é A, meus parabéns!!")
elseif media_final >= 8.0 and media_final <= 8.9 then
  io.write("Seu conceito é B, meus parabéns!!")
elseif media_final >= 6.0 and media_final <= 7.9 then
  io.write("Seu conceito é C, meus parabéns!!")
elseif media_final >= 4.9 and media_final <= 5.9 then
  io.write("Seu conceito é D, meus parabéns!!")
elseif media_final >= 4.0 and media_final <= 4.8 then
  io.write("Seu conceito é E, meus parabéns!!")
elseif media_final < 4.0 then
  io.write("Seu conceito é F, meus parabéns!!")
end

--Com else fica muito melhor:

if media_final >= 9.0 then
  io.write("Seu conceito é A, meus parabéns!!")
elseif media_final >= 8.0 and media_final <= 8.9 then
  io.write("Seu conceito é B, meus parabéns!!")
elseif media_final >= 6.0 and media_final <= 7.9 then
  io.write("Seu conceito é C, meus parabéns!!")
elseif media_final >= 4.9 and media_final <= 5.9 then
  io.write("Seu conceito é D, meus parabéns!!")
elseif media_final >= 4.0 and media_final <= 4.8 then
  io.write("Seu conceito é E, meus parabéns!!")
else
  io.write("Seu conceito é F, meus parabéns!!")
end

--Está "feio" ainda nosso programa, podemos deixá-lo bonito

if media_final >= 9.0 then
  io.write("Seu conceito é A, meus parabéns!!")
elseif media_final >= 8.0 then
  io.write("Seu conceito é B, meus parabéns!!")
elseif media_final >= 6.0 then
  io.write("Seu conceito é C, meus parabéns!!")
elseif media_final >= 4.9 then
  io.write("Seu conceito é D, meus parabéns!!")
elseif media_final >= 4.0 then
  io.write("Seu conceito é E, meus parabéns!!")
else
  io.write("Seu conceito é F, meus parabéns!!")
end
