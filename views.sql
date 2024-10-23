USE clinica2024;

-- 1: View para Agendamento dos Pacientes
CREATE VIEW vw_agendamentos_pacientes AS
SELECT p.Nome, a.dataHora AS DataHora
FROM Paciente p
JOIN Agendamento a ON p.Cpf = a.Paciente_Cpf;

-- 2: View para Pacientes com Seguros
CREATE VIEW vw_pacientes_com_seguros AS
SELECT p.Nome, s.nomeSeguradora AS Seguro
FROM Paciente p
JOIN seguro s ON p.seguro_idseguro = s.idseguro;

-- 3: View para Histórico de Pagamentos dos Pacientes
CREATE VIEW vw_historico_pagamentos AS
SELECT p.Nome, fp.data_fatura, fp.valorTotal
FROM Paciente p
JOIN Fatura fp ON p.Cpf = fp.Paciente_Cpf;

-- 4: View para Profissionais com mais agendamentos no último trimestre
CREATE VIEW vw_profissionais_com_mais_agendamentos_ultimo_trimestre AS
SELECT pf.nome AS Profissional, COUNT(p.Cpf) AS Total_Agendamentos 
FROM Profissional pf 
JOIN Agendamento a ON pf.cpf_profissional = a.profissional
JOIN Paciente p ON p.Cpf = a.Paciente_Cpf
WHERE a.dataHora >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY pf.nome 
ORDER BY Total_Agendamentos DESC;

-- 8: View para Total de Pagamentos por Forma de Pagamento
CREATE VIEW vw_total_pagamentos_por_forma_pagamento AS
SELECT fp.Tipo, SUM(fp.Valor) AS Total
FROM FormaPagamento fp
GROUP BY fp.Tipo;

-- 9: View para Pacientes com Consultas Faltantes
CREATE VIEW vw_pacientes_com_faltas AS
SELECT p.Nome, COUNT(a.statusPaciente) AS Total_Faltas
FROM Paciente p
JOIN Agendamento a ON p.Cpf = a.Paciente_Cpf
WHERE a.statusPaciente = 'Pendente'
GROUP BY p.Nome
ORDER BY Total_Faltas DESC;

-- 10 View Total de Receita por Tipo de Procedimento
CREATE VIEW ReceitaPorProcedimento AS
SELECT 
    proc.nome AS Procedimento, 
    SUM(f.valor) AS Receita_Total
FROM 
    financeiro f
JOIN 
    procedimento proc ON f.procedimento_idprocedimento = proc.idprocedimento
WHERE 
    f.tipo = 'Receita'
GROUP BY 
    proc.nome
ORDER BY 
    Receita_Total DESC;

