-- 1: Agendamento dos pacientes
-- Esta consulta retorna os nomes dos pacientes, juntamente com as datas e horários de seus agendamentos.
USE clinica2024;
SELECT p.Nome, a.dataHora AS DataHora
FROM Paciente p
JOIN Agendamento a ON p.Cpf = a.Paciente_Cpf;

-- 2: Total de Agendamentos por Paciente
-- Conta o total de agendamentos para cada paciente, garantindo que mesmo pacientes sem agendamentos apareçam com total igual a 0.
SELECT p.Nome, COUNT(a.Paciente_Cpf) AS Total_Agendamentos
FROM Paciente p
LEFT JOIN Agendamento a ON p.Cpf = a.Paciente_Cpf
GROUP BY p.Nome;

-- 3: Pacientes com seguros ---- ativos n pegou
-- Seleciona os pacientes que têm seguros ativos, exibindo o nome do paciente e o nome do seguro.
SELECT p.nome, s.nomeSeguradora AS seguro
FROM Paciente p
JOIN seguro s ON p.seguro_idseguro = s.idseguro;

-- 4: Histórico do pagamento dos pacientes
-- Mostra o histórico de pagamentos de cada paciente, incluindo a data e o valor pago.
SELECT p.Nome, fp.data_fatura, fp.valorTotal
FROM Paciente p
JOIN Fatura fp ON p.Cpf = fp.Paciente_Cpf;

-- 5: Pacientes que não agendaram consultas no último mês
-- Retorna os nomes dos pacientes que não realizaram agendamentos no último mês.
SELECT p.Nome
FROM Paciente p
WHERE p.Cpf NOT IN (
    SELECT a.Paciente_Cpf
    FROM Agendamento a
    WHERE a.dataHora >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
);

-- 6: Total de pacientes por tipo de seguro
-- Conta quantos pacientes existem para cada tipo de seguro, agrupando os resultados pelo nome do seguro.
SELECT s.nomeSeguradora AS tipo_seguro, COUNT(p.Cpf) AS Total_Pacientes
FROM Paciente p
JOIN seguro s ON p.seguro_idseguro = s.idseguro
GROUP BY s.nomeSeguradora;

-- 7: Profissionais com mais agendamentos no último trimestre
-- Esta consulta retorna os profissionais e o total de agendamentos realizados por eles nos últimos três meses, ordenando pelo total de agendamentos.
SELECT pf.nome AS Profissional, COUNT(p.Cpf) AS Total_Agendamentos 
FROM Profissional pf 
JOIN Agendamento a ON pf.cpf_profissional = a.profissional
JOIN Paciente p ON p.Cpf = a.Paciente_Cpf
WHERE a.dataHora >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY pf.nome 
ORDER BY Total_Agendamentos DESC;

-- 8: Agendamentos futuros por paciente ajeita
-- Retorna os agendamentos que estão agendados para datas futuras, mostrando o nome do paciente, a data e a hora.
SELECT p.nome, a.dataHora
FROM Paciente p
JOIN Agendamento a ON p.Cpf = a.Paciente_Cpf
WHERE a.dataHora > CURDATE();


-- 9: Total de pagamentos por forma de pagamento
-- Conta o total de valores pagos, agrupados pelo tipo de pagamento utilizado.
SELECT fp.Tipo, SUM(fp.Valor) AS Total
FROM FormaPagamento fp
GROUP BY fp.Tipo;

-- 10: Pacientes com Consultas Faltantes
-- Esta consulta conta o total de agendamentos que estão com status 'Pendente', agrupando por data.
SELECT p.Nome, COUNT(a.statusPaciente) AS Total_Faltas
FROM Paciente p
JOIN Agendamento a ON p.Cpf = a.Paciente_Cpf
WHERE a.statusPaciente = 'Pendente'
GROUP BY p.Nome
ORDER BY Total_Faltas DESC;

-- 11: Comparação de agendamentos mensais
-- Retorna o número total de agendamentos realizados em cada mês, agrupando pelo número do mês.
SELECT MONTH(a.dataHora) AS Mes, COUNT(a.idagendamento) AS Total_Agendamentos
FROM Agendamento a
GROUP BY MONTH(a.dataHora);

-- 12: Receita Total da Clínica por Mês
-- Esta consulta busca profissionais que têm menos de 5 pacientes atendidos, útil para identificar aqueles que precisam de mais clientes.
SELECT MONTH(fp.data_fatura) AS Mes, SUM(fp.valorTotal) AS Receita_Mensal
FROM Fatura fp
GROUP BY MONTH(fp.data_fatura)
ORDER BY Mes;

-- 13: Verifica os horários mais populares para consultas agendadas
SELECT HOUR(a.dataHora) AS Hora, COUNT(a.idagendamento) AS Total_Agendamentos
FROM Agendamento a
GROUP BY HOUR(a.dataHora)
ORDER BY Total_Agendamentos DESC;

-- 14 Agendamentos por Profissional em um dia Específico
SELECT 
    pf.Nome AS Profissional, 
    DAYNAME(a.dataHora) AS Dia_Semana, 
    COUNT(a.idagendamento) AS Total_Agendamentos
FROM 
    Profissional pf
JOIN 
    Agendamento a ON pf.cpf_profissional = a.profissional
WHERE 
    a.dataHora >= '2024-10-01' AND a.dataHora < '2024-11-01' -- Altere as datas conforme necessário
GROUP BY 
    pf.Nome, Dia_Semana
ORDER BY 
    Dia_Semana, Total_Agendamentos DESC;
    
-- 15 Profissionais abaixo da media salárial
SELECT 
    pf.cpf_profissional AS "cpf", 
    pf.nome AS "profissional", 
    pf.salario AS "salário"
FROM 
    Profissional pf   
WHERE 
    pf.salario < (SELECT AVG(salario) FROM profissional)
ORDER BY 
    pf.nome;

-- 16 quantidade de empregados e média salarial da clinica
SELECT 
    COUNT(*) AS Total_Profissionais,
    AVG(salario) AS Media_Salarial
FROM 
    Profissional;

--  17 A consulta abaixo lista os profissionais da clínica agrupados por especialização. 
SELECT 
    pf.especializacao AS "Especialização", 
    COUNT(pf.cpf_profissional) AS "Total de Profissionais", 
    GROUP_CONCAT(pf.nome SEPARATOR ', ') AS "Nomes dos Profissionais", -- agrupa em uma unica string
    AVG(pf.salario) AS "Média Salarial"
FROM 
    Profissional pf
GROUP BY 
    pf.especializacao
ORDER BY 
    pf.especializacao;
 
-- 18 Consultas Agendadas por Profissional
SELECT prof.nome AS Profissional, COUNT(a.idagendamento) AS Total_Agendamentos
FROM agendamento a
JOIN Profissional prof ON a.profissional = prof.cpf_profissional
GROUP BY prof.nome
ORDER BY Total_Agendamentos DESC;

-- 19 Total de Receita por Tipo de Procedimento
SELECT proc.nome AS Procedimento, SUM(f.valor) AS Receita_Total
FROM financeiro f
JOIN procedimento proc ON f.procedimento_idprocedimento = proc.idprocedimento
WHERE f.tipo = 'Receita'
GROUP BY proc.nome
ORDER BY Receita_Total DESC;

-- 20 media salarial por cargo
SELECT 
    c.nome_cargo AS Cargo, 
    AVG(p.salario) AS Media_Salarial
FROM 
    Profissional p
JOIN 
    cargo c ON p.cargo_cbo = c.cbo
GROUP BY 
    c.nome_cargo;
