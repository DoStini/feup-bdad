SELECT Estudante.nome as Estudante, curso.nome as Curso FROM Estudante
JOIN Curso ON Estudante.curso=curso.id
WHERE anoCurricular=3;