ALTER TABLE agendamento
DROP FOREIGN KEY fk_agendamento_Paciente1;

ALTER TABLE agendamento
ADD CONSTRAINT fk_agendamento_Paciente1
FOREIGN KEY (Paciente_Cpf) REFERENCES Paciente(Cpf) ON DELETE CASCADE;

ALTER TABLE seguro
ADD COLUMN `dataEmissao` DATE NULL;

ALTER TABLE laboratorioExterno
DROP COLUMN `historicosTrabalhos`;

ALTER TABLE laboratorioExterno
CHANGE COLUMN enderecoLaboratorio_idenderecoLaboratorio enderecoLab INT;

ALTER TABLE formapagamento
CHANGE COLUMN qtdParcelas quantidade_parcela INT;

ALTER TABLE laboratorioExterno
CHANGE COLUMN enderecoLaboratorio_idenderecoLaboratorio enderecoLab INT;