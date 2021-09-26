--@block
use lead_gen_business;

-- EXAMPLE DATA QUERY
-- SELECT Date,TotalAllowance FROM Calculation WHERE EmployeeId=1 AND Date >= '2011/02/25' AND Date < '2011/02/28'      
--@block
select * from lead_gen_business.clients
--@block
select * from lead_gen_business.leads
--@block
select * from lead_gen_business.billing
--@block
select * from lead_gen_business.sites

--@block
-- 1. ¿Qué consulta ejecutaría para obtener los ingresos totales para marzo de 2012?
select  sum(amount) as revenue
from lead_gen_business.billing
where billing.charged_datetime >= '2012/03/01'
and billing.charged_datetime <= '2012/03/31'
-- group by client_id;

 --@block
-- 2. ¿Qué consulta ejecutaría para obtener los ingresos totales recaudados del cliente con una identificación de 2?
select sum(amount) as tota_ingresos_cliente_2
from lead_gen_business.clients
join lead_gen_business.billing on clients.client_id = billing.client_id
where clients.client_id = 2

--@block
-- 3. ¿Qué consulta ejecutaría para obtener todos los sitios que posee client = 10?
select domain_name
from lead_gen_business.clients
join lead_gen_business.sites on clients.client_id = sites.client_id
where sites.client_id = 10

--@block
-- 4. ¿Qué consulta ejecutaría para obtener el número total de sitios creados por mes por año para el cliente con una identificación de 1? ¿Qué pasa con el cliente = 20?
select concat(clients.first_name,' ', clients.last_name) as client_name, count(site_id) as total_de_sitios, date_format(created_datetime, "%M %Y")
from lead_gen_business.clients
join lead_gen_business.sites on clients.client_id = sites.client_id
where sites.client_id = 1
group by month(created_datetime), year(created_datetime)

--@block
-- 5. ¿Qué consulta ejecutaría para obtener el número total de clientes potenciales generados para cada uno de los sitios entre el 1 de enero de 2011 y el 15 de febrero de 2011?
select sites.domain_name, count(clients.client_id) as total_de_leads 
from lead_gen_business.clients
join lead_gen_business.sites on clients.client_id = sites.client_id
join lead_gen_business.leads on leads.site_id = sites.site_id
where leads.registered_datetime >= '2011/01/01'
and leads.registered_datetime <= '2011/02/15'
group by leads.site_id

--@block
-- 6. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada uno de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011?
select clients.first_name, clients.last_name, count(leads.leads_id) as number_of_leads
from lead_gen_business.clients
join lead_gen_business.sites on clients.client_id = sites.client_id
join lead_gen_business.leads on leads.site_id = sites.site_id
where leads.registered_datetime >= '2011/01/01'
and leads.registered_datetime <= '2011/12/31'
group by clients.client_id

--@block
-- 7. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada cliente cada mes entre los meses 1 y 6 del año 2011?
select clients.first_name, clients.last_name, count(leads.leads_id) as number_of_leads
from lead_gen_business.clients
join lead_gen_business.sites on clients.client_id = sites.client_id
join lead_gen_business.leads on leads.site_id = sites.site_id
where year(leads.registered_datetime) = '2011'
and month(leads.registered_datetime) >= '1'
and month(leads.registered_datetime) <= '6'
group by clients.client_id


--@block
-- 8. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada uno de los sitios de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011? Solicite esta consulta por ID de cliente. 
select clients.client_id, concat(clients.first_name,' ', clients.last_name) as client_name, sites.domain_name, count(leads.site_id), leads.registered_datetime
from lead_gen_business.clients
join lead_gen_business.sites on clients.client_id = sites.client_id
join lead_gen_business.leads on leads.site_id = sites.site_id
where leads.registered_datetime >= '2011/01/01'
and leads.registered_datetime <= '2011/12/31'
group by sites.domain_name
order by clients.client_id

--@block
-- Presente una segunda consulta que muestre todos los clientes, los nombres del sitio y el número total de clientes potenciales generados en cada sitio en todo momento.
select concat(clients.first_name,' ', clients.last_name), sites.domain_name, count(leads.leads_id) as total_of_leads
from lead_gen_business.clients
join lead_gen_business.sites on clients.client_id = sites.client_id
join lead_gen_business.leads on leads.site_id = sites.site_id
group by sites.domain_name
order by clients.client_id


--@block
-- 9. Escriba una sola consulta que recupere los ingresos totales recaudados de cada cliente para cada mes del año. Pídalo por ID de cliente.
select concat(clients.first_name,' ', clients.last_name), billing.amount, date_format(billing.charged_datetime, "%M") as month_charge, year(billing.charged_datetime) as year_charge
from lead_gen_business.clients
join lead_gen_business.billing on clients.client_id = billing.client_id
group by clients.client_id, year_charge, month_charge
order by clients.client_id,  year_charge

--@block
-- 10. Escriba una sola consulta que recupere todos los sitios que posee cada cliente. Agrupe los resultados para que cada fila muestre un nuevo cliente. Se volverá más claro cuando agregue un nuevo campo llamado 'sitios' que tiene todos los sitios que posee el cliente. (SUGERENCIA: use GROUP_CONCAT)
select clients.first_name, clients.last_name, group_concat(sites.domain_name separator ' / ')
from lead_gen_business.clients
join lead_gen_business.sites on clients.client_id = sites.client_id
group by clients.client_id
