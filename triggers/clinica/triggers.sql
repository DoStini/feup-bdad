DROP TRIGGER IF EXISTS consulta_hora_medico;

CREATE TRIGGER consulta_hora_medico
BEFORE INSERT ON ConsultasMarcadas
FOR EACH ROW
WHEN
    EXISTS
        (SELECT julianday(new.data), new.horainicio INTERSECT 
        SELECT julianday(data), horainicio FROM ConsultasMarcadas
        WHERE new.codmedico=codmedico)
BEGIN
    SELECT raise(abort, "mt trst");
END;

SELECT 'Gatilho a)';
INSERT INTO ConsultasMarcadas (idConsultaMarcada, data, horainicio, preco, relatorio, classificacao, codmedico, coddoente) VALUES (20, '2017-05-06', 15, NULL, NULL, NULL, 3, 15); --inválido
INSERT INTO ConsultasMarcadas (idConsultaMarcada, data, horainicio, preco, relatorio, classificacao, codmedico, coddoente) VALUES (20, '2017-05-06', 15.30, NULL, NULL, NULL, 3, 15); --válido



DROP TRIGGER IF EXISTS non_prescription;

CREATE TRIGGER non_prescription
BEFORE INSERT ON Prescricao
FOR EACH ROW
WHEN
    NOT EXISTS
        (SELECT * FROM ConsultasMarcadas
        WHERE ConsultasMarcadas.codmedico=new.codmedico
                AND ConsultasMarcadas.coddoente=new.coddoente
                AND julianday(ConsultasMarcadas.data) <= julianday(new.data))
BEGIN
    SELECT raise(abort, "muito triste estas a falsificar prescricoes medicas para comprar droga");
END;

SELECT 'Gatilho b)';
INSERT INTO Prescricao (idprescricao, data, codmedico, coddoente) VALUES (9, '2017-05-05', 3, 7); --inválido: não existe consulta
INSERT INTO Prescricao (idprescricao, data, codmedico, coddoente) VALUES (9, '2017-05-05', 3, 15); --inválido: existe consulta mas posterior à data indicada
INSERT INTO Prescricao (idprescricao, data, codmedico, coddoente) VALUES (9, '2017-05-06', 3, 15); --válido


DROP TRIGGER IF EXISTS consults_limit;
CREATE TRIGGER consults_limit 
BEFORE INSERT ON ConsultasMarcadas
WHEN 
    (SELECT count(*) FROM ConsultasMarcadas 
        WHERE ConsultasMarcadas.codmedico=new.codmedico AND julianday(ConsultasMarcadas.data)=julianday(new.data))
    >= (SELECT numdoentes FROM Disponibilidade JOIN HorarioConsultas USING(idhorarioconsulta)
    WHERE Disponibilidade.codmedico=new.codmedico AND dia=new.data)
BEGIN
    SELECT raise(abort, "forssa nisso");
END;


SELECT numdoentes FROM Disponibilidade JOIN HorarioConsultas USING(idhorarioconsulta)
    WHERE codmedico=3 AND dia="2017-05-02";
SELECT count(*) FROM ConsultasMarcadas WHERE codmedico=3 AND data="2017-05-02";

SELECT 'Gatilho c)';
INSERT INTO ConsultasMarcadas (idConsultaMarcada, data, horainicio, preco, relatorio, classificacao, codmedico, coddoente) VALUES (30, '2017-05-05', 11, NULL, NULL, NULL, 5, 7); --inválido
INSERT INTO ConsultasMarcadas (idConsultaMarcada, data, horainicio, preco, relatorio, classificacao, codmedico, coddoente) VALUES (30, '2017-05-04', 11, NULL, NULL, NULL, 5, 7); --válido
