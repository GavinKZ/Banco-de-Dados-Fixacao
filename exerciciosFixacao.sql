-- 1.A
CREATE TABLE nomes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(150)
);

INSERT INTO nomes (nome)
VALUES
('Roberta'),
('Roberto'),
('Maria Clara'),
('João');

-- 1.B
SELECT UPPER(nome) AS nome_maiusculo FROM nomes;

-- 1.C
SELECT nome, LENGTH(nome) AS nome_tamanho FROM nomes;

-- 1.D
SELECT 
  CASE 
    WHEN nome LIKE '%Roberto%' OR nome LIKE '%João%'
    THEN CONCAT('Sr. ', nome)
    WHEN nome LIKE '%Roberta%' OR nome LIKE '%Maria Clara%'
    THEN CONCAT('Sra. ', nome)
    ELSE nome
  END AS nome_tratamento
FROM nomes;

-- 2.A
CREATE TABLE produtos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  produto VARCHAR(100) NOT NULL,
  preco DECIMAL(10, 2) NOT NULL,
  quantidade INT NOT NULL
);

-- 2.B
SELECT produto, ROUND(preco, 2) AS preco_arredondado, quantidade FROM produtos;

-- 2.C
SELECT produto, preco, ABS(quantidade) AS quantidade_abs FROM produtos;

-- 2.D
SELECT AVG(preco) AS precos_media FROM produtos;

-- 3.A
CREATE TABLE eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_evento DATETIME
);

INSERT INTO eventos (data_evento)
VALUES
('2014-10-12 09:04:22'),
('1991-11-02 14:37:00'),
('2000-11-20 11:22:39'),
('1948-04-04 01:28:44'),
('2020-05-10 06:09:00'),
('1939-10-21 19:10:34'),
('2040-01-20 17:38:05'),
('2021-04-10 02:17:10'),
('2020-06-19 23:59:10'),
('1945-06-02 00:00:00'),
('2006-10-14 21:33:27'),
('1999-04-18 01:42:40');

-- 3.B
INSERT INTO eventos (data_evento)
SELECT NOW() as DatAtual;

-- 3.C
SELECT data_evento, data_evento AS data_atual, DATEDIFF(NOW(), data_evento) AS comparacao_total FROM eventos;

-- 3.D
SELECT DAYNAME(data_evento) AS nome_dia_semana FROM eventos;

-- 4.A
INSERT INTO produtos(produto, preco, quantidade)
VALUES
('Batata', '05.00', 10),
('Maçã', '02.00', 0),
('Abacaxi', '08.50', 5);

SELECT produto, preco, quantidade,
  IF(quantidade > 0, 'Em estoque', 'Fora de estoque') AS status_estoque
FROM produtos;

-- 4.B
SELECT produto, preco, quantidade,
  CASE
    WHEN preco <= 3.00 THEN 'Barato'
    WHEN preco <= 6.00 THEN 'Médio'
    ELSE 'Caro'
  END AS categoria_preco
FROM produtos;

-- 5.A
DELIMITER //

CREATE FUNCTION TOTAL_VALOR (quantidade INT, preco DECIMAL(10, 2))
RETURNS DECIMAL(10, 2) 

BEGIN
	DECLARE total DECIMAL(10, 2);
	SET total = quantidade * preco;

	RETURN total;
END //

DELIMITER ;

-- 5.B
SELECT produto, preco, quantidade, TOTAL_VALOR(preco, quantidade) AS valor_total
FROM produtos;

-- 6.A
SELECT COUNT(produto) FROM produtos;

-- 6.B
SELECT MAX(preco) FROM produtos;

-- 6.C
SELECT MIN(preco) FROM produtos;

-- 6.D
SELECT SUM(IF(quantidade > 0, preco * quantidade, 0)) AS total_em_estoque FROM produtos;

-- 7.A
DELIMITER //

CREATE FUNCTION fatorial(numero INT)
RETURNS INT

BEGIN
  DECLARE resultado INT;
  DECLARE contador INT;
  SET resultado = 1;
  SET contador = 1;

  WHILE contador <= numero DO
    SET resultado = resultado * contador;
    SET contador = contador + 1;
  END WHILE;

  RETURN resultado;
END;
//

DELIMITER ;

SELECT fatorial(5); 

-- 7.B
DELIMITER //

CREATE FUNCTION exponecial(base DECIMAL, expoente DECIMAL)
RETURNS DECIMAL

BEGIN
  DECLARE resultado DECIMAL;
  SET resultado = POW(base, expoente);
  RETURN resultado;
END;
//
DELIMITER ;

SELECT exponencial(2.0, 3.0);

-- 7.C
DELIMITER //

CREATE FUNCTION palindromo(palavra VARCHAR(255))
RETURNS INT

BEGIN
  DECLARE palavraInvertida VARCHAR(150);
  SET palavraInvertida = REVERSE(palavra);

  IF palavra = palavraInvertida THEN
    RETURN 1;
  ELSE
    RETURN 0;
  END IF;
END;
//

DELIMITER ;

SELECT palindromo('civic');
SELECT palindromo('honda'); 
