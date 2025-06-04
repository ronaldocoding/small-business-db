-- 1) Criação das tabelas
CREATE TABLE produtos (
  id_produto INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(255),
  preco DECIMAL(10,2) NOT NULL,
  estoque INT NOT NULL
);

CREATE TABLE pedidos (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  data_pedido DATETIME NOT NULL,
  id_produto INT NOT NULL,
  quantidade INT NOT NULL,
  valor_unitario DECIMAL(10,2) NOT NULL,
  valor_total DECIMAL(10,2) NOT NULL,
  cliente_nome VARCHAR(100) NOT NULL,
  CONSTRAINT fk_pedido_produto
    FOREIGN KEY (id_produto)
    REFERENCES produtos(id_produto)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

-- 2) Inserts de exemplo
INSERT INTO produtos (nome, descricao, preco, estoque)
VALUES
  ('Café Expresso', 'Café puro em dose única 50ml', 5.00, 100),
  ('Livro: “Aprenda SQL”', 'Manual prático de SQL para iniciantes', 79.90, 25),
  ('Blend de Chá Verde', 'Pacote com 50g de chá verde orgânico', 15.50, 50);

INSERT INTO pedidos (data_pedido, id_produto, quantidade, valor_unitario, valor_total, cliente_nome)
VALUES
  ('2025-06-01 09:15:00', 1, 2, 5.00, 10.00, 'Ana Silva'),
  ('2025-06-02 14:30:00', 2, 1, 79.90, 79.90, 'Bruno Costa'),
  ('2025-06-03 11:00:00', 3, 3, 15.50, 46.50, 'Carla Santos');
