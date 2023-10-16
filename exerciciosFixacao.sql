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
