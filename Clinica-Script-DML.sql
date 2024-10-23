-- Inserção de dados na tabela do paciente
USE clinica2024;

-- Inserção de dados na tabela seguro
insert into seguro (idseguro, nomeSeguradora, numeroApolice, cobertura) 
values 
(1, 'Bradesco Saúde', 'APOLICE123456', 'Cobertura completa de saúde'),
(2, 'Unimed', 'APOLICE123457', 'Cobertura parcial de saúde'),
(3, 'Hapvida', 'APOLICE123458', 'Cobertura de urgência e emergência'),
(4, 'Hospital Português', 'APOLICE123459', 'Cobertura de internação'),
(5, 'Hapvida', 'APOLICE123460', 'Cobertura de consultas e exames'),
(6, 'Unimed', 'APOLICE123461', 'Cobertura de saúde geral'),
(7, 'Hospital Português', 'APOLICE123462', 'Cobertura completa'),
(8, 'Saúde Caixa', 'APOLICE123463', 'Cobertura de emergências'),
(9, 'Golden Cross', 'APOLICE123464', 'Cobertura de exames e consultas'),
(10, 'Bradesco Saúde', 'APOLICE123465', 'Cobertura para internação e emergência');

-- Inserção de dados na tabela de enderecopaciente
insert into enderecopaciente (idendereco, UF, cidade, bairro, rua, numero, CEP)
values
(1, 'PE', 'Recife', 'Boa Viagem', 'Avenida Conselheiro Aguiar', '100', '51211-000'),
(2, 'PE', 'Recife', 'Pina', 'Rua do Sol', '200', '51220-000'),
(3, 'PE', 'Olinda', 'Varadouro', 'Rua da Luz', '300', '53020-000'),
(4, 'PE', 'Recife', 'Santo Amaro', 'Rua da Aurora', '400', '50050-000'),
(5, 'PE', 'Recife', 'Jardim São Paulo', 'Rua Siqueira Campos', '500', '51230-000'),
(6, 'PE', 'Recife', 'Graças', 'Rua do Comércio', '600', '51030-000'),
(7, 'PE', 'Olinda', 'Carmo', 'Rua da Paz', '700', '53050-000'),
(8, 'PE', 'Recife', 'San Martin', 'Avenida Boa Viagem', '800', '51010-000'),
(9, 'PE', 'Recife', 'Cordeiro', 'Rua Nova', '900', '51020-000'),
(10, 'PE', 'Olinda', 'Casa Caiada', 'Rua das Flores', '1000', '53030-000');

-- Inserção de dados na tabela de paciente
insert into Paciente (Cpf, nome, dataNasc, telefone, email, sexo, seguro_idseguro, enderecoPaciente_idendereco)
values 
('111.111.111-01', 'Maria Livia Soares da Silva', '1990-03-15', '81991111028', 'mlss@pe.senac.br', 'F', 1, 1),
('222.222.222-02', 'Maria Gabriella da Silva Calado', '1995-07-10', '81996666033', 'mgsc@pe.senac.br', 'F', 2, 2),
('333.333.333-03', 'João Pedro dos Santos', '1985-01-25', '81993222038', 'jpds@pe.senac.br', 'M', 3, 3),
('444.444.444-04', 'Ana Clara Oliveira', '2000-11-30', '81992222038', 'aco@pe.senac.br', 'F', 4, 4),
('555.555.555-05', 'Danilo Soares Farias', '1985-12-21', '81999999036','dsf@pe.senac.br', 'M', 5, 5),
('666.666.666-06', 'Lucas Pereira', '1988-01-10', '81995555050', 'lucas@pe.senac.br', 'M', 1, 6),
('777.777.777-07', 'Sofia Almeida', '1992-04-15', '81996666044', 'sofia@pe.senac.br', 'F', 2, 7),
('888.888.888-08', 'Ricardo Santos', '1980-09-20', '81993222099', 'ricardo@pe.senac.br', 'M', 3, 8),
('999.999.999-09', 'Gabriela Costa', '1986-05-22', '81992222055', 'gabriela@pe.senac.br', 'F', 4, 9),
('000.000.000-00', 'Fernando Oliveira', '1993-12-05', '81999999001', 'fernando@pe.senac.br', 'M', 5, 10);

-- Inserção de dados na tabela de cargo
insert into cargo (cbo, nome_cargo)
values 
(1, 'Médico'),
(2, 'Enfermeiro'),
(3, 'Recepcionista');

-- Inserção de dados na tabela do profissional
USE Clinica2024;
insert into Profissional (cpf_profissional, nome, sexo, dataNasc, email, telefone, especializacao, numRegProfissional, salario, cargo_cbo)
values 
('555.555.555-32', 'Lucas Vinícius Braga', 'M', '1990-07-20', 'lucas.braga@pe.senac.br', '81995555032', 'Odontopediatria', '160', 2500, 1),
('666.666.666-33', 'Fernanda Almeida', 'F', '1985-10-15', 'fernanda.almeida@pe.senac.br', '81996666012', 'Dermatologia', '161', 3000, 2),
('777.777.777-34', 'Carlos Henrique', 'M', '1992-11-12', 'carlos.henrique@pe.senac.br', '81993222009', 'Pediatria', '162', 2800, 1),
('888.888.888-35', 'Juliana Costa', 'F', '1988-05-14', 'juliana.costa@pe.senac.br', '81992222080', 'Ginecologia', '163', 3200, 3),
('999.999.999-36', 'Roberto Ferreira', 'M', '1980-03-22', 'roberto.ferreira@pe.senac.br', '81999999090', 'Oftalmologia', '164', 3500, 2),
('111.111.111-37', 'Ana Paula', 'F', '1989-06-30', 'ana.paula@pe.senac.br', '81995555101', 'Clínica Geral', '165', 2400, 1),
('222.222.222-38', 'Rafael Lima', 'M', '1987-04-10', 'rafael.lima@pe.senac.br', '81996666102', 'Cirurgia', '166', 4000, 3),
('333.333.333-39', 'Isabela Santos', 'F', '1991-08-01', 'isabela.santos@pe.senac.br', '81993222103', 'Neurologia', '167', 3700, 2),
('444.444.444-40', 'Mariana Oliveira', 'F', '1995-09-19', 'mariana.oliveira@pe.senac.br', '81992222104', 'Psicologia', '168', 2600, 3),
('555.555.555-41', 'Fernando Almeida', 'M', '1982-12-02', 'fernando.almeida@pe.senac.br', '81999999105', 'Ortopedia', '169', 3200, 1);

-- Inserção de dados na tabela laboratorioExterno
insert into laboratorioExterno (idlaboratorioExterno, nome, telefone, historicosTrabalhos, enderecoLaboratorio_idenderecoLaboratorio)
values 
(1, 'Laboratório São Marcos', '81998888222', 'Laboratório de análises clínicas',1),
(2, 'Laboratório Vida', '81997777111', 'Laboratório de exames de imagem', 2),
(3, 'Laboratório 4U', '81996666044', 'Laboratório de análises toxicológicas',3),
(4, 'Laboratório Boa Saúde', '81995555055', 'Laboratório de exames laboratoriais',4),
(5, 'Laboratório Medicina & Saúde', '81994444000', 'Laboratório de análises gerais',5),
(6, 'Laboratório Vida Saudável', '81993333000', 'Laboratório de exames de sangue',6),
(7, 'Laboratório Saúde em Dia', '81992222000', 'Laboratório de diagnóstico médico',7),
(8, 'Laboratório X', '81991111000', 'Laboratório de análises clínicas e exames',8),
(9, 'Laboratório Omega', '81990000111', 'Laboratório de genética',9),
(10, 'Laboratório Prime', '81988999222', 'Laboratório de análises especializadas',10);

-- Inserção de dados na tabela enderecoLaboratorio
insert into enderecoLaboratorio (idenderecoLaboratorio, UF, cidade, bairro, rua, numero, CEP)
values 
(1,'PE', 'Recife', 'Boa Viagem', 'Avenida Boa Viagem', '100', '51200-000'),
(2,'PE', 'Recife', 'Pina', 'Rua do Sol', '200', '51220-000'),
(3,'PE', 'Olinda', 'Varadouro', 'Rua da Luz', '300', '53020-000'),
(4,'PE', 'Recife', 'Santo Amaro', 'Rua da Aurora', '400', '50050-000'),
(5,'PE', 'Recife', 'Jardim São Paulo', 'Rua Siqueira Campos', '500', '51230-000'),
(6,'PE', 'Recife', 'Graças', 'Rua do Comércio', '600', '51030-000'),
(7,'PE', 'Olinda', 'Carmo', 'Rua da Paz', '700', '53050-000'),
(8,'PE', 'Recife', 'San Martin', 'Avenida Boa Viagem', '800', '51010-000'),
(9,'PE', 'Recife', 'Cordeiro', 'Rua Nova', '900', '51020-000'),
(10,'PE', 'Olinda', 'Casa Caiada', 'Rua das Flores', '1000', '53030-000');

-- Inserção de dados na tabela procedimento
insert into procedimento (idprocedimento, nome, descricao, custo, Profissional_cpf_profissional, laboratorioExterno_idlaboratorioExterno)
values 
(1, 'Consulta Odontológica', 'Consulta inicial para avaliação dental', 150.00, '555.555.555-32', NULL),
(2, 'Limpeza Dental', 'Procedimento para remoção de placa e tártaro', 120.00, '666.666.666-33', NULL),
(3, 'Raios-X Dentário', 'Exame radiográfico dos dentes e mandíbulas', 80.00, '777.777.777-34', NULL),
(4, 'Tratamento de Cárie', 'Procedimento para remoção de cárie e restauração', 200.00, '888.888.888-35', NULL),
(5, 'Tratamento de Canal', 'Endodontia para salvar um dente comprometido', 600.00, '999.999.999-36', NULL),
(6, 'Extração de Dente', 'Remoção de dente danificado ou comprometido', 250.00, '111.111.111-37', NULL),
(7, 'Colocação de Aparelho Ortodontia', 'Instalação de aparelho dental para correção', 1500.00, '222.222.222-38', NULL),
(8, 'Limpeza Profunda', 'Limpeza mais abrangente para gengivas e dentes', 180.00, '333.333.333-39', NULL),
(9, 'Clareamento Dental', 'Procedimento para clareamento dos dentes', 400.00, '444.444.444-40', NULL);

-- Inserção de dados na tabela agendamento
insert into agendamento (idagendamento, dataHora, estadoPaciente, Paciente_Cpf, procedimento_idprocedimento, Profissional_cpf_profissional)
values 
(1,'2024-10-17 09:00:00', 'Ativo', '111.111.111-01', 1, '555.555.555-32'),
(2,'2024-10-17 10:00:00', 'Ativo', '222.222.222-02', 2, '666.666.666-33'),
(3,'2024-10-17 11:00:00', 'Cancelado', '333.333.333-03', 3, '777.777.777-34'),
(4,'2024-10-17 12:00:00', 'Ativo', '444.444.444-04', 1, '888.888.888-35'),
(5,'2024-10-17 13:00:00', 'Ativo', '555.555.555-05', 2, '999.999.999-36'),
(6,'2024-10-17 14:00:00', 'Ativo', '666.666.666-06', 3, '111.111.111-37'),
(7,'2024-10-17 15:00:00', 'Ativo', '777.777.777-07', 1, '222.222.222-38'),
(8,'2024-10-17 16:00:00', 'Ativo', '888.888.888-08', 2, '333.333.333-39'),
(9,'2024-10-17 17:00:00', 'Ativo', '999.999.999-09', 3, '444.444.444-40'),
(10,'2024-10-17 18:00:00', 'Ativo', '000.000.000-00', 1, '555.555.555-41');

-- Inserção de dados na tabela registro clinico
insert into registroClinico (idregistroClinico, dataRegistro, diagnostico, tratamento, prescrisoes, Paciente_Cpf, Profissional_cpf_profissional) 
values (1, '2024-10-15', 'Consulta Odontológica', 'Consulta inicial para avaliação dental', 'Prescrição: uso de creme dental','111.111.111-01', '555.555.555-32'),
(2, '2024-10-15', 'Limpeza Dental', 'Procedimento para remoção de placa e tártaro', 'Prescrição: uso de fio dental', '222.222.222-02', '666.666.666-33'),
(3, '2024-10-15', 'Raios-X Dentário', 'Exame radiográfico dos dentes e mandíbulas', 'Prescrição: observar resultados', '333.333.333-03','777.777.777-34'),
(4, '2024-10-15', 'Tratamento de Cárie', 'Procedimento para remoção de cárie e restauração', 'Prescrição: evitar doces', '444.444.444-04','888.888.888-35'),
(5, '2024-10-15', 'Tratamento de Canal', 'Endodontia para salvar um dente comprometido', 'Prescrição: medicação antibiótica','555.555.555-05',  '999.999.999-36'),
(6, '2024-10-15', 'Extração de Dente', 'Remoção de dente danificado ou comprometido', 'Prescrição: analgésicos', '666.666.666-06', '111.111.111-37'),
(7, '2024-10-15', 'Colocação de Aparelho Ortodontia', 'Instalação de aparelho dental para correção', 'Prescrição: retorno em 30 dias', '777.777.777-07', '222.222.222-38'),
(8, '2024-10-15', 'Limpeza Profunda', 'Limpeza mais abrangente para gengivas e dentes', 'Prescrição: cuidados pós-limpeza', '888.888.888-08' ,'333.333.333-39'),
(9, '2024-10-15', 'Clareamento Dental', 'Procedimento para clareamento dos dentes', 'Prescrição: evitar alimentos corantes', '999.999.999-09','444.444.444-40');

-- Inserção de dados na tabela formaPagamento
insert into formaPagamento (idformaPagamento, tipo, valor, qtdParcelas, desconto, fatura_idfatura)
values
(1, 'Cartão de Crédito', 150.00, 1, 0.00, 1),  
(2, 'Dinheiro', 120.00, 1, 0.00, 2),           
(3, 'Cartão de Débito', 80.00, 1, 0.00, 3),     
(4, 'Cheque', 200.00, 1, 0.00, 4),              
(5, 'Transferência', 600.00, 1, 0.00, 5),       
(6, 'Cartão de Crédito', 250.00, 1, 0.00, 6),  
(7, 'Dinheiro', 400.00, 1, 0.00, 7),            
(8, 'Cartão de Crédito', 1500.00, 12, 0.00, 8), -- (parcelada)
(9, 'Transferência', 180.00, 1, 0.00, 9),       
(10, 'Dinheiro', 500.00, 1, 0.00, 10),           
(11, 'Cartão de Crédito', 2000.00, 1, 0.00, 11), 
(12, 'Cheque', 300.00, 1, 0.00, 12);             

-- Inserção de dados na tabela financeiro

insert into financeiro (idfinanceiro, tipo, datadocusto, descricao, valor, procedimento_idprocedimento, Profissional_cpf_profissional)
values 
(1, 'Receita', '2024-10-15', 'Receita de Consulta Odontológica', 150.00, 1, '555.555.555-32'),
(2, 'Receita', '2024-10-15', 'Receita de Limpeza Dental', 120.00, 2, '666.666.666-33'),
(3, 'Receita', '2024-10-15', 'Receita de Raios-X Dentário', 80.00, 3, '777.777.777-34'),
(4, 'Receita', '2024-10-15', 'Receita de Tratamento de Cárie', 200.00, 4, '888.888.888-35'),
(5, 'Receita', '2024-10-15', 'Receita de Tratamento de Canal', 600.00, 5, '999.999.999-36'),
(6, 'Receita', '2024-10-15', 'Receita de Extração de Dente', 250.00, 6, '111.111.111-37'),
(7, 'Receita', '2024-10-15', 'Receita de Clareamento Dental', 400.00, 9, '444.444.444-40'),
(8, 'Receita', '2024-10-15', 'Receita de Colocação de Aparelho Ortodontia', 1500.00, 7, '222.222.222-38'),
(9, 'Receita', '2024-10-15', 'Receita de Limpeza Profunda', 180.00, 8, '333.333.333-39'),
(10, 'Despesa', '2024-10-01', 'Compra de materiais odontológicos', 500.00, NULL, NULL),
(11, 'Despesa', '2024-10-05', 'Pagamento de aluguel', 2000.00, NULL, NULL),
(12, 'Despesa', '2024-10-10', 'Contas de água e luz', 300.00, NULL, NULL);

-- Inserção de dados na tabela fatura
SELECT * FROM fatura;
insert into fatura (idfatura, data_fatura, valorTotal, status_pagamento, financeiro_idfinanceiro, Paciente_Cpf, procedimento_idprocedimento)
values
(1, '2024-10-15', 150.00, 'Pendente', 1, '111.111.111-01', 1),
(2, '2024-10-15', 120.00, 'Pendente', 2, '222.222.222-02', 2),
(3, '2024-10-15', 80.00, 'Pendente', 3, '333.333.333-03', 3),
(4, '2024-10-15', 200.00, 'Pendente', 4, '444.444.444-04', 4),
(5, '2024-10-15', 600.00, 'Pendente', 5, '555.555.555-05', 5),
(6, '2024-10-15', 250.00, 'Pendente', 6, '666.666.666-06', 6),
(7, '2024-10-15', 400.00, 'Pendente', 7, '777.777.777-07', 9),
(8, '2024-10-15', 1500.00, 'Pendente', 8, '888.888.888-08', 7),
(9, '2024-10-15', 180.00, 'Pendente', 9, '999.999.999-09', 8),
(10, '2024-10-01',500.00,'Pendente', 10, NULL, NULL),
(11, '2024-10-05', 2000.00, 'Pendente', 11, NULL, NULL),
(12, '2024-10-10', 300.00, 'Pendente', 12, NULL, NULL);

-- Atualiza o telefone da paciente Ana Clara Oliveira
UPDATE Paciente 
SET telefone = '81999999000' 
WHERE Cpf = '444.444.444-04';

UPDATE Profissional
SET especializacao = 'Odontopediatria'
WHERE cpf_profissional = '555.555.555-32';

UPDATE Profissional
SET especializacao = 'Ortodontia'
WHERE cpf_profissional = '666.666.666-33';

UPDATE Profissional
SET especializacao = 'Pediatria Odontológica'
WHERE cpf_profissional = '777.777.777-34';

UPDATE Profissional
SET especializacao = 'Periodontia'
WHERE cpf_profissional = '888.888.888-35';

UPDATE Profissional
SET especializacao = 'Oftalmologia Odontológica'
WHERE cpf_profissional = '999.999.999-36';

UPDATE Profissional
SET especializacao = 'Clínica Geral Odontológica'
WHERE cpf_profissional = '111.111.111-37';

UPDATE Profissional
SET especializacao = 'Cirurgia Bucomaxilofacial'
WHERE cpf_profissional = '222.222.222-38';

UPDATE Profissional
SET especializacao = 'Neurologia Odontológica'
WHERE cpf_profissional = '333.333.333-39';

UPDATE Profissional
SET especializacao = 'Psicologia Odontológica'
WHERE cpf_profissional = '444.444.444-40';

UPDATE Profissional
SET especializacao = 'Ortopedia Odontológica'
WHERE cpf_profissional = '555.555.555-41';

SET SQL_SAFE_UPDATES = 0;
UPDATE fatura
SET status_pagamento = 'Pago'
WHERE status_pagamento = 'Pendente';

DELETE FROM agendamento WHERE Paciente_Cpf = '000.000.000-00';
