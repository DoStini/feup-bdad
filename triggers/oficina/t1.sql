DROP TRIGGER IF EXISTS checkStockECompatibilidadePeca;
CREATE TRIGGER checkStockECompatibilidadePeca
BEFORE INSERT ReparacaoPeca
FOR EACH ROW
BEGIN
    SELECT CASE WHEN 
    (SELECT idModelo 
    FROM Carro 
    WHERE Carro.idCarro = (SELECT idCarro 
                           FROM Reparacao 
                           WHERE ReparacaoPeca.idReparacao = Reparacao.idReparacao)
    NOT IN (
        SELECT idModelo 
        FROM PecaModelo 
        WHERE PecaModelo.idPeca = NEW.idPeca) THEN 
    SELECT RAISE(ABORT, "O modelo da peça não é compatível com a do carro.") 
    END;

    SELECT CASE WHEN
    ((SELECT quantidade FROM Peca WHERE Peca.idPeca = NEW.idPeca) < NEW.quantidade) 
    THEN SELECT RAISE(ABORT, "Não há quantidade suficiente de peças para satisfazer a reparação.") END;

END;